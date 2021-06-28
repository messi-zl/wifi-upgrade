package com.sim.wifi.upgrade.config;


import com.sim.wifi.upgrade.modules.permissions.model.AbResource;
import com.sim.wifi.upgrade.modules.permissions.service.AbResourceService;
import com.sim.wifi.upgrade.modules.permissions.service.AbUserService;
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
 * wifi-upgrade-security模块相关配置
 */
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WifiSecurityConfig extends SecurityConfig {

    @Autowired
    private AbUserService userService;
    @Autowired
    private AbResourceService resourceService;

    @Bean
    public UserDetailsService userDetailsService() {
        //获取登录用户信息
        return userName -> userService.loadUserByUsername(userName);
    }

    @Bean
    public DynamicSecurityService dynamicSecurityService() {
        return new DynamicSecurityService() {
            @Override
            public Map<String, ConfigAttribute> loadDataSource() {
                Map<String, ConfigAttribute> map = new ConcurrentHashMap<>();
                List<AbResource> resourceList = resourceService.list();
                for (AbResource resource : resourceList) {
                    map.put(resource.getUrl(), new org.springframework.security.access.SecurityConfig(resource.getId() + ":" + resource.getName()));
                }
                return map;
            }
        };
    }
}
