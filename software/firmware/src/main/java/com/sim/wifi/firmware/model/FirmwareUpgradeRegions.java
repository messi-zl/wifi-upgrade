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
 * 升级地区表
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-17
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("firmware_upgrade_regions")
@ApiModel(value="FirmwareUpgradeRegions对象", description="升级地区表")
public class FirmwareUpgradeRegions implements Serializable {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "固件id")
    private Integer firmwareId;

    @ApiModelProperty(value = "省")
    private String province;

    @ApiModelProperty(value = "市")
    private String city;

    @ApiModelProperty(value = "创建日期")
    private Date createdOn;

    @ApiModelProperty(value = "更改日期")
    private Date changedOn;

    @ApiModelProperty(value = "创建者")
    private Integer createdBy;

    @ApiModelProperty(value = "更改者")
    private Integer changedBy;


}
