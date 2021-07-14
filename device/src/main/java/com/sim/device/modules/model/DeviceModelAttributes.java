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
 * 设备型号属性表
 * </p>
 *
 * @author device-management
 * @since 2021-07-12
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("device_model_attributes")
@ApiModel(value="DeviceModelAttributes对象", description="设备型号属性表")
public class DeviceModelAttributes implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    private Integer modelId;

    @ApiModelProperty(value = "是否在全局统计中展示:0->展示;1->不展示")
    private Integer showInStatistics;

    @ApiModelProperty(value = "是否为运营商设备:0->是;1->否")
    private Integer operatorDevice;

    @ApiModelProperty(value = "设备发售范围:0->境内;1->境外")
    private Integer salesArea;

    @ApiModelProperty(value = "创建日期")
    private Date createdOn;

    @ApiModelProperty(value = "更改日期")
    private Date changedOn;

    @ApiModelProperty(value = "创建者")
    private Integer createdBy;

    @ApiModelProperty(value = "更改者")
    private Integer changedBy;


}
