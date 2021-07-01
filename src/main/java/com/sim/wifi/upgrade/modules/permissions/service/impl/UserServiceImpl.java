package com.sim.wifi.upgrade.modules.permissions.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sim.wifi.upgrade.common.exception.Asserts;
import com.sim.wifi.upgrade.domain.MyUserDetails;
import com.sim.wifi.upgrade.modules.permissions.dto.UpdateUserPasswordParam;
import com.sim.wifi.upgrade.modules.permissions.dto.UserParam;
import com.sim.wifi.upgrade.modules.permissions.mapper.RoleMapper;
import com.sim.wifi.upgrade.modules.permissions.mapper.UserRoleMapper;
import com.sim.wifi.upgrade.modules.permissions.model.Resource;
import com.sim.wifi.upgrade.modules.permissions.model.Role;
import com.sim.wifi.upgrade.modules.permissions.model.User;
import com.sim.wifi.upgrade.modules.permissions.mapper.UserMapper;
import com.sim.wifi.upgrade.modules.permissions.model.UserRole;
import com.sim.wifi.upgrade.modules.permissions.service.ResourceService;
import com.sim.wifi.upgrade.modules.permissions.service.UserCacheService;
import com.sim.wifi.upgrade.modules.permissions.service.UserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sim.wifi.upgrade.security.util.JwtTokenUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * description:
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
@Transactional
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
    private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private UserCacheService userCacheService;
    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private UserRoleMapper userRoleMapper;
    @Autowired
    private JwtTokenUtil jwtTokenUtil;
    @Autowired
    private ResourceService resourceService;

    @Override
    public UserDetails loadUserByUsername(String username) {
        //获取用户信息
        User user = getUserByUsername(username);
        if (user != null) {
            List<Resource> resourceList = resourceService.getResourceList(user.getId());
            return new MyUserDetails(user, resourceList);
        }
        throw new UsernameNotFoundException("用户名或密码错误");
    }

    @Override
    public User getUserByUsername(String username) {
        User user = userCacheService.getUser(username);
        if (user != null) return user;
        QueryWrapper<User> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(User::getUsername, username);
        List<User> adminList = list(wrapper);
        if (adminList != null && adminList.size() > 0) {
            user = adminList.get(0);
            userCacheService.setUser(user);
            return user;
        }
        return null;
    }


    @Override
    public User register(UserParam userParm) {
        logger.info("开始注册！！！注册参数为{}",userParm.toString());
        User user = new User();
        BeanUtils.copyProperties(userParm, user);
        user.setActive(true);
        //查询是否有相同用户名的用户
        QueryWrapper<User> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(User::getUsername, user.getUsername());
        List<User> userList = list(wrapper);
        if (userList.size() > 0) {
            logger.error("User表中已经有了用户名：{}，导致注册失败！" + user.getUsername());
            return null;
        }
        //将密码进行加密操作
        String encodePassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(encodePassword);
        baseMapper.insert(user);
        //往角色表插入默认数据
        UserRole userRole = new UserRole();
        userList = list(wrapper);
        Role role = new Role();
        role.setId(userList.get(0).getId());
        role.setName(user.getUsername());
        roleMapper.insert(role);
        //往用户与角色对应表插入默认数据
        QueryWrapper<Role> wrapper2 = new QueryWrapper<>();
        wrapper2.lambda().eq(Role::getName, role.getName());
        List<Role> roleList = roleMapper.selectList(wrapper2);
        userRole.setUserId(userList.get(0).getId());
        userRole.setRoleId(roleList.get(0).getId());
        userRole.setId(userList.get(0).getId());
        userRoleMapper.insert(userRole);
        return user;
    }

    @Override
    public String login(String username, String password) {
        logger.info("开始登录，用户名：{}，密码：{}",username,password);
        String token = null;
        //密码需要客户端加密后传递
        try {
            UserDetails userDetails = loadUserByUsername(username);
            if (!passwordEncoder.matches(password, userDetails.getPassword())) {
                Asserts.fail("密码不正确");
            }
            if (!userDetails.isEnabled()) {
                Asserts.fail("帐号已被禁用");
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
    public String refreshToken(String oldToken) {
        return jwtTokenUtil.refreshHeadToken(oldToken);
    }

    @Override
    public boolean update(Integer userId, User user) {
        user.setId(userId);
        User rawUser = getById(userId);
        if(rawUser.getPassword().equals(user.getPassword())){
            //与原加密密码相同的不需要修改
            user.setPassword(null);
        }else{
            //与原加密密码不同的需要加密修改
            if(StrUtil.isEmpty(user.getPassword())){
                user.setPassword(null);
            }else{
                user.setPassword(passwordEncoder.encode(user.getPassword()));
            }
        }
        boolean success = updateById(user);
        userCacheService.delUser(userId);
        return success;
    }

    @Override
    public int updatePassword(UpdateUserPasswordParam updateUserPasswordParam) {
        if(StrUtil.isEmpty(updateUserPasswordParam.getUsername())
                ||StrUtil.isEmpty(updateUserPasswordParam.getOldPassword())
                ||StrUtil.isEmpty(updateUserPasswordParam.getNewPassword())){
            return -1;
        }
        QueryWrapper<User> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(User::getUsername,updateUserPasswordParam.getUsername());
        List<User> userList = list(wrapper);
        if(CollUtil.isEmpty(userList)){
            return -2;
        }
        User user = userList.get(0);
        if(!passwordEncoder.matches(updateUserPasswordParam.getOldPassword(),user.getPassword())){
            return -3;
        }
        user.setPassword(passwordEncoder.encode(updateUserPasswordParam.getNewPassword()));
        updateById(user);
        userCacheService.delUser(user.getId());
        return 1;
    }
}
