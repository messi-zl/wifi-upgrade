package com.sim.wifi.device.service;

import com.sim.wifi.device.dto.DeviceDetailsParam;
import com.sim.wifi.device.model.DeviceInstances;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 设备表 服务类
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-19
 */
public interface DeviceInstancesService extends IService<DeviceInstances> {

    /**
     * 查询设备详情
     */
    DeviceDetailsParam queryDeviceDetails(DeviceInstances device);

}
