package com.sim.wifi.device.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * 设备基本信息参数
 */
@Getter
@Setter
public class DeviceBasicParam {

    @ApiModelProperty(value = "设备id")
    private Integer deviceId;

    @ApiModelProperty(value = "设备类型id")
    private Integer typeId;

    @ApiModelProperty(value = "设备类型名称")
    private String typeName;

    @ApiModelProperty(value = "设备型号id")
    private Integer modelId;

    @ApiModelProperty(value = "设备型号名称")
    private String modelName;

    @ApiModelProperty(value = "MAC 地址")
    private String mac;

    @ApiModelProperty(value = "序列号")
    private String sn;

    @ApiModelProperty(value = "uuid")
    private String uuid;

}
