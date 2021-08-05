package com.sim.wifi.device.service.impl;

import com.sim.wifi.device.dto.DeviceTypesParam;
import com.sim.wifi.device.model.DeviceTypes;
import com.sim.wifi.device.mapper.DeviceTypesMapper;
import com.sim.wifi.device.service.DeviceTypesService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * <p>
 * 设备类型表 服务实现类
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-19
 */
@Service
public class DeviceTypesServiceImpl extends ServiceImpl<DeviceTypesMapper, DeviceTypes> implements DeviceTypesService {

    @Autowired
    private DeviceTypesMapper deviceTypesMapper;

    @Override
    public boolean addDeviceType(DeviceTypesParam deviceTypesParam) {
        DeviceTypes deviceType = new DeviceTypes();
        BeanUtils.copyProperties(deviceTypesParam, deviceType);
        deviceType.setCreatedOn(new Date());
        return save(deviceType);
    }

    @Override
    public List<DeviceTypesParam> queryDeviceTypes() {
        return deviceTypesMapper.getDeviceTypesList();
    }

}
