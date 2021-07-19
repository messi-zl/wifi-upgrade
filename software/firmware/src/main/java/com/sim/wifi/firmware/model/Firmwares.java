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
 * 固件表
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-14
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("firmwares")
@ApiModel(value="Firmwares对象", description="固件表")
public class Firmwares implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private Integer modelId;

    @ApiModelProperty(value = "固件版本号")
    private String realVersion;

    @ApiModelProperty(value = "显示版本号")
    private String showVersion;

    @ApiModelProperty(value = "更新说明")
    private String updateDescription;

    @ApiModelProperty(value = "上线状态:0->下线;1->上线")
    private Integer status;

    @ApiModelProperty(value = "升级类型:0->推荐升级;1->强制升级")
    private Integer upgradeType;

    @ApiModelProperty(value = "生效时间")
    private Date effectOn;

    @ApiModelProperty(value = "升级总量;0->不限制")
    private Integer upgradeLimit;

    @ApiModelProperty(value = "单日自动升级总量;0->不限制")
    private Integer dayAutoUpgradeLimit;

    @ApiModelProperty(value = "单日手动升级总量;0->不限制")
    private Integer dayManualUpgradeLimit;

    @ApiModelProperty(value = "允许升级的最低版本")
    private String lowestVersion;

    @ApiModelProperty(value = "允许升级的最高版本")
    private String highestVersion;

    @ApiModelProperty(value = "升级地区限定:0->禁止升级地区;1->允许升级地区")
    private Integer upgradeRegionBlacklistFlag;

    @ApiModelProperty(value = "限定允许升级的MAC(设备)")
    private String macLimit;

    @ApiModelProperty(value = "限定运营商升级:CHA(中国电信),CHL(中国移动),CHU(中国联通)")
    private String upgradeDno;

    @ApiModelProperty(value = "限定升级检测来源:AUTO(自动升级),WEB(手动升级)")
    private String upgradeDetection;

    @ApiModelProperty(value = "固件升级文件")
    private String url;

    @ApiModelProperty(value = "MD5值")
    private String md5;

    @ApiModelProperty(value = "创建日期")
    private Date createdOn;

    @ApiModelProperty(value = "更改日期")
    private Date changedOn;

    @ApiModelProperty(value = "创建者")
    private Integer createdBy;

    @ApiModelProperty(value = "更改者")
    private Integer changedBy;


}
