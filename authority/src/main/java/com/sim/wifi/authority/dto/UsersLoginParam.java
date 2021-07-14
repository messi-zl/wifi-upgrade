package com.sim.wifi.authority.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotEmpty;

/**
 * @Description: 用户登录参数
 * @CreateBy: li.zheng871@sim.com
 * @DateTime: 2021/7/12
 */
@Getter
@Setter
public class UsersLoginParam {
    @NotEmpty
    @ApiModelProperty(value = "用户名", required = true)
    private String username;
    @NotEmpty
    @ApiModelProperty(value = "密码", required = true)
    private String password;
}
