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
 * 设备运行日志表
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-19
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("device_running_logs")
@ApiModel(value="DeviceRunningLogs对象", description="设备运行日志表")
public class DeviceRunningLogs implements Serializable {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "设备id")
    private Integer deviceId;

    @ApiModelProperty(value = "在线状态:0->离线;1->在线")
    private Integer status;

    @ApiModelProperty(value = "升级方式:0->自动;1->手动")
    private Integer upgradeMethod;

    @ApiModelProperty(value = "运行时间")
    private String runningTime;

    @ApiModelProperty(value = "创建日期")
    private Date createdOn;


}
