package com.sim.wifi.device.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sim.wifi.device.dto.DeviceTypesParam;
import com.sim.wifi.device.dto.DeviceUpgradeAttributesParam;
import com.sim.wifi.device.model.DeviceUpgradeAttributes;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 设备升级属性表 服务类
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-21
 */
public interface DeviceUpgradeAttributesService extends IService<DeviceUpgradeAttributes> {

//    /**
//     * 添加设备升级属性
//     */
//    boolean addUpgradeAttributes(DeviceUpgradeAttributesParam upgradeAttributesParam);
//
//    /**
//     * 删除设备升级属性
//     */
//    boolean deleteUpgradeAttributes(int id);

    /**
     * 分页查询设备升级属性
     */
    Page<DeviceUpgradeAttributes> queryPageUpgradeAttributes(Integer pageSize, Integer pageNum);

//    /**
//     * 查询设备升级属性
//     */
//    DeviceUpgradeAttributes queryUpgradeAttributes(int modelId);
//
//    /**
//     * 修改设备升级属性
//     */
//    boolean updateUpgradeAttributes(DeviceUpgradeAttributesParam upgradeAttributesParam);

}
