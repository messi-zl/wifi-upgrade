package com.sim.wifi.upgrade.modules.basicPermissions.controller;


import io.swagger.annotations.Api;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * description: 用户管理controller
 * create by: li.zheng871@sim.com
 * create time: 2021/7/9
 */
@Controller
@Api(tags = "UsersController", description = "后台用户管理")
@RequestMapping("/basicPermissions/users")
public class UsersController {
    private static final Logger logger = LoggerFactory.getLogger(UsersController.class);

}

