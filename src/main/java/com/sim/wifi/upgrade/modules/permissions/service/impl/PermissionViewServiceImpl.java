package com.sim.wifi.upgrade.modules.permissions.service.impl;

import com.sim.wifi.upgrade.modules.permissions.model.PermissionView;
import com.sim.wifi.upgrade.modules.permissions.mapper.PermissionViewMapper;
import com.sim.wifi.upgrade.modules.permissions.service.PermissionViewService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * description:
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
@Service
public class PermissionViewServiceImpl extends ServiceImpl<PermissionViewMapper, PermissionView> implements PermissionViewService {
    private static final Logger logger = LoggerFactory.getLogger(PermissionViewServiceImpl.class);
}
