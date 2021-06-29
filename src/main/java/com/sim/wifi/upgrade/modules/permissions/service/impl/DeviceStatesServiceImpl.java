package com.sim.wifi.upgrade.modules.permissions.service.impl;

import com.sim.wifi.upgrade.modules.permissions.model.DeviceStates;
import com.sim.wifi.upgrade.modules.permissions.mapper.DeviceStatesMapper;
import com.sim.wifi.upgrade.modules.permissions.service.DeviceStatesService;
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
public class DeviceStatesServiceImpl extends ServiceImpl<DeviceStatesMapper, DeviceStates> implements DeviceStatesService {
    private static final Logger logger = LoggerFactory.getLogger(DeviceStatesServiceImpl.class);
}
