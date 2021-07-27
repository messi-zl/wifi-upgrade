package com.sim.wifi.authority.component;

import com.sim.wifi.authority.permission.service.UserPermissionRelationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

/**
 * @Description:    用户-权限关系组件
 * @CreateBy: li.zheng871@sim.com
 * @DateTime: 2021/7/26
 */
@Component
public class PermissionUserRulesHolder {
    @Autowired
    private UserPermissionRelationService userPermissionRelationService;

    @PostConstruct
    public void initPermissionUserRulesMap(){
        userPermissionRelationService.initPermissionUserRulesMap();
    }
}
