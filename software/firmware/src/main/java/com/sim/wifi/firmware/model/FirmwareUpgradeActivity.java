package com.sim.wifi.firmware.model;

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
 * 活跃度筛选表
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-14
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("firmware_upgrade_activity")
@ApiModel(value="FirmwareUpgradeActivity对象", description="活跃度筛选表")
public class FirmwareUpgradeActivity implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private Integer firmwareId;

    @ApiModelProperty(value = "活跃度限制适用范围:0->全部设备;1->仅适用于勾选自动升级设备;2->仅适用于未勾选自动升级设备")
    private Integer activityLimitRange;

    @ApiModelProperty(value = "激活起始时间")
    private Date activationStartOn;

    @ApiModelProperty(value = "激活结束时间")
    private Date activationEndOn;

    @ApiModelProperty(value = "在线天数限制")
    private Integer onlineDays;

    @ApiModelProperty(value = "手动检测次数符号:0->小于;1->大于")
    private Integer manualDetectionSymbol;

    @ApiModelProperty(value = "手动检测次数")
    private Integer manualDetectionTimes;

    @ApiModelProperty(value = "最近检测时间")
    private Date lastDetectionOn;

    @ApiModelProperty(value = "本地升级次数符号:0->小于;1->大于")
    private Integer localUpgradeSymbol;

    @ApiModelProperty(value = "本地升级次数")
    private Integer localUpgradeTimes;

    @ApiModelProperty(value = "最近升级时间")
    private Date lastUpgradeOn;

    @ApiModelProperty(value = "创建日期")
    private Date createdOn;

    @ApiModelProperty(value = "更改日期")
    private Date changedOn;

    @ApiModelProperty(value = "创建者")
    private Integer createdBy;

    @ApiModelProperty(value = "更改者")
    private Integer changedBy;


}
