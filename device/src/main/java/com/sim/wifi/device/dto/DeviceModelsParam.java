package com.sim.wifi.device.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * 设备型号参数
 */
@Getter
@Setter
public class DeviceModelsParam {

    @ApiModelProperty(value = "设备型号id")
    private Integer modelId;

    @ApiModelProperty(value = "设备型号名称")
    private String modelName;

}
