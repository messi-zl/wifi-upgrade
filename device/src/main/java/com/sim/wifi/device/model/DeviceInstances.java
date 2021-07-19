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
 * 设备表
 * </p>
 *
 * @author wifi-upgrade
 * @since 2021-07-14
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("device_instances")
@ApiModel(value="DeviceInstances对象", description="设备表")
public class DeviceInstances implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private Integer typeId;

    private Integer modelId;

    @ApiModelProperty(value = "MAC 地址")
    private String mac;

    @ApiModelProperty(value = "序列号")
    private String sn;

    @ApiModelProperty(value = "uuid")
    private String uuid;

    @ApiModelProperty(value = "创建日期")
    private Date createdOn;


}
