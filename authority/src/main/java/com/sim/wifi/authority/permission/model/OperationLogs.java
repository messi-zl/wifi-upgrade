package com.sim.wifi.authority.permission.model;

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
 * description: 操作日志信息表
 * create by: li.zheng871@sim.com
 * create time: 2021/7/9
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("operation_logs")
@ApiModel(value="OperationLogs对象", description="操作日志信息表")
public class OperationLogs implements Serializable {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "自增主键ID")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "具体日志描述")
    private String description;

    @ApiModelProperty(value = "动作")
    private String action;

    @ApiModelProperty(value = "请求路径")
    private String requestPath;

    @ApiModelProperty(value = "请求json参数")
    private String json;

    @ApiModelProperty(value = "IP地址")
    private String ipAddr;

    @ApiModelProperty(value = "持续时间(毫秒)")
    private Integer durationMs;

    @ApiModelProperty(value = "操作时间")
    private Date createdOn;

    @ApiModelProperty(value = "操作人")
    private Integer createdBy;


}
