package com.sim.wifi.upgrade.modules.permissions.service;




import com.sim.wifi.upgrade.modules.permissions.model.AbResource;
import com.sim.wifi.upgrade.modules.permissions.model.AbUser;

import java.util.List;

/**
 * 后台用户缓存管理Service
 * Created by macro on 2020/3/13.
 */
public interface AbUserCacheService {
    /**
     * 删除后台用户缓存
     */
    void delUser(Long userId);

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
    void delResourceListByResource(Long resourceId);

    /**
     * 获取缓存后台用户信息
     */
    AbUser getUser(String userName);

    /**
     * 设置缓存后台用户信息
     */
    void setUser(AbUser user);

    /**
     * 获取缓存后台用户资源列表
     */
    List<AbResource> getResourceList(Integer userId);

    /**
     * 设置后台后台用户资源列表
     */
    void setResourceList(Integer userId, List<AbResource> resourceList);
}
