package com.sim.wifi.authority.permission.controller;


import io.swagger.annotations.Api;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * description: 地区管理controller
 * create by: li.zheng871@sim.com
 * create time: 2021/7/9
 */
@Controller
@Api(tags = "AreasController", description = "地区管理")
@RequestMapping("/permission/areas")
public class AreasController {
    private static final Logger logger = LoggerFactory.getLogger(AreasController.class);

}

