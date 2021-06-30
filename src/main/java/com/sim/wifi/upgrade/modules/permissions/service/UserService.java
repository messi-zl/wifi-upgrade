package com.sim.wifi.upgrade.modules.permissions.service;

import com.sim.wifi.upgrade.modules.permissions.dto.UserParam;
import com.sim.wifi.upgrade.modules.permissions.model.User;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.security.core.userdetails.UserDetails;

/**
 * description:
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
public interface UserService extends IService<User> {

    /**
     * 根据用户名获取后台管理员
     */
    User getUserByUsername(String username);

    /**
     * 根据用户名获取信息，实际对UserDetailsService中loadUserByUsername进行overwite
     */
    UserDetails loadUserByUsername(String username);


    /**
     * 注册功能
     */
    User register(UserParam abUserParm);

    /**
     * 登录功能
     *
     * @param username 用户名
     * @param password 密码
     * @return 生成的JWT的token
     */
    String login(String username, String password);

    /**
     * 刷新token的功能
     *
     * @param oldToken 旧的token
     */
    String refreshToken(String oldToken);

}
