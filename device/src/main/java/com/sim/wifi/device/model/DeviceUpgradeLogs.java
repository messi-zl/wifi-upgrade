package com.sim.wifi.device.model;

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
 * 设备检测与升级日志表
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-14
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("device_upgrade_logs")
@ApiModel(value="DeviceUpgradeLogs对象", description="设备检测与升级日志表")
public class DeviceUpgradeLogs implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private Integer deviceId;

    @ApiModelProperty(value = "自动检测:0->未自动检测;1->自动检测")
    private Integer autoDetectionFlag;

    @ApiModelProperty(value = "web手动检测:0->未手动检测;1->手动检测")
    private Integer manualDetectionFlag;

    @ApiModelProperty(value = "本地升级:0->非本地升级;1->本地升级")
    private Integer localUpgradeFlag;

    @ApiModelProperty(value = "创建日期")
    private Date createdOn;


}
