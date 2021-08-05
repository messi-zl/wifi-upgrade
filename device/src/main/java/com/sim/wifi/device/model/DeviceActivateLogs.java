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
 * 设备激活日志表
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-19
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("device_activate_logs")
@ApiModel(value="DeviceActivateLogs对象", description="设备激活日志表")
public class DeviceActivateLogs implements Serializable {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "设备id")
    private Integer deviceId;

    @ApiModelProperty(value = "激活时间")
    private String activatedOn;

    @ApiModelProperty(value = "激活版本")
    private String activatedVersion;

    @ApiModelProperty(value = "激活IP")
    private String activatedIp;

    @ApiModelProperty(value = "激活地址与运营商")
    private String activatedDno;

    @ApiModelProperty(value = "创建日期")
    private Date createdOn;


}
