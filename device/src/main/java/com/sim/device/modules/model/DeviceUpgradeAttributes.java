package com.sim.device.modules.model;

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
 * <p>
 * 设备升级属性表
 * </p>
 *
 * @author device-management
 * @since 2021-07-12
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("device_upgrade_attributes")
@ApiModel(value="DeviceUpgradeAttributes对象", description="设备升级属性表")
public class DeviceUpgradeAttributes implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private Integer typeId;

    private Integer modelId;

    @ApiModelProperty(value = "升级状态:0->允许升级;1->禁止升级;2->禁止升级,只统计数据")
    private Integer status;

    @ApiModelProperty(value = "检测方式:0->https;1->校验chk字段;2->必须https且校验chk字段")
    private Integer checkWay;

    @ApiModelProperty(value = "版本检测周期")
    private Integer checkPeriod;

    @ApiModelProperty(value = "检测到新版本后检测周期")
    private Integer checkedPeriod;

    @ApiModelProperty(value = "强制版本与更新的推荐版本:0->升级到强制版本后推荐最新版本;1->直接强制升级到当前最新版本")
    private Integer forcedUpgrade;

    private String autoUpgradeStart;

    private String autoUpgradeEnd;

    @ApiModelProperty(value = "自动升级条件:0->流量小于100k时执行;1->没有无线连接时执行")
    private Integer autoUpgradeCondition;

    @ApiModelProperty(value = "创建日期")
    private Date createdOn;

    @ApiModelProperty(value = "更改日期")
    private Date changedOn;

    @ApiModelProperty(value = "创建者")
    private Integer createdBy;

    @ApiModelProperty(value = "更改者")
    private Integer changedBy;


}
