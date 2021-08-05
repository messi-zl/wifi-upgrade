package com.sim.wifi.device.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sim.wifi.device.dto.DeviceModelAttributesParam;
import com.sim.wifi.device.dto.DeviceUpgradeAttributesParam;
import com.sim.wifi.device.mapper.DeviceModelsMapper;
import com.sim.wifi.device.mapper.DeviceTypeModelRelationMapper;
import com.sim.wifi.device.mapper.DeviceUpgradeAttributesMapper;
import com.sim.wifi.device.model.DeviceModelAttributes;
import com.sim.wifi.device.mapper.DeviceModelAttributesMapper;
import com.sim.wifi.device.model.DeviceModels;
import com.sim.wifi.device.model.DeviceTypeModelRelation;
import com.sim.wifi.device.model.DeviceUpgradeAttributes;
import com.sim.wifi.device.service.DeviceModelAttributesService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * <p>
 * 设备型号属性表 服务实现类
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-19
 */
@Service
public class DeviceModelAttributesServiceImpl extends ServiceImpl<DeviceModelAttributesMapper, DeviceModelAttributes> implements DeviceModelAttributesService {

    @Autowired
    private DeviceUpgradeAttributesMapper upgradeAttributesMapper;
    @Autowired
    private DeviceModelAttributesMapper modelAttributesMapper;
    @Autowired
    private DeviceModelsMapper deviceModelsMapper;
    @Autowired
    private DeviceTypeModelRelationMapper typeModelRelationMapper;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, timeout=36000, rollbackFor=Exception.class)
    public boolean addModelAttributes(DeviceModelAttributesParam modelAttributesParam) {
        if ((modelAttributesParam.getModelId() == null) && (modelAttributesParam.getModelName() == null)) return false;
        if ((modelAttributesParam.getModelId() == null) && (modelAttributesParam.getModelName() != null)) {
            DeviceModels deviceModel = new DeviceModels();
            deviceModel.setName(modelAttributesParam.getModelName());
            deviceModel.setCreatedOn(new Date());
            deviceModelsMapper.insert(deviceModel);

            if (deviceModel.getId() == null) return false;

            DeviceTypeModelRelation typeModelRelation = new DeviceTypeModelRelation();
            typeModelRelation.setTypeId(modelAttributesParam.getTypeId());
            typeModelRelation.setModelId(deviceModel.getId());
            typeModelRelationMapper.insert(typeModelRelation);

            modelAttributesParam.setModelId(deviceModel.getId());
        }

        DeviceUpgradeAttributes upgradeAttributes = new DeviceUpgradeAttributes();
        DeviceModelAttributes modelAttributes = new DeviceModelAttributes();

        BeanUtils.copyProperties(modelAttributesParam, upgradeAttributes);
        upgradeAttributes.setCreatedOn(new Date());
        int upgradeRet = upgradeAttributesMapper.insertSelective(upgradeAttributes);

        BeanUtils.copyProperties(modelAttributesParam, modelAttributes);
        modelAttributes.setCreatedOn(new Date());
        int modelRet = modelAttributesMapper.insertSelective(modelAttributes);

        return upgradeRet > 0 && modelRet > 0;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, timeout=36000, rollbackFor=Exception.class)
    public boolean deleteModelAttributes(int modelId) {
        int upgradeRet = upgradeAttributesMapper.deleteByModelId(modelId);
        int modelRet = modelAttributesMapper.deleteByModelId(modelId);
        return upgradeRet > 0 && modelRet > 0;
    }

    @Override
    public DeviceModelAttributesParam queryModelAttributes(int modelId) {
//        DeviceUpgradeAttributes upgradeAttributes = upgradeAttributesMapper.selectByModelId(modelId);
//        DeviceModelAttributes modelAttributes = modelAttributesMapper.selectByModelId(modelId);
//        DeviceModelAttributesParam modelAttributesParam = new DeviceModelAttributesParam();
//        BeanUtils.copyProperties(upgradeAttributes, modelAttributesParam);
//        BeanUtils.copyProperties(modelAttributes, modelAttributesParam);
//        return modelAttributesParam;
        return modelAttributesMapper.selectModelAttributes(modelId);
    }

    @Override
    public Page<DeviceModelAttributesParam> queryUpgradeAttributes(Integer pageSize, Integer pageNum) {
        Page<DeviceModelAttributesParam> page = new Page<>(pageNum, pageSize);
        QueryWrapper<DeviceModelAttributesParam> wrapper = new QueryWrapper<>();
        return modelAttributesMapper.selectUpgradeAttributes(page, wrapper);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, timeout=36000, rollbackFor=Exception.class)
    public boolean updateModelAttributes(DeviceModelAttributesParam modelAttributesParam) {
        DeviceUpgradeAttributes upgradeAttributes = new DeviceUpgradeAttributes();
        DeviceModelAttributes modelAttributes = new DeviceModelAttributes();

        BeanUtils.copyProperties(modelAttributesParam, upgradeAttributes);
        upgradeAttributes.setChangedOn(new Date());
        int upgradeRet = upgradeAttributesMapper.updateByModelIdSelective(upgradeAttributes);

        BeanUtils.copyProperties(modelAttributesParam, modelAttributes);
        modelAttributes.setChangedOn(new Date());
        int modelRet = modelAttributesMapper.updateByModelIdSelective(modelAttributes);

        return upgradeRet > 0 && modelRet > 0;
    }

}
