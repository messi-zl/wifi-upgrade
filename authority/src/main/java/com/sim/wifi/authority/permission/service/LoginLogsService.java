package com.sim.wifi.authority.permission.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.sim.wifi.authority.permission.model.LoginLogs;

import java.util.Date;
import java.util.List;

/**
 * <p>
 * 用户登录日志表 服务类
 * </p>
 *
 * @author li.zheng871@sim.com
 * @since 2021-07-15
 */
public interface LoginLogsService extends IService<LoginLogs> {
    public static Integer STATUS_SUCCESS = 1;
    public static Integer STATUS_FAIL = 0;

    //找出endDate往前rangeTime分钟内，状态为status的LoginLogs的记录
    public List<LoginLogs> lockNode(Integer userId, Integer rangeTime, Date endDate, Integer status);
}
