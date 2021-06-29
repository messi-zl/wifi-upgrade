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
@TableName("device_states")
@ApiModel(value = "DeviceStates对象", description = "")
public class DeviceStates implements Serializable {

    private static final long serialVersionUID = 1L;

    private Date createdOn;

    private Date changedOn;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private Integer deviceInstanceId;

    private Integer cpuUsed;

    private Integer memUsed;

    private Integer wifiState;

    private Integer wanLanState;

    private Integer createdByFk;

    private Integer changedByFk;


}
