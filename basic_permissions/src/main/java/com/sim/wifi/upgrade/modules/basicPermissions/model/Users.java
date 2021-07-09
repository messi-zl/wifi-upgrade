package com.sim.wifi.upgrade.modules.basicPermissions.model;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * description: 用户表
 * create by: li.zheng871@sim.com
 * create time: 2021/7/9
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("users")
@ApiModel(value="Users对象", description="用户表")
public class Users implements Serializable {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "用户id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "用户名")
    private String username;

    @ApiModelProperty(value = "密码")
    private String password;

    @ApiModelProperty(value = "工号")
    private String employeeNo;

    @ApiModelProperty(value = "联系电话")
    private String phone;

    @ApiModelProperty(value = "所属部门")
    private String department;

    @ApiModelProperty(value = "操作人姓名")
    private String name;

    @ApiModelProperty(value = "状态(0:禁用；1:启用)")
    private Integer status;

    @ApiModelProperty(value = "锁定时间")
    private Date lockingTime;

    @ApiModelProperty(value = "登录失败次数")
    private Integer failLoginCount;

    @ApiModelProperty(value = "创建时间")
    private Date createdOn;

    @ApiModelProperty(value = "修改时间")
    private Date changedOn;

    @ApiModelProperty(value = "创建人")
    private Integer createdBy;

    @ApiModelProperty(value = "修改人")
    private Integer changedBy;


}
