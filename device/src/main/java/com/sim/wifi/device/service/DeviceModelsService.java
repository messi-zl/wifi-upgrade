package com.sim.wifi.device.service;

import com.sim.wifi.device.dto.DeviceModelsParam;
import com.sim.wifi.device.dto.DeviceTypeModelParam;
import com.sim.wifi.device.model.DeviceModels;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 设备型号表 服务类
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-19
 */
public interface DeviceModelsService extends IService<DeviceModels> {

    /**
     * 添加设备型号
     */
    boolean addDeviceModel(DeviceTypeModelParam deviceModelsParam);

    /**
     * 根据设备类型id查询设备型号
     */
    List<DeviceModelsParam> getDeviceModels(int typeId);

    /**
     * 根据所有设备类型和设备型号
     */
//    List<Map<String, Object>> getDeviceTypesAndModels();
//    List<DeviceTypeModelParam> getDeviceTypesAndModels();
    List<Map<String, Object>> getDeviceTypesAndModels();

}
