package com.sim.wifi.firmware.mapper;

import com.sim.wifi.firmware.model.FirmwareUpgradeActivity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 活跃度筛选表 Mapper 接口
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-19
 */
public interface FirmwareUpgradeActivityMapper extends BaseMapper<FirmwareUpgradeActivity> {

    int insertUpgradeActivity(FirmwareUpgradeActivity upgradeActivity);

    int deleteByFirmwareId(int firmwareId);

    FirmwareUpgradeActivity selectByFirmwareId(int firmwareId);

    int updateByFirmwareId(FirmwareUpgradeActivity upgradeActivity);

}
