package com.sim.wifi.firmware.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.Getter;
import lombok.NonNull;
import lombok.Setter;

import java.util.Date;
import java.util.List;

/**
 * 添加/编辑固件参数
 */
@Getter
@Setter
public class FirmwaresParam {

    @ApiModelProperty(value = "固件id")
    private Integer id;

    @NonNull
    @ApiModelProperty(value = "设备型号id")
    private Integer modelId;

    @NonNull
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
    private String effectOn;

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

    @ApiModelProperty(value = "允许/禁止升级地区列表")
    private List<FirmwareUpgradeRegionsParam> regions;

    @ApiModelProperty(value = "限定允许升级的MAC(设备)")
    private String macLimit;

    @ApiModelProperty(value = "限定运营商升级:CHA(中国电信),CHL(中国移动),CHU(中国联通)")
    private String upgradeDno;

    @ApiModelProperty(value = "限定升级检测来源:AUTO(自动升级),WEB(手动升级)")
    private String upgradeDetection;

    @ApiModelProperty(value = "活跃度筛选")
    private FirmwareUpgradeActivityParam upgradeActivity;

    @ApiModelProperty(value = "固件升级文件名")
    private String fileName;

    @NonNull
    @ApiModelProperty(value = "固件升级文件地址")
    private String url;

    @NonNull
    @ApiModelProperty(value = "MD5值")
    private String md5;

}
