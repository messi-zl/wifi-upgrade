package com.sim.wifi.device.mapper;

import com.sim.wifi.device.model.DeviceUpgradeLogs;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.Date;

/**
 * <p>
 * 设备检测与升级日志表 Mapper 接口
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-23
 */
public interface DeviceUpgradeLogsMapper extends BaseMapper<DeviceUpgradeLogs> {

    /**
     * 根据设备 id 查询自动检测次数
     */
    int getAutoDetectedTimesByDeviceId(int deviceId);

    /**
     * 根据设备 id 查询手动检测次数
     */
    int getManualDetectedTimesByDeviceId(int deviceId);

    /**
     * 根据设备 id 查询最近检测时间
     */
    Date getLastDetectedDateByDeviceId(int deviceId);

    /**
     * 根据设备 id 查询本地升级次数
     */
    int getLocalUpgradeTimesByDeviceId(int deviceId);

    /**
     * 根据设备 id 查询最近升级时间
     */
    Date getLastUpgradeDateByDeviceId(int deviceId);

}
