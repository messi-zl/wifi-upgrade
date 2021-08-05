package com.sim.wifi.device.mapper;

import com.sim.wifi.device.dto.DeviceTypesParam;
import com.sim.wifi.device.model.DeviceTypes;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 * 设备类型表 Mapper 接口
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-19
 */
public interface DeviceTypesMapper extends BaseMapper<DeviceTypes> {

    List<DeviceTypesParam> getDeviceTypesList();

}
