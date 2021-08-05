package com.sim.wifi.device.mapper;

import com.sim.wifi.device.model.DeviceUpgradeAttributes;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 设备升级属性表 Mapper 接口
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-21
 */
public interface DeviceUpgradeAttributesMapper extends BaseMapper<DeviceUpgradeAttributes> {

    /**
     * 选择性插入有效的设备升级属性
     */
    int insertSelective(DeviceUpgradeAttributes attributes);

    /**
     * 根据型号 id 删除设备升级属性
     */
    int deleteByModelId(int modelId);

    /**
     * 根据型号 id 查询设备升级属性
     */
    DeviceUpgradeAttributes selectByModelId(int modelId);

    /**
     * 根据型号 id 选择性更新有效的设备升级属性
     */
    int updateByModelIdSelective(DeviceUpgradeAttributes attributes);

}
