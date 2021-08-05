package com.sim.wifi.device.mapper;

import com.sim.wifi.device.dto.DeviceActivateParam;
import com.sim.wifi.device.dto.DeviceRunningParam;
import com.sim.wifi.device.model.DeviceActivateLogs;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 设备激活日志表 Mapper 接口
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-19
 */
public interface DeviceActivateLogsMapper extends BaseMapper<DeviceActivateLogs> {

    /**
     * 根据设备 id 查询设备首次激活信息
     */
    DeviceActivateParam getDeviceFirstActivateByDeviceId(Integer deviceId);

    /**
     * 根据设备 id 查询设备最近激活信息
     */
    DeviceActivateParam getDeviceLastActivateByDeviceId(Integer deviceId);

}
