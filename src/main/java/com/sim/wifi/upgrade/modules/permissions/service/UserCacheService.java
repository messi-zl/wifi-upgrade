package com.sim.wifi.upgrade.modules.permissions.service;


import com.sim.wifi.upgrade.modules.permissions.model.Resource;
import com.sim.wifi.upgrade.modules.permissions.model.User;

import java.util.List;

/**
 * description: 后台用户缓存管理Service
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
public interface UserCacheService {
    /**
     * 删除后台用户缓存
     */
    void delUser(Integer userId);

    /**
     * 删除后台用户资源列表缓存
     */
    void delResourceList(Long userId);

    /**
     * 当角色相关资源信息改变时删除相关后台用户缓存
     */
    void delResourceListByRole(Integer roleId);

    /**
     * 当角色相关资源信息改变时删除相关后台用户缓存
     */
    void delResourceListByRoleIds(List<Long> roleIds);

    /**
     * 当资源信息改变时，删除资源项目后台用户缓存
     */
    void delResourceListByResource(Integer resourceId);

    /**
     * 获取缓存后台用户信息
     */
    User getUser(String userName);

    /**
     * 设置缓存后台用户信息
     */
    void setUser(User user);

    /**
     * 获取缓存后台用户资源列表
     */
    List<Resource> getResourceList(Integer userId);

    /**
     * 设置后台后台用户资源列表
     */
    void setResourceList(Integer userId, List<Resource> resourceList);
}
