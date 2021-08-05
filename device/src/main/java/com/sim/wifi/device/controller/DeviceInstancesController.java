package com.sim.wifi.device.controller;


import com.sim.wifi.device.common.api.CommonResult;
import com.sim.wifi.device.dto.DeviceDetailsParam;
import com.sim.wifi.device.dto.DeviceModelAttributesParam;
import com.sim.wifi.device.model.DeviceInstances;
import com.sim.wifi.device.service.DeviceInstancesService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 设备表 前端控制器
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-19
 */
@RestController
@Api(tags = "DeviceInstancesController", description = "设备管理")
@RequestMapping("/v1")
public class DeviceInstancesController {

    @Autowired
    private DeviceInstancesService deviceInstancesService;

    @ApiOperation("查询设备型号属性")
    @GetMapping(value = "/device/details", headers = {"Accept=application/json"})
    @ResponseBody
    public CommonResult<DeviceDetailsParam> queryDeviceDetails(@RequestParam(name = "typeId") Integer typeId,
                                                               @RequestParam(name = "modelId") Integer modelId,
                                                               @RequestParam(name = "mac", required = false) String mac,
                                                               @RequestParam(name = "sn", required = false) String sn,
                                                               @RequestParam(name = "uuid", required = false) String uuid) {
        if ((mac == null) && (sn == null) && (uuid == null)) return CommonResult.validateFailed("必须指定一种搜索条件 mac/sn/uuid");
        DeviceInstances deviceInstances = new DeviceInstances();
        deviceInstances.setTypeId(typeId);
        deviceInstances.setModelId(modelId);
        deviceInstances.setMac(mac);
        deviceInstances.setSn(sn);
        deviceInstances.setUuid(uuid);
        DeviceDetailsParam deviceDetails = deviceInstancesService.queryDeviceDetails(deviceInstances);

        if (deviceDetails != null)
            return CommonResult.success(deviceDetails);
        return CommonResult.failed();
    }

}

