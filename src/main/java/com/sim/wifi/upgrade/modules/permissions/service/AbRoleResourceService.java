package com.sim.wifi.upgrade.modules.permissions.service;

import com.sim.wifi.upgrade.modules.permissions.model.AbRoleResource;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zl
 * @since 2021-06-25
 */
public interface AbRoleResourceService extends IService<AbRoleResource> {

    /**
     * 分配资源给用户
     */
    @Transactional
    int allocResource(Integer userId, List<Integer> resourceIds);
}
