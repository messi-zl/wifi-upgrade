package com.sim.wifi.device.service.impl;

import com.sim.wifi.device.model.DeviceTypes;
import com.sim.wifi.device.mapper.DeviceTypesMapper;
import com.sim.wifi.device.service.DeviceTypesService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 设备类型表 服务实现类
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-14
 */
@Service
public class DeviceTypesServiceImpl extends ServiceImpl<DeviceTypesMapper, DeviceTypes> implements DeviceTypesService {

}
