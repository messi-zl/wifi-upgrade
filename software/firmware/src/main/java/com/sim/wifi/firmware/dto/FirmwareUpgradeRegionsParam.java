package com.sim.wifi.firmware.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * 升级地区参数
 */
@Getter
@Setter
public class FirmwareUpgradeRegionsParam {

    @ApiModelProperty(value = "省")
    private String province;

    @ApiModelProperty(value = "市")
    private String city;

}
