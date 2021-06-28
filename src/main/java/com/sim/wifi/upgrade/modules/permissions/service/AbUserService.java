package com.sim.wifi.upgrade.modules.permissions.service;

import com.sim.wifi.upgrade.modules.permissions.dto.AbUserParam;
import com.sim.wifi.upgrade.modules.permissions.model.AbResource;
import com.sim.wifi.upgrade.modules.permissions.model.AbUser;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zl
 * @since 2021-06-22
 */
public interface AbUserService extends IService<AbUser> {

    /**
     * 根据用户名获取后台管理员
     */
    AbUser getUserByUsername(String username);

    /**
     * 根据用户名获取信息，实际对UserDetailsService中loadUserByUsername进行overwite
     */
    UserDetails loadUserByUsername(String username);




    /**
     * 注册功能
     */
    AbUser register(AbUserParam abUserParm);

    /**
     * 登录功能
     * @param username 用户名
     * @param password 密码
     * @return 生成的JWT的token
     */
    String login(String username,String password);

}
