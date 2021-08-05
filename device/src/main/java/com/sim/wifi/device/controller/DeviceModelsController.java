package com.sim.wifi.device.controller;


import com.sim.wifi.device.common.api.CommonResult;
import com.sim.wifi.device.dto.DeviceModelsParam;
import com.sim.wifi.device.dto.DeviceTypeModelParam;
import com.sim.wifi.device.dto.DeviceTypesParam;
import com.sim.wifi.device.model.DeviceModels;
import com.sim.wifi.device.model.DeviceTypes;
import com.sim.wifi.device.service.DeviceModelsService;
import com.sim.wifi.device.service.DeviceTypesService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 设备型号表 前端控制器
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-19
 */
@RestController
@Api(tags = "DeviceModelsController", description = "设备类型和型号管理")
@RequestMapping("/v1")
public class DeviceModelsController {

    @Autowired
    private DeviceTypesService deviceTypesService;
    @Autowired
    private DeviceModelsService deviceModelsService;


    @ApiOperation("添加设备类型")
    @PostMapping(value = "/type", headers = {"Accept=application/json"})
    @ResponseBody
    public CommonResult addDeviceType(@RequestBody DeviceTypesParam deviceTypesParam) {
        boolean success = deviceTypesService.addDeviceType(deviceTypesParam);
        if (success) {
            return CommonResult.success(null);
        } else {
            return CommonResult.failed();
        }
    }

    @ApiOperation("添加设备型号")
    @PostMapping(value = "/model", headers = {"Accept=application/json"})
    @ResponseBody
    public CommonResult addDeviceModel(@RequestBody DeviceTypeModelParam deviceModelsParam) {
        boolean success = deviceModelsService.addDeviceModel(deviceModelsParam);
        if (success) {
            return CommonResult.success(null);
        } else {
            return CommonResult.failed();
        }
    }

    @ApiOperation("查询设备类型")
    @GetMapping(value = "/types", headers = {"Accept=application/json"})
    @ResponseBody
    public CommonResult queryDeviceTypes() {
        List<DeviceTypesParam> deviceTypes = deviceTypesService.queryDeviceTypes();
        return CommonResult.success(deviceTypes);
    }

    @ApiOperation("根据设备类型查询所有设备型号")
    @GetMapping(value = "/type/models", headers = {"Accept=application/json"})
    @ResponseBody
    public CommonResult queryDeviceModelsByType(@RequestParam(name = "typeId") Integer typeId) {
        List<DeviceModelsParam> deviceModels = deviceModelsService.getDeviceModels(typeId);
        return CommonResult.success(deviceModels);
    }

    @ApiOperation("查询所有设备类型及其所有设备型号")
    @GetMapping(value = "/types/models", headers = {"Accept=application/json"})
    @ResponseBody
    public CommonResult queryDeviceModelsByTypes() {
//        List<Map<String, Object>> deviceTypesModels = deviceModelsService.getDeviceTypesAndModels();
//        List<DeviceTypeModelParam> deviceTypesModels = deviceModelsService.getDeviceTypesAndModels();
        List<Map<String, Object>> deviceTypesModels = deviceModelsService.getDeviceTypesAndModels();
        return CommonResult.success(deviceTypesModels);
    }

}

