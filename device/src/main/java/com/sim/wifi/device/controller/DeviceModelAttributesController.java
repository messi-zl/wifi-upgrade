package com.sim.wifi.device.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sim.wifi.device.common.api.CommonPage;
import com.sim.wifi.device.common.api.CommonResult;
import com.sim.wifi.device.dto.DeviceModelAttributesParam;
import com.sim.wifi.device.model.DeviceUpgradeAttributes;
import com.sim.wifi.device.service.DeviceModelAttributesService;
import com.sim.wifi.device.service.DeviceUpgradeAttributesService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 设备型号属性表 前端控制器
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-19
 */
@RestController
@Api(tags = "DeviceModelAttributesController", description = "设备型号属性管理")
@RequestMapping("/v1")
public class DeviceModelAttributesController {

    @Autowired
    private DeviceUpgradeAttributesService upgradeAttributesService;
    @Autowired
    private DeviceModelAttributesService modelAttributesService;

    @ApiOperation("添加设备型号属性")
    @PostMapping(value = "/model/attributes", headers = {"Accept=application/json"})
    @ResponseBody
    public CommonResult addModelAttributes(@RequestBody DeviceModelAttributesParam modelAttributesParam) {
        if (modelAttributesParam.getTypeId() == null) {
            return CommonResult.validateFailed("设备类型 id 不能为空!");
        }
        boolean success = modelAttributesService.addModelAttributes(modelAttributesParam);
        if (success) {
            return CommonResult.success(null);
        } else {
            return CommonResult.failed();
        }
    }

    @ApiOperation("删除设备型号属性")
    @DeleteMapping(value = "/model/attributes", headers = {"Accept=application/json"})
    @ResponseBody
    public CommonResult deleteModelAttributes(@RequestParam(name = "modelId") Integer modelId) {
        boolean success = modelAttributesService.deleteModelAttributes(modelId);
        if (success) {
            return CommonResult.success(null);
        } else {
            return CommonResult.failed();
        }
    }

    @ApiOperation("查询设备型号属性")
    @GetMapping(value = "/model/attributes", headers = {"Accept=application/json"})
    @ResponseBody
    public CommonResult<DeviceModelAttributesParam> queryUpgradeAttributes(@RequestParam(name = "modelId") Integer modelId) {
        DeviceModelAttributesParam modelAttributesParam = modelAttributesService.queryModelAttributes(modelId);
        return CommonResult.success(modelAttributesParam);
    }

//    @ApiOperation("分页查询设备升级属性")
//    @GetMapping(value = "/model/upgrade/attributes", headers = {"Accept=application/json"})
//    @ResponseBody
//    public CommonResult<CommonPage<DeviceUpgradeAttributes>> queryModelAttributes(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
//                                                                                  @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
//        Page<DeviceUpgradeAttributes> firmwareList = upgradeAttributesService.queryPageUpgradeAttributes(pageSize, pageNum);
//        return CommonResult.success(CommonPage.restPage(firmwareList));
//    }
    @ApiOperation("分页查询设备升级属性")
    @GetMapping(value = "/model/upgrade/attributes", headers = {"Accept=application/json"})
    @ResponseBody
    public CommonResult<CommonPage<DeviceModelAttributesParam>> queryModelAttributes(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
                                                                                  @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
        Page<DeviceModelAttributesParam> firmwareList = modelAttributesService.queryUpgradeAttributes(pageSize, pageNum);
        return CommonResult.success(CommonPage.restPage(firmwareList));
    }

    @ApiOperation("更新设备型号属性")
    @PutMapping(value = "/model/attributes", headers = {"Accept=application/json"})
    @ResponseBody
    public CommonResult updateModelAttributes(@RequestBody DeviceModelAttributesParam modelAttributesParam) {
        boolean success = modelAttributesService.updateModelAttributes(modelAttributesParam);
        if (success) {
            return CommonResult.success(null);
        } else {
            return CommonResult.failed();
        }
    }

}

