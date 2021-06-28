package com.sim.wifi.upgrade.modules.permissions.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotEmpty;

/**
 * @Author: zl
 * @DateTime: 2021/6/28
 * @Description:
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class AbUserLoginParam {
    @NotEmpty
    @ApiModelProperty(value = "用户名",required = true)
    private String username;
    @NotEmpty
    @ApiModelProperty(value = "密码",required = true)
    private String password;
}
