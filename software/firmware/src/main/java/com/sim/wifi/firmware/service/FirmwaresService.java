package com.sim.wifi.firmware.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sim.wifi.firmware.dto.FirmwaresParam;
import com.sim.wifi.firmware.model.Firmwares;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 固件表 服务类
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-17
 */
public interface FirmwaresService extends IService<Firmwares> {

    /**
     * 添加固件
     */
    boolean addFirmware(FirmwaresParam firmware);

    /**
     * 删除固件
     */
    boolean deleteFirmware(Integer id);

    /**
     * 分页查询所有固件
     */
    Page<Firmwares> queryPageFirmwares(Integer pageSize, Integer pageNum);

    /**
     * 查询固件
     */
    FirmwaresParam queryFirmware(Integer id);

    /**
     * 修改固件
     */
    boolean updateFirmware(FirmwaresParam firmwareParam);

}
