package com.sim.wifi.device.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.util.Map;

/**
 * 设备详情参数
 */
@Getter
@Setter
public class DeviceDetailsParam {

    @ApiModelProperty(value = "设备基本信息参数")
    DeviceBasicParam basic;

    @ApiModelProperty(value = "设备运行信息参数")
    DeviceRunningParam running;

    @ApiModelProperty(value = "设备激活信息参数")
//    Map<String, DeviceActivateParam> activate;
    DeviceActivateParam.DeviceActivate activate;

    @ApiModelProperty(value = "设备检测和升级信息参数")
    DeviceUpgradeParam upgrade;

    @ApiModelProperty(value = "设备在线统计信息参数")
    DeviceOnlineParam online;

    @ApiModelProperty(value = "设备版本统计信息参数")
    DeviceVersionParam version;

}
