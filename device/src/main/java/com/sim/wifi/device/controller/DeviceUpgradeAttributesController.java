package com.sim.wifi.device.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sim.wifi.device.common.api.CommonPage;
import com.sim.wifi.device.common.api.CommonResult;
import com.sim.wifi.device.dto.DeviceTypesParam;
import com.sim.wifi.device.dto.DeviceUpgradeAttributesParam;
import com.sim.wifi.device.mapper.DeviceUpgradeAttributesMapper;
import com.sim.wifi.device.model.DeviceUpgradeAttributes;
import com.sim.wifi.device.service.DeviceUpgradeAttributesService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 设备升级属性表 前端控制器
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-21
 */
@RestController
//@Api(tags = "DeviceUpgradeAttributesController", description = "设备升级属性管理")
@RequestMapping("/deviceUpgradeAttributes")
public class DeviceUpgradeAttributesController {

//    @Autowired
//    private DeviceUpgradeAttributesService upgradeAttributesService;
//
//    @ApiOperation("添加设备升级属性")
//    @PostMapping(value = "/model/upgrade", headers = {"Accept=application/json"})
//    @ResponseBody
//    public CommonResult addUpgradeAttributes(@RequestBody DeviceUpgradeAttributesParam upgradeAttributesParam) {
//        boolean success = upgradeAttributesService.addUpgradeAttributes(upgradeAttributesParam);
//        if (success) {
//            return CommonResult.success(null);
//        } else {
//            return CommonResult.failed();
//        }
//    }
//
//    @ApiOperation("删除设备升级属性")
//    @DeleteMapping(value = "/model/upgrade", headers = {"Accept=application/json"})
//    @ResponseBody
//    public CommonResult deleteUpgradeAttributes(@RequestParam(name = "id") Integer id) {
//        boolean success = upgradeAttributesService.deleteUpgradeAttributes(id);
//        if (success) {
//            return CommonResult.success(null);
//        } else {
//            return CommonResult.failed();
//        }
//    }
//
//    @ApiOperation("分页查询设备升级属性")
//    @GetMapping(value = "/model/upgrade", headers = {"Accept=application/json"})
//    @ResponseBody
//    public CommonResult<CommonPage<DeviceUpgradeAttributes>> queryUpgradeAttributes(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
//                                                                                    @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
//        Page<DeviceUpgradeAttributes> firmwareList = upgradeAttributesService.queryPageUpgradeAttributes(pageSize, pageNum);
//        return CommonResult.success(CommonPage.restPage(firmwareList));
//    }
//
//    @ApiOperation("更新设备升级属性")
//    @PutMapping(value = "/model/upgrade", headers = {"Accept=application/json"})
//    @ResponseBody
//    public CommonResult updateUpgradeAttributes(@RequestBody DeviceUpgradeAttributesParam upgradeAttributesParam) {
//        boolean success = upgradeAttributesService.updateUpgradeAttributes(upgradeAttributesParam);
//        if (success) {
//            return CommonResult.success(null);
//        } else {
//            return CommonResult.failed();
//        }
//    }

}

