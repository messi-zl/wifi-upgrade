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
 * @since 2021-07-23
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("device_upgrade_logs")
@ApiModel(value="DeviceUpgradeLogs对象", description="设备检测与升级日志表")
public class DeviceUpgradeLogs implements Serializable {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "设备id")
    private Integer deviceId;

    @ApiModelProperty(value = "检测标志:0->未检测;1->自动检测;2->手动检测")
    private Integer detectedFlag;

    @ApiModelProperty(value = "升级标志:0->未升级;1->远程升级;2->本地升级")
    private Integer upgradeFlag;

    @ApiModelProperty(value = "创建日期")
    private Date createdOn;


}
