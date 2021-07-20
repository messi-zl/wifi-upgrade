package com.sim.wifi.authority.permission.controller;


import com.sim.wifi.authority.common.api.CommonResult;
import com.sim.wifi.authority.common.log.CustomOperationLog;
import com.sim.wifi.authority.permission.service.UserModelRelationService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


/**
 * description: 用户与型号对应关系管理controller
 * create by: li.zheng871@sim.com
 * create time: 2021/7/9
 */
@Controller
@Api(tags = "UserModelRelationController", description = "用户与型号对应关系管理")
@RequestMapping("/permission/userModelRelation")
public class UserModelRelationController {
    private static final Logger logger = LoggerFactory.getLogger(UserModelRelationController.class);

    @Autowired
    private UserModelRelationService userModelRelationService;

    @CustomOperationLog
    @ApiOperation("给用户分配型号")
    @RequestMapping(value = "/allocModel", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult allocModelToUser(@RequestParam Integer userId, @RequestParam List<Integer> modelIds) {
        int count = userModelRelationService.allocModelToUser(userId, modelIds);
        return CommonResult.success(count);
    }
}

