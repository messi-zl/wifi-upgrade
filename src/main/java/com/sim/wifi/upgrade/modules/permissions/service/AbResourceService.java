package com.sim.wifi.upgrade.modules.permissions.service;

import com.sim.wifi.upgrade.modules.permissions.model.AbResource;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zl
 * @since 2021-06-25
 */
public interface AbResourceService extends IService<AbResource> {
    /**
     * 获取指定用户的可访问资源,由userId得到其对应的所有ResourceUrl
     */
    List<AbResource> getResourceList(Integer userId);
}
