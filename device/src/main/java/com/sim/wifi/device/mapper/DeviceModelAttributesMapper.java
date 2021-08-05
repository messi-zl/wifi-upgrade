package com.sim.wifi.device.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sim.wifi.device.dto.DeviceModelAttributesParam;
import com.sim.wifi.device.model.DeviceModelAttributes;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 设备型号属性表 Mapper 接口
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-19
 */
public interface DeviceModelAttributesMapper extends BaseMapper<DeviceModelAttributes> {

    /**
     * 选择性插入有效的设备型号属性
     */
    int insertSelective(DeviceModelAttributes attributes);

    /**
     * 根据型号 id 删除设备型号属性
     */
    int deleteByModelId(Integer modelId);

    /**
     * 根据型号 id 查询设备型号属性
     */
    DeviceModelAttributes selectByModelId(Integer modelId);

    /**
     * 分页查询设备升级属性
     */
    Page<DeviceModelAttributesParam> selectUpgradeAttributes(Page<DeviceModelAttributesParam> page, @Param(Constants.WRAPPER) Wrapper<DeviceModelAttributesParam> queryWrapper);

    /**
     * 根据型号 id 查询设备型号属性
     */
    DeviceModelAttributesParam selectModelAttributes(int modelId);

    /**
     * 根据型号 id 选择性更新有效的设备型号属性
     */
    int updateByModelIdSelective(DeviceModelAttributes attributes);

}
