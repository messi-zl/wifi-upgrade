package com.sim.wifi.authority.permission.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sim.wifi.authority.permission.mapper.OperationLogsMapper;
import com.sim.wifi.authority.permission.model.OperationLogs;
import com.sim.wifi.authority.permission.service.OperationLogsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * description: 操作日志信息表 服务实现类
 * create by: li.zheng871@sim.com
 * create time: 2021/7/9
 */
@Transactional
@Service
public class OperationLogsServiceImpl extends ServiceImpl<OperationLogsMapper, OperationLogs> implements OperationLogsService {
    private static final Logger logger = LoggerFactory.getLogger(OperationLogsServiceImpl.class);

}
