package com.sim.wifi.device.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * 设备运行信息参数
 */
@Getter
@Setter
public class DeviceRunningParam {

    @ApiModelProperty(value = "设备id")
    private Integer deviceId;

    @ApiModelProperty(value = "在线状态:0->离线;1->在线")
    private Integer status;

    @ApiModelProperty(value = "升级方式:0->自动;1->手动")
    private Integer upgradeMethod;

    @ApiModelProperty(value = "运行时间")
    private String runningTime;

}
