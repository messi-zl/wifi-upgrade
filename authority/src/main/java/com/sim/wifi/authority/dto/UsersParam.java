package com.sim.wifi.authority.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotEmpty;

/**
 * @Description: 参数
 * @CreateBy: li.zheng871@sim.com
 * @DateTime: 2021/7/12
 */
@Getter
@Setter
public class UsersParam {
    @NotEmpty
    @ApiModelProperty(value = "用户名", required = true)
    private String username;
    @NotEmpty
    @ApiModelProperty(value = "密码", required = true)
    private String password;
    @NotEmpty
    @ApiModelProperty(value = "工号", required = true)
    private String employeeNo;

    @Override
    public String toString() {
        return "UsersParam{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", employeeNo='" + employeeNo + '\'' +
                '}';
    }
}
