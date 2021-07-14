package com.sim.device.modules.service.impl;

import com.sim.device.modules.model.DeviceInstances;
import com.sim.device.modules.mapper.DeviceInstancesMapper;
import com.sim.device.modules.service.DeviceInstancesService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 设备表 服务实现类
 * </p>
 *
 * @author device-management
 * @since 2021-07-12
 */
@Service
public class DeviceInstancesServiceImpl extends ServiceImpl<DeviceInstancesMapper, DeviceInstances> implements DeviceInstancesService {

}
