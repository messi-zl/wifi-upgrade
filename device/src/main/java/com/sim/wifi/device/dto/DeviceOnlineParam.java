package com.sim.wifi.device.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * 设备在线统计信息参数
 */
@Getter
@Setter
public class DeviceOnlineParam {

    @ApiModelProperty(value = "设备id")
    private Integer deviceId;

    @ApiModelProperty(value = "最近连续在线天数")
    private Integer recentlyOnlineDays;

    @ApiModelProperty(value = "累计在线天数")
    private Integer onlineDays;

    @ApiModelProperty(value = "近7天连续在线天数")
    private Integer sevenDayOnlineDays;

    @ApiModelProperty(value = "近30天连续在线天数")
    private Integer thirtyDayOnlineDays;

}
