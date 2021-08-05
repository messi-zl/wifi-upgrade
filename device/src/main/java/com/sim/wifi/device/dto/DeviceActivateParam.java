package com.sim.wifi.device.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * 设备激活信息参数
 */
@Getter
@Setter
public class DeviceActivateParam {

    @ApiModelProperty(value = "设备id")
    private Integer deviceId;

    @ApiModelProperty(value = "激活时间")
    private String activatedOn;

    @ApiModelProperty(value = "激活版本")
    private String activatedVersion;

    @ApiModelProperty(value = "激活IP")
    private String activatedIp;

    @ApiModelProperty(value = "激活地址与运营商")
    private String activatedDno;

    @Getter
    @Setter
    public static class DeviceActivate {

        @ApiModelProperty(value = "首次激活信息")
        DeviceActivateParam first;

        @ApiModelProperty(value = "最近激活信息")
        DeviceActivateParam last;
    }

}
