package com.sim.wifi.authority.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

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
    @NotEmpty
    @ApiModelProperty(value = "操作人姓名", required = true)
    private String name;
    @NotEmpty
    @ApiModelProperty(value = "所属部门", required = true)
    private String department;
    @NotEmpty
    @ApiModelProperty(value = "联系电话", required = true)
    private String phone;
    @NotNull
    @ApiModelProperty(value = "账号状态", required = true)
    private Integer status;

    @Override
    public String toString() {
        return "UsersParam{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", employeeNo='" + employeeNo + '\'' +
                ", name='" + name + '\'' +
                ", department='" + department + '\'' +
                ", phone='" + phone + '\'' +
                ", status=" + status +
                '}';
    }
}
