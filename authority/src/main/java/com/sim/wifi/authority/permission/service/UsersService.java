package com.sim.wifi.authority.permission.service;

import com.sim.wifi.authority.dto.UpdateUsersPasswordParam;
import com.sim.wifi.authority.dto.UsersParam;
import com.sim.wifi.authority.permission.model.Users;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.security.core.userdetails.UserDetails;

/**
 * description: 用户表 服务类
 * create by: li.zheng871@sim.com
 * create time: 2021/7/9
 */
public interface UsersService extends IService<Users> {
    public static Integer STATUS_DISABLE = 0;
    public static Integer STATUS_ENABLE = 1;

    /**
     * 根据用户名获取信息，实际对UserDetailsService中loadUserByUsername进行overwite
     */
    UserDetails loadUserByUsername(String username);

    /**
     * @param userName
     * @return com.sim.wifi.upgrade.basicPermissions.model.Users
     * @Description 根据用户名获取用户
     * @Date 2021/7/9
     **/
    Users getUserByUserName(String userName);

    /**
     * 登录功能
     *
     * @param username 用户名
     * @param password 密码
     * @return 生成的JWT的token
     */
    String login(String username, String password);

    /**
     * 注册功能
     */
    Users register(UsersParam usersParam);

    /**
     * 刷新token的功能
     *
     * @param oldToken 旧的token
     */
    String refreshToken(String oldToken);

    /**
     * 修改指定用户信息
     */
    boolean update(Integer userId, Users user);

    /**
     * 修改密码
     */
    int updatePassword(UpdateUsersPasswordParam updateUsersPasswordParam);
}
