package com.sim.wifi.authority.permission.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.sim.wifi.authority.permission.model.UserPermissionRelation;

import java.util.List;

/**
 * description: 用户与权限对应表 服务类
 * create by: li.zheng871@sim.com
 * create time: 2021/7/9
 */
public interface UserPermissionRelationService extends IService<UserPermissionRelation> {
    /**
     * 给用户分配权限
     */
    int allocPermissionToUser(Integer userId, List<Integer> permissionIds);

    /**
     * 初始化用户所拥有权限的规则
     */
    void initPermissionUserRulesMap();
}
