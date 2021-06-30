package com.sim.wifi.upgrade.modules.permissions.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

/**
 * description: 参数
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
@Getter
@Setter
public class UserParam {
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
    @ApiModelProperty(value = "邮箱", required = true)
    private String email;

    @Override
    public String toString() {
        return "UserParam{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
