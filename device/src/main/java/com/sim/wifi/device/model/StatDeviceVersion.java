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
 * 设备版本运行统计表
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-24
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("stat_device_version")
@ApiModel(value="StatDeviceVersion对象", description="设备版本运行统计表")
public class StatDeviceVersion implements Serializable {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "设备id")
    private Integer deviceId;

    @ApiModelProperty(value = "版本号")
    private String version;

    @ApiModelProperty(value = "版本更新时间")
    private String versionUpdateOn;

    @ApiModelProperty(value = "累计在线天数")
    private Integer onlineDays;

    @ApiModelProperty(value = "最后在线时间")
    private String lastOnlineOn;

    @ApiModelProperty(value = "创建日期")
    private Date createdOn;

    @ApiModelProperty(value = "更改日期")
    private Date changedOn;

}
