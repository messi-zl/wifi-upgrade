package com.sim.device.modules.service.impl;

import com.sim.device.modules.model.DeviceTypes;
import com.sim.device.modules.mapper.DeviceTypesMapper;
import com.sim.device.modules.service.DeviceTypesService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 设备类型表 服务实现类
 * </p>
 *
 * @author device-management
 * @since 2021-07-12
 */
@Service
public class DeviceTypesServiceImpl extends ServiceImpl<DeviceTypesMapper, DeviceTypes> implements DeviceTypesService {

}
