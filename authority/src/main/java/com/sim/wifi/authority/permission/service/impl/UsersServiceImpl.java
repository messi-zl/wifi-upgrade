package com.sim.wifi.authority.permission.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sim.wifi.authority.common.exception.Asserts;
import com.sim.wifi.authority.dto.UpdateUsersPasswordParam;
import com.sim.wifi.authority.dto.UsersParam;
import com.sim.wifi.authority.permission.model.Permissions;
import com.sim.wifi.authority.permission.model.Users;
import com.sim.wifi.authority.permission.mapper.UsersMapper;
import com.sim.wifi.authority.permission.service.PermissionsService;
import com.sim.wifi.authority.permission.service.UsersService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sim.wifi.authority.security.securityExpand.CustomUserDetails;
import com.sim.wifi.authority.security.util.JwtTokenUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * description: 用户表 服务实现类
 * create by: li.zheng871@sim.com
 * create time: 2021/7/9
 */
@Transactional
@Service
public class UsersServiceImpl extends ServiceImpl<UsersMapper, Users> implements UsersService {
    private static final Logger logger = LoggerFactory.getLogger(UsersServiceImpl.class);


    @Value("${login-lock-info.range-time}")
    private String rangeTime;
    @Value("${login-lock-info.max-fail-count}")
    private Integer maxFailCount;
    @Value("${login-lock-info.maintain-lock-time}")
    private Integer maintainLockTime;
    @Autowired
    private PermissionsService permissionsService;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Override
    public UserDetails loadUserByUsername(String username) {
        Users users = getUserByUserName(username);
        if (users != null) {
            List<Permissions> permissionsList = permissionsService.getPermissionsList(users.getId(), PermissionsService.TYPE_BUTTON);
            return new CustomUserDetails(users, permissionsList);
        }
        throw new UsernameNotFoundException("由用户名未找到正确用户，用户名或密码错误！");
    }

    @Override
    public Users getUserByUserName(String userName) {
        QueryWrapper<Users> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(Users::getUsername, userName);
        List<Users> usersList = list(wrapper);
        if (usersList != null && usersList.size() > 0) {
            Users users = usersList.get(0);
            return users;
        }
        return null;
    }


    @Override
    public String login(String username, String password) {
        logger.info("开始登录，用户名：{}，密码：{}", username, password);
        String token = null;
        //密码需要客户端加密后传递
        try {
            UserDetails userDetails = loadUserByUsername(username);
            if (!passwordEncoder.matches(password, userDetails.getPassword())) {
                //todo 只有密码错误次数需记录
                Asserts.fail("密码错误，请重新输入！");
            }
            if (!userDetails.isEnabled()) {
                Asserts.fail("您的账户已禁用，如需恢复请与管理员联系！");
            }
            UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
            SecurityContextHolder.getContext().setAuthentication(authentication);
            token = jwtTokenUtil.generateToken(userDetails);
//            updateLoginTimeByUsername(username);
//            insertLoginLog(username);
        } catch (AuthenticationException e) {
            logger.warn("登录异常:{}", e.getMessage());
        }
        return token;
    }


    @Override
    public Users register(UsersParam usersParam) {
        logger.info("开始注册！！！注册参数为{}", usersParam.toString());
        Users user = new Users();
        BeanUtils.copyProperties(usersParam, user);
        user.setStatus(UsersService.STATUS_ENABLE);//设为启用
        user.setFailLoginCount(0);//设登录失败次数为0
        //查询是否有相同用户名的用户
        QueryWrapper<Users> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(Users::getUsername, user.getUsername());
        List<Users> userList = list(wrapper);
        if (userList.size() > 0) {
            logger.warn("Users表中已经有了用户名：{}，导致注册失败！", user.getUsername());
            return null;
        }
        //将密码进行加密操作
        String encodePassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(encodePassword);
        baseMapper.insert(user);
        return user;
    }

    @Override
    public String refreshToken(String oldToken) {
        return jwtTokenUtil.refreshHeadToken(oldToken);
    }

    @Override
    public boolean update(Integer userId, Users user) {
        user.setId(userId);
        Users rawUser = getById(userId);
        if (rawUser.getPassword().equals(user.getPassword())) {
            //与原加密密码相同的不需要修改
            user.setPassword(null);
        } else {
            //与原加密密码不同的需要加密修改
            if (StrUtil.isEmpty(user.getPassword())) {
                user.setPassword(null);
            } else {
                user.setPassword(passwordEncoder.encode(user.getPassword()));
            }
        }
        boolean success = updateById(user);
        //userCacheService.delUser(userId);
        return success;
    }

    @Override
    public int updatePassword(UpdateUsersPasswordParam updateUsersPasswordParam) {
        if (StrUtil.isEmpty(updateUsersPasswordParam.getUsername())
                || StrUtil.isEmpty(updateUsersPasswordParam.getOldPassword())
                || StrUtil.isEmpty(updateUsersPasswordParam.getNewPassword())) {
            return -1;
        }
        QueryWrapper<Users> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(Users::getUsername, updateUsersPasswordParam.getUsername());
        List<Users> userList = list(wrapper);
        if (CollUtil.isEmpty(userList)) {
            return -2;
        }
        Users user = userList.get(0);
        if (!passwordEncoder.matches(updateUsersPasswordParam.getOldPassword(), user.getPassword())) {
            return -3;
        }
        user.setPassword(passwordEncoder.encode(updateUsersPasswordParam.getNewPassword()));
        updateById(user);
        //userCacheService.delUser(user.getId());
        return 1;
    }


    //密码错误-失败次数增加
    public void addFailLoginCount(Users user) {
        Integer failLoginCount = user.getFailLoginCount();
        user.setFailLoginCount(failLoginCount + 1);
        //当规定时间内失败次数已到次数，则需要增加截止时间
        if (user.getFailLoginCount()  == maxFailCount && true){
            //在30min内失败次数达到5次
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(DateUtil.date());
            calendar.add(Calendar.MINUTE,maintainLockTime);
            user.setLockingTime(DateUtil.date(calendar));//限制截止时间
        }
        save(user);
    }



    //失败限制还原
    public void restore(Users user) {
        //失败次数+截止时间
        user.setFailLoginCount(0);
        user.setLockingTime(null);
        updateById(user);
    }

    //入口校验  是否在截止时间之内
    public void check() {
        //过了截止时间   清零次数+截止时间还原
    }


}
