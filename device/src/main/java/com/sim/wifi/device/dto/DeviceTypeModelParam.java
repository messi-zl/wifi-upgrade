package com.sim.wifi.device.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * 设备类型和型号参数
 */
@Getter
@Setter
public class DeviceTypeModelParam {

    @ApiModelProperty(value = "设备类型id")
    private Integer typeId;

    @ApiModelProperty(value = "设备类型名称")
    private String typeName;

    @ApiModelProperty(value = "设备型号id")
    private Integer modelId;

    @ApiModelProperty(value = "设备型号名称")
    private String modelName;

}
