package com.sim.wifi.upgrade.modules.permissions.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.sim.wifi.upgrade.modules.permissions.model.AbResource;
import com.sim.wifi.upgrade.modules.permissions.mapper.AbResourceMapper;
import com.sim.wifi.upgrade.modules.permissions.service.AbResourceService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sim.wifi.upgrade.modules.permissions.service.AbUserCacheService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zl
 * @since 2021-06-25
 */
@Service
public class AbResourceServiceImpl extends ServiceImpl<AbResourceMapper, AbResource> implements AbResourceService {
    private static final Logger logger = LoggerFactory.getLogger(AbResourceServiceImpl.class);
    @Autowired
    private AbResourceMapper resourceMapper;
    @Autowired
    private AbUserCacheService userCacheService;

    @Override
    public List<AbResource> getResourceList(Integer userId) {
        List<AbResource> resourceList = userCacheService.getResourceList(userId);
        if (CollUtil.isNotEmpty(resourceList)) {
            return resourceList;
        }
        resourceList = resourceMapper.getResourceList(userId);
        if (CollUtil.isNotEmpty(resourceList)) {
            userCacheService.setResourceList(userId, resourceList);
        }
        return resourceList;
    }
}
