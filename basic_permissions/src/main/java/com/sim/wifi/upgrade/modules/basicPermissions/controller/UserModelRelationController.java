package com.sim.wifi.upgrade.modules.basicPermissions.controller;


import io.swagger.annotations.Api;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * description: 用户与型号对应关系管理controller
 * create by: li.zheng871@sim.com
 * create time: 2021/7/9
 */
@Controller
@Api(tags = "UserModelRelationController", description = "用户与型号对应关系管理")
@RequestMapping("/basicPermissions/userModelRelation")
public class UserModelRelationController {
    private static final Logger logger = LoggerFactory.getLogger(UserModelRelationController.class);

}

