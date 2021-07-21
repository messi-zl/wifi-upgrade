package com.sim.wifi.authority.permission.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateUnit;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sim.wifi.authority.common.api.CommonResult;
import com.sim.wifi.authority.dto.UpdateUsersPasswordParam;
import com.sim.wifi.authority.dto.UsersParam;
import com.sim.wifi.authority.permission.mapper.UsersMapper;
import com.sim.wifi.authority.permission.model.LoginLogs;
import com.sim.wifi.authority.permission.model.Permissions;
import com.sim.wifi.authority.permission.model.Users;
import com.sim.wifi.authority.permission.service.LoginLogsService;
import com.sim.wifi.authority.permission.service.PermissionsService;
import com.sim.wifi.authority.permission.service.UsersService;
import com.sim.wifi.authority.security.config.CustomUserDetails;
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

import java.util.*;
import java.util.stream.Collectors;

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
    private Integer rangeTime;
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
    @Autowired
    private LoginLogsService loginLogsService;


    @Override
    public UserDetails loadUserByUsername(String username) {
        Users users = getUserByUserName(username);
        if (users != null) {
            List<Permissions> permissionsList = permissionsService.getPermissionsList(users.getId(), PermissionsService.TYPE_BUTTON);
            return new CustomUserDetails(users, permissionsList);
        }
        throw new UsernameNotFoundException("用户名错误，请重新输入！");
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
    public Map<String, String> login(String username, String password) {
        logger.info("开始登录，用户名：{}，密码：{}", username, password);
        Map<String, String> map = new HashMap<>();
        String token = null;
        //密码需要客户端加密后传递
        UserDetails userDetails = null;
        try {
            userDetails = loadUserByUsername(username);
        } catch (AuthenticationException e) {
            map.put("errorMessage", e.getMessage());
            return map;
        }
        Date now = DateUtil.parse(DateUtil.now(), DatePattern.NORM_DATETIME_PATTERN);
        //判断是否在锁定时间内
        CustomUserDetails customUserDetails = (CustomUserDetails) userDetails;
        Users user = customUserDetails.getUsers();
        Integer flag = checkInLockingTime(user, now);
        switch (flag) {
            case -1:
                String info = "";
                if (DateUtil.between(user.getLockingTime(), now, DateUnit.MINUTE) != 0) {
                    info = DateUtil.between(user.getLockingTime(), now, DateUnit.MINUTE) + "分钟";
                } else {
                    info = DateUtil.between(user.getLockingTime(), now, DateUnit.SECOND) + "秒";
                }
                map.put("errorMessage", "密码错误已超过" + maxFailCount + "次，请" + info + "之后再次登陆！");
                return map;
            case 0:
                break;
            case 1:
                restoreAll(user);
                break;
            default:
        }
        if (!passwordEncoder.matches(password, userDetails.getPassword())) {
            passwordFailDeal(user, now);
            //Asserts.fail("密码错误，请重新输入！");移到controller，否则事务会回滚,登录日志不会save
            map.put("errorMessage", "密码错误，请重新输入！");
            return map;
        }
        restoreFailLoginCount(user, now);
        if (!userDetails.isEnabled()) {
            map.put("errorMessage", "您的账户已禁用，如需恢复请与管理员联系！");
            return map;
        }
        UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(authentication);
        token = jwtTokenUtil.generateToken(userDetails);
        map.put("token", token);
        return map;
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
        user.setCreatedOn(DateUtil.parse(DateUtil.now(), DatePattern.NORM_DATETIME_PATTERN));
        baseMapper.insert(user);
        return user;
    }

    @Override
    public String refreshToken(String oldToken) {
        return jwtTokenUtil.refreshHeadToken(oldToken);
    }


    @Override
    public CommonResult getUserInfo(String username) {
        if (StrUtil.isBlank(username)) {
            return CommonResult.failed("用户名为空");
        }
        Users user = getUserByUserName(username);
        Map<String, Object> data = new HashMap<>();
        data.put("username", user.getUsername());
        //得到该用户拥有的所有权限
        List<Permissions> permissionsList = permissionsService.getPermissionsList(user.getId(), null);
        data.put("directorys", permissionsList.stream().filter(permission -> permission.getType().compareTo(PermissionsService.TYPE_DIRECTORY) == 0).collect(Collectors.toList()));
        data.put("menus", permissionsList.stream().filter(permission -> permission.getType().compareTo(PermissionsService.TYPE_MENU) == 0).collect(Collectors.toList()));
        data.put("buttons", permissionsList.stream().filter(permission -> permission.getType().compareTo(PermissionsService.TYPE_BUTTON) == 0).collect(Collectors.toList()));
/*        data.put("icon", umsAdmin.getIcon());
        List<UmsRole> roleList = adminService.getRoleList(umsAdmin.getId());
        if(CollUtil.isNotEmpty(roleList)){
            List<String> roles = roleList.stream().map(UmsRole::getName).collect(Collectors.toList());
            data.put("roles",roles);
        }*/
        logger.info("获取当前登录用户的信息成功");
        return CommonResult.success(data);
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
        user.setChangedOn(DateUtil.parse(DateUtil.now(), DatePattern.NORM_DATETIME_PATTERN));
        //todo 修改人
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
        user.setChangedOn(DateUtil.parse(DateUtil.now(), DatePattern.NORM_DATETIME_PATTERN));
        //todo  修改人
        updateById(user);
        //userCacheService.delUser(user.getId());
        return 1;
    }


    //入口校验，由用户名判断其是否在登录截止时间之内
    private Integer checkInLockingTime(Users user, Date now) {
        Date lockingTime = user.getLockingTime();
        if (lockingTime == null) {
            return 0;
        }
        if (now.after(lockingTime)) {
            //已超锁定时间
            return 1;
        } else {
            //仍在锁定时间范围内,包含等于
            return -1;
        }

    }

    //已过锁定时间--失败限制还原
    private void restoreAll(Users user) {
        //失败次数+截止时间
        user.setFailLoginCount(0);
        user.setLockingTime(null);
        updateById(user);

    }

    //密码正确--失败次数清零,登录日志新加
    private void restoreFailLoginCount(Users user, Date now) {
        LoginLogs loginLogs = new LoginLogs();
        loginLogs.setLoginTime(now);
        loginLogs.setUseId(user.getId());
        loginLogs.setStatus(LoginLogsService.STATUS_SUCCESS);
        loginLogsService.save(loginLogs);
        if (user.getFailLoginCount() != 0){
            user.setFailLoginCount(0);
            updateById(user);
        }
    }


    //密码错误处理
    private void passwordFailDeal(Users user, Date now) {
        //加到失败日志表中,用于判断是否规定时间内的错误
        LoginLogs loginLogs = new LoginLogs();
        loginLogs.setLoginTime(now);
        loginLogs.setUseId(user.getId());
        loginLogs.setStatus(LoginLogsService.STATUS_FAIL);
        loginLogsService.save(loginLogs);

        Integer failLoginCount = user.getFailLoginCount();
        user.setFailLoginCount(failLoginCount + 1);
        //当规定时间内失败次数已到次数，则需要增加截止时间
        if (user.getFailLoginCount() >= maxFailCount && checkErrorNum(user.getId(), now)) {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(now);
            calendar.add(Calendar.MINUTE, maintainLockTime);
            user.setLockingTime(DateUtil.date(calendar));//限制截止时间
        }
        updateById(user);
    }

    //判断规定时间范围内连续错误次数是否超过规定次数
    private Boolean checkErrorNum(Integer userId, Date now) {
        Boolean flag = false;
        List<LoginLogs> loginLogsList = loginLogsService.lockNode(userId, rangeTime, now, LoginLogsService.STATUS_FAIL);
        if (loginLogsList != null && loginLogsList.size() >= maxFailCount) {
            flag = true;
        }
        return flag;
    }


}
