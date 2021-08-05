package com.sim.wifi.device.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * 设备检测和升级信息参数
 */
@Getter
@Setter
public class DeviceUpgradeParam {

    @ApiModelProperty(value = "设备id")
    private Integer deviceId;

    @ApiModelProperty(value = "自动检测次数")
    private Integer autoDetectedTimes;

    @ApiModelProperty(value = "手动检测次数")
    private Integer manualDetectedTimes;

    @ApiModelProperty(value = "最近检测时间")
    private String lastDetectedOn;

    @ApiModelProperty(value = "本地升级次数")
    private Integer localUpgradeTimes;

    @ApiModelProperty(value = "最近升级时间")
    private String lastUpgradeOn;

}
