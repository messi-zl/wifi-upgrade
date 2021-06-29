package com.sim.wifi.upgrade.modules.permissions.service.impl;

import com.sim.wifi.upgrade.modules.permissions.model.DeviceModels;
import com.sim.wifi.upgrade.modules.permissions.mapper.DeviceModelsMapper;
import com.sim.wifi.upgrade.modules.permissions.service.DeviceModelsService;
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
public class DeviceModelsServiceImpl extends ServiceImpl<DeviceModelsMapper, DeviceModels> implements DeviceModelsService {
    private static final Logger logger = LoggerFactory.getLogger(DeviceModelsServiceImpl.class);
}
