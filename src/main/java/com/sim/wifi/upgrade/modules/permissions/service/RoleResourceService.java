package com.sim.wifi.upgrade.modules.permissions.service;

import com.sim.wifi.upgrade.modules.permissions.model.RoleResource;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * description:
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
public interface RoleResourceService extends IService<RoleResource> {

    /**
     * 分配资源给用户
     */
    @Transactional
    int allocResource(Integer userId, List<Integer> resourceIds);
}
