package com.sim.wifi.upgrade.config;


import com.sim.wifi.upgrade.modules.basicPermissions.model.Permissions;
import com.sim.wifi.upgrade.modules.basicPermissions.service.PermissionsService;
import com.sim.wifi.upgrade.modules.basicPermissions.service.UsersService;
import com.sim.wifi.upgrade.security.component.DynamicSecurityService;
import com.sim.wifi.upgrade.security.config.SecurityConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * description: wifi-upgrade-security模块相关配置
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WifiSecurityConfig extends SecurityConfig {
    @Autowired
    private UsersService usersService;
    @Autowired
    private PermissionsService permissionsService;

    @Bean
    public UserDetailsService userDetailsService() {
        //获取登录用户信息
        return userName -> usersService.loadUserByUsername(userName);
    }

    @Bean
    public DynamicSecurityService dynamicSecurityService() {
        return new DynamicSecurityService() {
            @Override
            public Map<String, ConfigAttribute> loadDataSource() {
                Map<String, ConfigAttribute> map = new ConcurrentHashMap<>();
                List<Permissions> permissionsList = permissionsService.list();//todo 这里应该只是对按钮级别的筛选出来
                for (Permissions permission : permissionsList) {
                    map.put(permission.getUrl(), new org.springframework.security.access.SecurityConfig(permission.getId() + ":" + permission.getName()));
                }
                return map;
            }
        };
    }
}
