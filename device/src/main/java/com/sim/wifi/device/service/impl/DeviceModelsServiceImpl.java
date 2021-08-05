package com.sim.wifi.device.service.impl;

import com.sim.wifi.device.dto.DeviceModelsParam;
import com.sim.wifi.device.dto.DeviceTypeModelParam;
import com.sim.wifi.device.dto.DeviceTypesParam;
import com.sim.wifi.device.mapper.DeviceTypeModelRelationMapper;
import com.sim.wifi.device.mapper.DeviceTypesMapper;
import com.sim.wifi.device.model.DeviceModels;
import com.sim.wifi.device.mapper.DeviceModelsMapper;
import com.sim.wifi.device.model.DeviceTypeModelRelation;
import com.sim.wifi.device.service.DeviceModelsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * <p>
 * 设备型号表 服务实现类
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-19
 */
@Service
public class DeviceModelsServiceImpl extends ServiceImpl<DeviceModelsMapper, DeviceModels> implements DeviceModelsService {

    @Autowired
    private DeviceTypesMapper deviceTypesMapper;
    @Autowired
    private DeviceModelsMapper deviceModelsMapper;
    @Autowired
    private DeviceTypeModelRelationMapper typeModelRelationMapper;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, timeout=36000, rollbackFor=Exception.class)
    public boolean addDeviceModel(DeviceTypeModelParam deviceModelsParam) {
        DeviceModels deviceModel = new DeviceModels();
        deviceModel.setName(deviceModelsParam.getModelName());
        deviceModel.setCreatedOn(new Date());
        int ret = deviceModelsMapper.insert(deviceModel);

        if (ret > 0) {
            DeviceTypeModelRelation typeModelRelation = new DeviceTypeModelRelation();
            typeModelRelation.setTypeId(deviceModelsParam.getTypeId());
            typeModelRelation.setModelId(deviceModel.getId());
            ret = typeModelRelationMapper.insert(typeModelRelation);
        }

        return ret > 0;
    }

    @Override
    public List<DeviceModelsParam> getDeviceModels(int typeId) {
        return deviceModelsMapper.getDeviceModelsListByTypeId(typeId);
    }

//    @Override
//    public List<Map<String, Object>> getDeviceTypesAndModels() {
//        return deviceModelsMapper.getDeviceTypesModelsList();
//    }
//    @Override
//    public List<DeviceTypeModelParam> getDeviceTypesAndModels() {
//        return deviceModelsMapper.getDeviceTypesModelsList();
//    }
    @Override
    public List<Map<String, Object>> getDeviceTypesAndModels() {
        List<DeviceTypesParam> deviceTypes = deviceTypesMapper.getDeviceTypesList();
        if (deviceTypes == null) return null;

        List<Map<String, Object>> deviceTypesModelsList = new ArrayList<>();
        for (DeviceTypesParam deviceType : deviceTypes) {
            Map<String, Object> deviceTypesModelsMap = new HashMap<>();
            deviceTypesModelsMap.put("typeId", deviceType.getTypeId());
            deviceTypesModelsMap.put("typeName", deviceType.getTypeName());
            List<DeviceModelsParam> deviceModels = deviceModelsMapper.getDeviceModelsListByTypeId(deviceType.getTypeId());
            deviceTypesModelsMap.put("models", deviceModels);
            deviceTypesModelsList.add(deviceTypesModelsMap);
        }

        return deviceTypesModelsList;
    }

}
