package com.sim.wifi.authority.permission.controller;


import com.sim.wifi.authority.common.api.CommonResult;
import com.sim.wifi.authority.common.log.CustomOperationLog;
import com.sim.wifi.authority.permission.service.UserPermissionRelationService;
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
 * description: 用户与权限对应关系管理controller
 * create by: li.zheng871@sim.com
 * create time: 2021/7/9
 */
@Controller
@Api(tags = "UserPermissionRelationController", description = "用户与权限对应关系管理")
@RequestMapping("/permission/userPermissionRelation")
public class UserPermissionRelationController {
    private static final Logger logger = LoggerFactory.getLogger(UserPermissionRelationController.class);
    @Autowired
    private UserPermissionRelationService userPermissionRelationService;

    @CustomOperationLog
    @ApiOperation("给用户分配权限")
    @RequestMapping(value = "/allocPermission", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult allocPermissionToUser(@RequestParam Integer userId, @RequestParam List<Integer> permissionIds) {
        int count = userPermissionRelationService.allocPermissionToUser(userId, permissionIds);
        return CommonResult.success(count);
    }
}

