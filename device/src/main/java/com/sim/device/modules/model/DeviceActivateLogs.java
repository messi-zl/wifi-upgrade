package com.sim.device.modules.model;

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
 * @author device-management
 * @since 2021-07-12
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("device_activate_logs")
@ApiModel(value="DeviceActivateLogs对象", description="设备激活日志表")
public class DeviceActivateLogs implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private Integer deviceId;

    @ApiModelProperty(value = "激活时间")
    private Date activatedOn;

    @ApiModelProperty(value = "激活版本")
    private String activatedVersion;

    @ApiModelProperty(value = "激活IP")
    private String activatedIp;

    @ApiModelProperty(value = "激活地址与运营商")
    private String activatedDno;

    @ApiModelProperty(value = "创建日期")
    private Date createdOn;


}
