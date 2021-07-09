package com.sim.wifi.upgrade.modules.basicPermissions.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sim.wifi.upgrade.modules.basicPermissions.model.Permissions;
import com.sim.wifi.upgrade.modules.basicPermissions.model.Users;
import com.sim.wifi.upgrade.modules.basicPermissions.mapper.UsersMapper;
import com.sim.wifi.upgrade.modules.basicPermissions.service.PermissionsService;
import com.sim.wifi.upgrade.modules.basicPermissions.service.UsersService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sim.wifi.upgrade.security.expand.CustomUserDetails;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    @Autowired
    private PermissionsService permissionsService;

    @Override
    public UserDetails loadUserByUsername(String username) {
        Users users = getUserByUserName(username);
        if (users != null) {
            List<Permissions> permissionsList = permissionsService.getPermissionsList(users.getId(), PermissionsService.TYPE_BUTTON);
            return new CustomUserDetails(users,permissionsList);
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
}
