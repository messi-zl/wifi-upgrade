package com.sim.wifi.device.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sim.wifi.device.dto.DeviceModelAttributesParam;
import com.sim.wifi.device.dto.DeviceUpgradeAttributesParam;
import com.sim.wifi.device.model.DeviceModelAttributes;
import com.baomidou.mybatisplus.extension.service.IService;
import com.sim.wifi.device.model.DeviceUpgradeAttributes;

/**
 * <p>
 * 设备型号属性表 服务类
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-19
 */
public interface DeviceModelAttributesService extends IService<DeviceModelAttributes> {

    /**
     * 添加设备属性
     */
    boolean addModelAttributes(DeviceModelAttributesParam modelAttributesParam);

    /**
     * 删除设备属性
     */
    boolean deleteModelAttributes(int modelId);

    /**
     * 查询设备属性
     */
    DeviceModelAttributesParam queryModelAttributes(int modelId);

    /**
     * 分页查询设备升级属性
     */
    Page<DeviceModelAttributesParam> queryUpgradeAttributes(Integer pageSize, Integer pageNum);

    /**
     * 修改设备属性
     */
    boolean updateModelAttributes(DeviceModelAttributesParam modelAttributesParam);

}
