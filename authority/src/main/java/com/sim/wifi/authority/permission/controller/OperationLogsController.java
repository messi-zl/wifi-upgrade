package com.sim.wifi.authority.permission.controller;


import io.swagger.annotations.Api;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * description: 操作日志信息管理controller
 * create by: li.zheng871@sim.com
 * create time: 2021/7/9
 */
@Controller
@Api(tags = "OperationLogsController", description = "操作日志信息管理")
@RequestMapping("/permission/operationLogs")
public class OperationLogsController {
    private static final Logger logger = LoggerFactory.getLogger(OperationLogsController.class);

}

