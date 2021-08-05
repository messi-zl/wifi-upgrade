package com.sim.wifi.device.mapper;

import com.sim.wifi.device.dto.DeviceModelsParam;
import com.sim.wifi.device.dto.DeviceTypeModelParam;
import com.sim.wifi.device.model.DeviceModels;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 设备型号表 Mapper 接口
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-19
 */
public interface DeviceModelsMapper extends BaseMapper<DeviceModels> {

    List<DeviceModelsParam> getDeviceModelsListByTypeId(int type_id);

//    List<Map<String, Object>> getDeviceTypesModelsList();
    List<DeviceTypeModelParam> getDeviceTypesModelsList();

    DeviceTypeModelParam getDeviceTypeModelByModelId(int modelId);

}
