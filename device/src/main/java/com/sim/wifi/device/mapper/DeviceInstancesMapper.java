package com.sim.wifi.device.mapper;

import com.sim.wifi.device.dto.DeviceBasicParam;
import com.sim.wifi.device.model.DeviceInstances;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 设备表 Mapper 接口
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-19
 */
public interface DeviceInstancesMapper extends BaseMapper<DeviceInstances> {

    /**
     * 根据 mac 查询设备基本信息
     */
    DeviceBasicParam selectDeviceByMac(DeviceInstances device);

    /**
     * 根据 sn 查询设备基本信息
     */
    DeviceBasicParam selectDeviceBySn(DeviceInstances device);

    /**
     * 根据 uuid 查询设备基本信息
     */
    DeviceBasicParam selectDeviceByUuid(DeviceInstances device);

}
