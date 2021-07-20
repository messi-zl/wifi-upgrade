package com.sim.wifi.authority.permission.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 用户登录日志表
 * </p>
 *
 * @author li.zheng871@sim.com
 * @since 2021-07-15
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("login_logs")
@ApiModel(value = "LoginLogs对象", description = "用户登录日志表")
public class LoginLogs implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "自增主键id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "关联用户id")
    private Integer useId;

    @ApiModelProperty(value = "登录的状态(0:登录失败；1:登录成功)")
    private Integer status;

    @ApiModelProperty(value = "登录的时间")
    private Date loginTime;


}
