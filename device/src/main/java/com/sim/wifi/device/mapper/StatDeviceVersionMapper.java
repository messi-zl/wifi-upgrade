package com.sim.wifi.device.mapper;

import com.sim.wifi.device.dto.DeviceVersionParam;
import com.sim.wifi.device.model.StatDeviceVersion;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 设备版本运行统计表 Mapper 接口
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-24
 */
public interface StatDeviceVersionMapper extends BaseMapper<StatDeviceVersion> {

    /**
     * 根据设备 id 查询设备版本统计信息
     */
    DeviceVersionParam getDeviceVersionByDeviceId(Integer deviceId);

}
