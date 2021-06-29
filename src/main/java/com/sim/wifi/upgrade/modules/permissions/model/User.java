package com.sim.wifi.upgrade.modules.permissions.model;

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
 * description:
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("user")
@ApiModel(value = "User对象", description = "后台用户表")
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private String firstName;

    private String lastName;

    private String username;

    private String password;

    private Boolean active;

    private String email;

    private Date lastLogin;

    private Integer loginCount;

    private Integer failLoginCount;

    private Date createdOn;

    private Date changedOn;

    private Integer createdByFk;

    private Integer changedByFk;


}
