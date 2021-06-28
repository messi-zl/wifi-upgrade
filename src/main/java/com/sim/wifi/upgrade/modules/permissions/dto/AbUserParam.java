package com.sim.wifi.upgrade.modules.permissions.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

/**
 * @Author: zl
 * @DateTime: 2021/6/28
 * @Description:
 */
@Getter
@Setter
public class AbUserParam {
    @NotEmpty
    @ApiModelProperty(value = "用户名", required = true)
    private String username;
    @NotEmpty
    @ApiModelProperty(value = "密码", required = true)
    private String password;
    @NotEmpty
    @ApiModelProperty(value = "名", required = true)
    private String firstName;
    @NotEmpty
    @ApiModelProperty(value = "姓", required = true)
    private String lastName;
    @Email
    @ApiModelProperty(value = "邮箱",required = true)
    private String email;

}
