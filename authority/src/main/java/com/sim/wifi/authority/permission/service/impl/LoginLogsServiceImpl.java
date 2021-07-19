package com.sim.wifi.authority.permission.service.impl;

import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sim.wifi.authority.permission.model.LoginLogs;
import com.sim.wifi.authority.permission.mapper.LoginLogsMapper;
import com.sim.wifi.authority.permission.service.LoginLogsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * description: 用户登录日志表 服务实现类
 * create by: li.zheng871@sim.com
 * create time: 2021/7/9
 */
@Transactional
@Service
public class LoginLogsServiceImpl extends ServiceImpl<LoginLogsMapper, LoginLogs> implements LoginLogsService {
    private static final Logger logger = LoggerFactory.getLogger(LoginLogsServiceImpl.class);

    @Override
    public List<LoginLogs> lockNode(Integer userId,Integer rangeTime, Date endDate, Integer status) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(endDate);
        calendar.add(Calendar.MINUTE,~(rangeTime-1));
        Date beginDate = calendar.getTime();
        QueryWrapper<LoginLogs> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(LoginLogs::getUseId,userId).between(LoginLogs::getLoginTime,beginDate,endDate);
        List<LoginLogs> loginLogsList = list(wrapper);
        return loginLogsList;
    }
}
