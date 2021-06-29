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
@TableName("register_user")
@ApiModel(value = "RegisterUser对象", description = "")
public class RegisterUser implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private String firstName;

    private String lastName;

    private String username;

    private String password;

    private String email;

    private Date registrationDate;

    private String registrationHash;


}
