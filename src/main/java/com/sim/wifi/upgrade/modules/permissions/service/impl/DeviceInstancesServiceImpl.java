package com.sim.wifi.upgrade.modules.permissions.service.impl;

import com.sim.wifi.upgrade.modules.permissions.model.DeviceInstances;
import com.sim.wifi.upgrade.modules.permissions.mapper.DeviceInstancesMapper;
import com.sim.wifi.upgrade.modules.permissions.service.DeviceInstancesService;
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
public class DeviceInstancesServiceImpl extends ServiceImpl<DeviceInstancesMapper, DeviceInstances> implements DeviceInstancesService {
    private static final Logger logger = LoggerFactory.getLogger(DeviceInstancesServiceImpl.class);
}
