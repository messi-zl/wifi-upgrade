package com.sim.wifi.upgrade.modules.basicPermissions.service;

import com.sim.wifi.upgrade.modules.basicPermissions.model.Users;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.security.core.userdetails.UserDetails;

/**
 * description: 用户表 服务类
 * create by: li.zheng871@sim.com
 * create time: 2021/7/9
 */
public interface UsersService extends IService<Users> {

    /**
     * 根据用户名获取信息，实际对UserDetailsService中loadUserByUsername进行overwite
     */
    UserDetails loadUserByUsername(String username);

    /**
     * @Description 根据用户名获取用户
     * @Date 2021/7/9
     * @param userName
     *@return com.sim.wifi.upgrade.modules.basicPermissions.model.Users
     **/
    Users getUserByUserName(String userName);
}
