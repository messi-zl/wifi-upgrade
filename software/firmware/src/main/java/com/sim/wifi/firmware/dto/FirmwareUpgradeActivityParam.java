package com.sim.wifi.firmware.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * 活跃度参数
 */
@Getter
@Setter
public class FirmwareUpgradeActivityParam {

    @ApiModelProperty(value = "活跃度限制适用范围:0->全部设备;1->仅适用于勾选自动升级设备;2->仅适用于未勾选自动升级设备")
    private Integer activityLimitRange;

    @ApiModelProperty(value = "激活起始时间")
    private String activationStartOn;

    @ApiModelProperty(value = "激活结束时间")
    private String activationEndOn;

    @ApiModelProperty(value = "在线天数限制")
    private Integer onlineDays;

    @ApiModelProperty(value = "手动检测次数符号:0->小于;1->大于")
    private Integer manualDetectionSymbol;

    @ApiModelProperty(value = "手动检测次数")
    private Integer manualDetectionTimes;

    @ApiModelProperty(value = "最近检测时间")
    private String lastDetectionOn;

    @ApiModelProperty(value = "本地升级次数符号:0->小于;1->大于")
    private Integer localUpgradeSymbol;

    @ApiModelProperty(value = "本地升级次数")
    private Integer localUpgradeTimes;

    @ApiModelProperty(value = "最近升级时间")
    private String lastUpgradeOn;

}
