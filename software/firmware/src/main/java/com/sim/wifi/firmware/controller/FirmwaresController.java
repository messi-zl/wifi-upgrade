package com.sim.wifi.firmware.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sim.wifi.firmware.common.api.CommonPage;
import com.sim.wifi.firmware.common.api.CommonResult;
import com.sim.wifi.firmware.dto.FirmwaresParam;
import com.sim.wifi.firmware.model.Firmwares;
import com.sim.wifi.firmware.service.FirmwaresService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 固件表 前端控制器
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-17
 */
@RestController
@Api(tags = "FirmwaresController", description = "固件管理")
@RequestMapping("/v1")
public class FirmwaresController {

    @Autowired
    private FirmwaresService firmwaresService;

    @ApiOperation("添加设备固件")
    @PostMapping(value = "/firmware", headers = {"Accept=application/json"})
    @ResponseBody
    public CommonResult addFirmware(@RequestBody FirmwaresParam firmwareParam) {
        boolean success = firmwaresService.addFirmware(firmwareParam);
        if (success) {
            return CommonResult.success(null);
        } else {
            return CommonResult.failed();
        }
    }

    @ApiOperation("删除设备固件")
    @DeleteMapping(value = "/firmware", headers = {"Accept=application/json"})
    @ResponseBody
    public CommonResult deleteFirmware(@RequestParam(name = "id") Integer id) {
        boolean success = firmwaresService.deleteFirmware(id);
        if (success) {
            return CommonResult.success(null);
        } else {
            return CommonResult.failed();
        }
    }

    @ApiOperation("查询设备固件")
    @GetMapping(value = "/firmware", headers = {"Accept=application/json"})
    @ResponseBody
    public CommonResult<FirmwaresParam> queryFirmware(@RequestParam(name = "id") Integer id) {
        FirmwaresParam firmwaresParam = firmwaresService.queryFirmware(id);
        return CommonResult.success(firmwaresParam);
    }

    @ApiOperation("分页查询设备固件")
    @GetMapping(value = "/firmware/page", headers = {"Accept=application/json"})
    @ResponseBody
    public CommonResult<CommonPage<Firmwares>> queryFirmware(@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
                                                             @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
        Page<Firmwares> firmwareList = firmwaresService.queryPageFirmwares(pageSize, pageNum);
        return CommonResult.success(CommonPage.restPage(firmwareList));
    }

    @ApiOperation("更新设备固件")
    @PutMapping(value = "/firmware", headers = {"Accept=application/json"})
    @ResponseBody
    public CommonResult updateFirmware(@RequestBody FirmwaresParam firmwareParam) {
        boolean success = firmwaresService.updateFirmware(firmwareParam);
        if (success) {
            return CommonResult.success(null);
        } else {
            return CommonResult.failed();
        }
    }

}

