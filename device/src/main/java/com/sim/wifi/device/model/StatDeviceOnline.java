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
 * 设备在线统计表
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-24
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("stat_device_online")
@ApiModel(value="StatDeviceOnline对象", description="设备在线统计表")
public class StatDeviceOnline implements Serializable {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "设备id")
    private Integer deviceId;

    @ApiModelProperty(value = "最近连续在线天数")
    private Integer recentlyOnlineDays;

    @ApiModelProperty(value = "累计在线天数")
    private Integer onlineDays;

    @ApiModelProperty(value = "近7天连续在线天数")
    private Integer sevenDayOnlineDays;

    @ApiModelProperty(value = "近30天连续在线天数")
    private Integer thirtyDayOnlineDays;

    @ApiModelProperty(value = "创建日期")
    private Date createdOn;

    @ApiModelProperty(value = "更改日期")
    private Date changedOn;


}
