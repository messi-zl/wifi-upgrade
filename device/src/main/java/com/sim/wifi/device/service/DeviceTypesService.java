package com.sim.wifi.device.service;

import com.sim.wifi.device.dto.DeviceTypesParam;
import com.sim.wifi.device.model.DeviceTypes;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 设备类型表 服务类
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-19
 */
public interface DeviceTypesService extends IService<DeviceTypes> {

    /**
     * 添加设备类型
     */
    boolean addDeviceType(DeviceTypesParam deviceTypesParam);

    /**
     * 获取设备类型
     */
    List<DeviceTypesParam> queryDeviceTypes();

}
