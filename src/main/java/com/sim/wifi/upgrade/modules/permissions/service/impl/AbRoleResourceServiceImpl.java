package com.sim.wifi.upgrade.modules.permissions.service.impl;

import com.sim.wifi.upgrade.modules.permissions.model.AbRoleResource;
import com.sim.wifi.upgrade.modules.permissions.mapper.AbRoleResourceMapper;
import com.sim.wifi.upgrade.modules.permissions.service.AbRoleResourceService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zl
 * @since 2021-06-25
 */
@Service
public class AbRoleResourceServiceImpl extends ServiceImpl<AbRoleResourceMapper, AbRoleResource> implements AbRoleResourceService {
    private static final Logger LOGGER = LoggerFactory.getLogger(AbRoleResourceServiceImpl.class);
}
