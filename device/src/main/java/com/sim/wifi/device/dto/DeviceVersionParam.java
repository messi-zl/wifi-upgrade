package com.sim.wifi.device.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * 设备版本统计信息参数
 */
@Getter
@Setter
public class DeviceVersionParam {

    @ApiModelProperty(value = "设备id")
    private Integer deviceId;

    @ApiModelProperty(value = "版本号")
    private String version;

    @ApiModelProperty(value = "版本更新时间")
    private String versionUpdateOn;

    @ApiModelProperty(value = "累计在线天数")
    private Integer onlineDays;

    @ApiModelProperty(value = "最后在线时间")
    private String lastOnlineOn;

}
