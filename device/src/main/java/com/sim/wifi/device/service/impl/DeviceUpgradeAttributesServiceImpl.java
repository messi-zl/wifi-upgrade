package com.sim.wifi.device.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sim.wifi.device.dto.DeviceUpgradeAttributesParam;
import com.sim.wifi.device.model.DeviceUpgradeAttributes;
import com.sim.wifi.device.mapper.DeviceUpgradeAttributesMapper;
import com.sim.wifi.device.service.DeviceUpgradeAttributesService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * <p>
 * 设备升级属性表 服务实现类
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-21
 */
@Service
public class DeviceUpgradeAttributesServiceImpl extends ServiceImpl<DeviceUpgradeAttributesMapper, DeviceUpgradeAttributes> implements DeviceUpgradeAttributesService {

//    @Autowired
//    private DeviceUpgradeAttributesMapper upgradeAttributesMapper;

//    @Override
//    public boolean addUpgradeAttributes(DeviceUpgradeAttributesParam upgradeAttributesParam) {
//        DeviceUpgradeAttributes upgradeAttributes = new DeviceUpgradeAttributes();
//        BeanUtils.copyProperties(upgradeAttributesParam, upgradeAttributes);
//        upgradeAttributes.setCreatedOn(new Date());
//        return save(upgradeAttributes);
//    }
//
//    @Override
//    public boolean deleteUpgradeAttributes(int id) {
//        return removeById(id);
//    }

    @Override
    public Page<DeviceUpgradeAttributes> queryPageUpgradeAttributes(Integer pageSize, Integer pageNum) {
        Page<DeviceUpgradeAttributes> page = new Page<>(pageNum, pageSize);
        QueryWrapper<DeviceUpgradeAttributes> wrapper = new QueryWrapper<>();
        return page(page, wrapper);
    }

//    @Override
//    public DeviceUpgradeAttributes queryUpgradeAttributes(int modelId) {
//        return upgradeAttributesMapper.selectByModelId(modelId);
//    }
//
//    @Override
//    public boolean updateUpgradeAttributes(DeviceUpgradeAttributesParam upgradeAttributesParam) {
//        if (upgradeAttributesParam.getId() == null) return false;
//        DeviceUpgradeAttributes upgradeAttributes = new DeviceUpgradeAttributes();
//        BeanUtils.copyProperties(upgradeAttributesParam, upgradeAttributes);
//        upgradeAttributes.setChangedOn(new Date());
//        return updateById(upgradeAttributes);
//    }

}
