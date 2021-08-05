package com.sim.wifi.device.mapper;

import com.sim.wifi.device.dto.DeviceOnlineParam;
import com.sim.wifi.device.model.StatDeviceOnline;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 设备在线统计表 Mapper 接口
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-24
 */
public interface StatDeviceOnlineMapper extends BaseMapper<StatDeviceOnline> {

    /**
     * 根据设备 id 查询设备在线统计信息
     */
    DeviceOnlineParam getDeviceOnlineByDeviceId(Integer deviceId);

}
