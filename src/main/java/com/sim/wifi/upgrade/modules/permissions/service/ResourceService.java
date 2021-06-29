package com.sim.wifi.upgrade.modules.permissions.service;

import com.sim.wifi.upgrade.modules.permissions.model.Resource;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * description:
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
public interface ResourceService extends IService<Resource> {
    /**
     * 获取指定用户的可访问资源,由userId得到其对应的所有ResourceUrl
     */
    List<Resource> getResourceList(Integer userId);


    /**
     * 添加资源resource
     */
    boolean create(Resource resource);


    /**
     * 修改资源
     */
    boolean update(Integer resourceId, Resource resource);

    /**
     * 删除资源
     */
    boolean delete(Integer resourceId);

}
