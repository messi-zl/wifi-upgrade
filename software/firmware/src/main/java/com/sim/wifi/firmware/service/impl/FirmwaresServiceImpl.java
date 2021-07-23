package com.sim.wifi.firmware.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sim.wifi.firmware.dto.FirmwareUpgradeActivityParam;
import com.sim.wifi.firmware.dto.FirmwareUpgradeRegionsParam;
import com.sim.wifi.firmware.dto.FirmwaresParam;
import com.sim.wifi.firmware.mapper.FirmwareUpgradeActivityMapper;
import com.sim.wifi.firmware.mapper.FirmwareUpgradeRegionsMapper;
import com.sim.wifi.firmware.model.FirmwareUpgradeActivity;
import com.sim.wifi.firmware.model.FirmwareUpgradeRegions;
import com.sim.wifi.firmware.model.Firmwares;
import com.sim.wifi.firmware.mapper.FirmwaresMapper;
import com.sim.wifi.firmware.service.FirmwaresService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * 固件表 服务实现类
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-17
 */
@Service
public class FirmwaresServiceImpl extends ServiceImpl<FirmwaresMapper, Firmwares> implements FirmwaresService {

    @Autowired
    private FirmwaresMapper firmwaresMapper;
    @Autowired
    private FirmwareUpgradeRegionsMapper upgradeRegionsMapper;
    @Autowired
    private FirmwareUpgradeActivityMapper upgradeActivityMapper;


    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, timeout=36000, rollbackFor=Exception.class)
    public boolean addFirmware(FirmwaresParam firmwareParam) {
        Firmwares firmware = new Firmwares();
        BeanUtils.copyProperties(firmwareParam, firmware);
        List<FirmwareUpgradeRegionsParam> upgradeRegionsParams = firmwareParam.getRegions();
        FirmwareUpgradeActivityParam upgradeActivityParam = firmwareParam.getUpgradeActivity();
        FirmwareUpgradeActivity upgradeActivity = new FirmwareUpgradeActivity();
        BeanUtils.copyProperties(upgradeActivityParam, upgradeActivity);

        firmware.setCreatedOn(new Date());
        int ret = firmwaresMapper.insert(firmware);

        if ((ret > 0) && (upgradeRegionsParams != null) && (upgradeRegionsParams.size() > 0)) {
            List<FirmwareUpgradeRegions> upgradeRegions = new ArrayList<FirmwareUpgradeRegions>();
            for (FirmwareUpgradeRegionsParam upgradeRegionParam : upgradeRegionsParams) {
                FirmwareUpgradeRegions upgradeRegion = new FirmwareUpgradeRegions();
                BeanUtils.copyProperties(upgradeRegionParam, upgradeRegion);
                upgradeRegion.setFirmwareId(firmware.getId());
                upgradeRegion.setCreatedOn(new Date());
                upgradeRegions.add(upgradeRegion);
            }
            ret = upgradeRegionsMapper.insertList(upgradeRegions);
        }

        if (ret > 0) {
            upgradeActivity.setFirmwareId(firmware.getId());
            upgradeActivity.setCreatedOn(new Date());
            ret = upgradeActivityMapper.insertUpgradeActivity(upgradeActivity);
        }

//        if (ret > 0)
//            return firmware;
//        else
//            return null;
        return ret > 0;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, timeout=36000, rollbackFor=Exception.class)
    public boolean deleteFirmware(Integer id) {
        upgradeRegionsMapper.deleteByFirmwareId(id);
        upgradeActivityMapper.deleteByFirmwareId(id);
        return removeById(id);
    }

    @Override
    public Page<Firmwares> queryPageFirmwares(Integer pageSize, Integer pageNum) {
        Page<Firmwares> page = new Page<>(pageNum, pageSize);
        QueryWrapper<Firmwares> wrapper = new QueryWrapper<>();
        return page(page, wrapper);
    }

    @Override
    public FirmwaresParam queryFirmware(Integer id) {
        Firmwares firmware = getById(id);
        List<FirmwareUpgradeRegions> upgradeRegions = upgradeRegionsMapper.selectByFirmwareId(id);
        FirmwareUpgradeActivity upgradeActivity = upgradeActivityMapper.selectByFirmwareId(id);

        List<FirmwareUpgradeRegionsParam> upgradeRegionsParam = new ArrayList<>();
        if ((upgradeRegions != null) && (upgradeRegions.size() > 0)) {
            for (FirmwareUpgradeRegions upgradeRegion : upgradeRegions) {
                FirmwareUpgradeRegionsParam upgradeRegionParam = new FirmwareUpgradeRegionsParam();
                BeanUtils.copyProperties(upgradeRegion, upgradeRegionParam);
                upgradeRegionsParam.add(upgradeRegionParam);
            }
        }

        FirmwareUpgradeActivityParam upgradeActivityParam = new FirmwareUpgradeActivityParam();
        BeanUtils.copyProperties(upgradeActivity, upgradeActivityParam);

        FirmwaresParam firmwaresParam = new FirmwaresParam();
        BeanUtils.copyProperties(firmware, firmwaresParam);
        firmwaresParam.setRegions(upgradeRegionsParam);
        firmwaresParam.setUpgradeActivity(upgradeActivityParam);

        return firmwaresParam;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, timeout=36000, rollbackFor=Exception.class)
    public boolean updateFirmware(FirmwaresParam firmwareParam) {
        Firmwares firmware = new Firmwares();
        BeanUtils.copyProperties(firmwareParam, firmware);
        List<FirmwareUpgradeRegionsParam> upgradeRegionsParams = firmwareParam.getRegions();
        FirmwareUpgradeActivityParam upgradeActivityParam = firmwareParam.getUpgradeActivity();
        FirmwareUpgradeActivity upgradeActivity = new FirmwareUpgradeActivity();
        BeanUtils.copyProperties(upgradeActivityParam, upgradeActivity);

        firmware.setChangedOn(new Date());
        int ret = firmwaresMapper.updateById(firmware);

        if ((ret > 0) && (upgradeRegionsParams != null) && (upgradeRegionsParams.size() > 0)) {
            List<FirmwareUpgradeRegions> upgradeRegions = new ArrayList<FirmwareUpgradeRegions>();
            for (FirmwareUpgradeRegionsParam upgradeRegionParam : upgradeRegionsParams) {
                FirmwareUpgradeRegions upgradeRegion = new FirmwareUpgradeRegions();
                BeanUtils.copyProperties(upgradeRegionParam, upgradeRegion);
                upgradeRegion.setFirmwareId(firmware.getId());
                upgradeRegion.setChangedOn(new Date());
                upgradeRegions.add(upgradeRegion);
            }
            if (upgradeRegionsMapper.deleteByFirmwareId(firmware.getId()) > 0)
                ret = upgradeRegionsMapper.insertList(upgradeRegions);
        }

        upgradeActivity.setFirmwareId(firmware.getId());
        upgradeActivity.setChangedOn(new Date());
        upgradeActivityMapper.updateByFirmwareId(upgradeActivity);

        return ret > 0;
    }

}
