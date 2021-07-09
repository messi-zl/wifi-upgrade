package com.sim.wifi.upgrade.modules.basicPermissions.model;

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
 * description: 地区表
 * create by: li.zheng871@sim.com
 * create time: 2021/7/9
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("areas")
@ApiModel(value="Areas对象", description="地区表")
public class Areas implements Serializable {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "自增主键ID")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "关联上级ID")
    private Integer parentId;

    @ApiModelProperty(value = "区域编码")
    private String code;

    @ApiModelProperty(value = "区域名称")
    private String name;

    @ApiModelProperty(value = "创建时间")
    private Date createdOn;

    @ApiModelProperty(value = "修改时间")
    private Date changedOn;

    @ApiModelProperty(value = "创建人")
    private Integer createdBy;

    @ApiModelProperty(value = "修改人")
    private Integer changedBy;


}
