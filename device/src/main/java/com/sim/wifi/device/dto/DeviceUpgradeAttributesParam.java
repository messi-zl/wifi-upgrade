package com.sim.wifi.device.dto;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.NonNull;
import lombok.Setter;

/**
 * 设备升级属性参数
 */
@Getter
@Setter
public class DeviceUpgradeAttributesParam {

    @ApiModelProperty(value = "id")
    private Integer id;

    @NonNull
    @ApiModelProperty(value = "设备类型id")
    private Integer typeId;

    @NonNull
    @ApiModelProperty(value = "设备型号id")
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

    @ApiModelProperty(value = "自动升级开始时间")
    private String autoUpgradeStart;

    @ApiModelProperty(value = "自动升级结束时间")
    private String autoUpgradeEnd;

    @ApiModelProperty(value = "自动升级条件:0->流量小于100k时执行;1->没有无线连接时执行")
    private Integer autoUpgradeCondition;

}
