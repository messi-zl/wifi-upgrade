package com.sim.wifi.firmware.mapper;

import com.sim.wifi.firmware.model.FirmwareUpgradeRegions;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 升级地区表 Mapper 接口
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-17
 */
public interface FirmwareUpgradeRegionsMapper extends BaseMapper<FirmwareUpgradeRegions> {

    int insertList(List<FirmwareUpgradeRegions> regions);

    int deleteByFirmwareId(int firmwareId);

    List<FirmwareUpgradeRegions> selectByFirmwareId(int firmwareId);

}
