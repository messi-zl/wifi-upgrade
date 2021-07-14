package com.sim.wifi.authority.security.component;

import org.springframework.security.access.ConfigAttribute;

import java.util.Map;

/**
 * description: 动态权限相关业务类
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
public interface DynamicSecurityService {
    /**
     * 加载资源ANT通配符和资源对应MAP
     */
    Map<String, ConfigAttribute> loadDataSource();
}
