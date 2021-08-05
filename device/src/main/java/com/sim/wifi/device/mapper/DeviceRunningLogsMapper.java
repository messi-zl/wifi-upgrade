package com.sim.wifi.device.mapper;

import com.sim.wifi.device.dto.DeviceRunningParam;
import com.sim.wifi.device.model.DeviceRunningLogs;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 设备运行日志表 Mapper 接口
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-19
 */
public interface DeviceRunningLogsMapper extends BaseMapper<DeviceRunningLogs> {

    /**
     * 根据设备 id 查询设备运行信息
     */
    DeviceRunningParam getDeviceRunningByDeviceId(Integer deviceId);

}
