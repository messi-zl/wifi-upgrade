package com.sim.wifi.device.service.impl;

import com.sim.wifi.device.common.utils.StringUtil;
import com.sim.wifi.device.dto.*;
import com.sim.wifi.device.mapper.*;
import com.sim.wifi.device.model.DeviceInstances;
import com.sim.wifi.device.service.DeviceInstancesService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * 设备表 服务实现类
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-19
 */
@Service
public class DeviceInstancesServiceImpl extends ServiceImpl<DeviceInstancesMapper, DeviceInstances> implements DeviceInstancesService {

    @Autowired
    private DeviceInstancesMapper instancesMapper;
    @Autowired
    private DeviceRunningLogsMapper runningLogsMapper;
    @Autowired
    private DeviceActivateLogsMapper activateLogsMapper;
    @Autowired
    private DeviceUpgradeLogsMapper upgradeLogsMapper;
    @Autowired
    private StatDeviceOnlineMapper onlineStatMapper;
    @Autowired
    private StatDeviceVersionMapper versionStatMapper;

    @Override
    public DeviceDetailsParam queryDeviceDetails(DeviceInstances device) {
        DeviceDetailsParam deviceDetails = new DeviceDetailsParam();

        DeviceBasicParam deviceBasic = new DeviceBasicParam();
        if (device.getMac() != null) {
            deviceBasic = instancesMapper.selectDeviceByMac(device);
        } else if (device.getSn() != null) {
            deviceBasic = instancesMapper.selectDeviceBySn(device);
        } else if (device.getUuid() != null) {
            deviceBasic = instancesMapper.selectDeviceByUuid(device);
        }
        if ((deviceBasic == null) || (deviceBasic.getDeviceId() == null)) return null;
        deviceDetails.setBasic(deviceBasic);

        deviceDetails.setRunning(runningLogsMapper.getDeviceRunningByDeviceId(deviceBasic.getDeviceId()));

//        Map<String, DeviceActivateParam> deviceActivate = new HashMap<>();
//        deviceActivate.put("first", activateLogsMapper.getDeviceFirstActivateByDeviceId(deviceBasic.getDeviceId()));
//        deviceActivate.put("last", activateLogsMapper.getDeviceLastActivateByDeviceId(deviceBasic.getDeviceId()));
//        deviceDetails.setActivate(deviceActivate);
        DeviceActivateParam.DeviceActivate deviceActivate = new DeviceActivateParam.DeviceActivate();
        deviceActivate.setFirst(activateLogsMapper.getDeviceFirstActivateByDeviceId(deviceBasic.getDeviceId()));
        deviceActivate.setLast(activateLogsMapper.getDeviceLastActivateByDeviceId(deviceBasic.getDeviceId()));
        deviceDetails.setActivate(deviceActivate);

        deviceDetails.setUpgrade(queryDeviceDetectedUpgrade(deviceBasic.getDeviceId()));

        deviceDetails.setOnline(onlineStatMapper.getDeviceOnlineByDeviceId(deviceBasic.getDeviceId()));

        deviceDetails.setVersion(versionStatMapper.getDeviceVersionByDeviceId(deviceBasic.getDeviceId()));

        return deviceDetails;
    }

    private DeviceUpgradeParam queryDeviceDetectedUpgrade(Integer deviceId) {
        DeviceUpgradeParam deviceUpgrade = new DeviceUpgradeParam();
        deviceUpgrade.setDeviceId(deviceId);
        deviceUpgrade.setAutoDetectedTimes(upgradeLogsMapper.getAutoDetectedTimesByDeviceId(deviceId));
        deviceUpgrade.setManualDetectedTimes(upgradeLogsMapper.getManualDetectedTimesByDeviceId(deviceId));
        deviceUpgrade.setLastDetectedOn(StringUtil.DateToString(upgradeLogsMapper.getLastDetectedDateByDeviceId(deviceId)));
        deviceUpgrade.setLocalUpgradeTimes(upgradeLogsMapper.getLocalUpgradeTimesByDeviceId(deviceId));
        deviceUpgrade.setLastUpgradeOn(StringUtil.DateToString(upgradeLogsMapper.getLastUpgradeDateByDeviceId(deviceId)));
        return deviceUpgrade;
    }

}
