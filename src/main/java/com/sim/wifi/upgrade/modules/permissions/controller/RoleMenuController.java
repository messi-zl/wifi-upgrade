package com.sim.wifi.upgrade.modules.permissions.controller;


import com.sim.wifi.upgrade.common.api.CommonResult;
import com.sim.wifi.upgrade.modules.permissions.service.RoleMenuService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * description: 菜单对应关系管理controller
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
@Controller
@Api(tags = "RoleMenuController", description = "菜单对应关系管理")
@RequestMapping("/roleMenu")
public class RoleMenuController {
    @Autowired
    private RoleMenuService roleMenuService;

    @ApiOperation("分配菜单给用户")
    @RequestMapping(value = "/allocMenu", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult allocMenu(@RequestParam Integer userId, @RequestParam List<Integer> menuIds) {
        //弃用角色概念，roleId即为userId
        int count = roleMenuService.allocMenu(userId, menuIds);
        return CommonResult.success(count);
    }
}

