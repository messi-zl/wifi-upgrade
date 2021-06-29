package com.sim.wifi.upgrade.modules.permissions.controller;


import com.sim.wifi.upgrade.common.api.CommonResult;
import com.sim.wifi.upgrade.modules.permissions.service.RoleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * description: 角色管理controller(无角色概念)
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
//@Controller
@Api(tags = "RoleController", description = "角色管理")
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private RoleService roleService;

    @ApiOperation("给角色分配菜单")
    @RequestMapping(value = "/allocMenu", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult allocMenu(@RequestParam Integer roleId, @RequestParam List<Integer> menuIds) {
        int count = roleService.allocMenu(roleId, menuIds);
        return CommonResult.success(count);
    }

    @ApiOperation("给角色分配资源")
    @RequestMapping(value = "/allocResource", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult allocResource(@RequestParam Integer roleId, @RequestParam List<Integer> resourceIds) {
        int count = roleService.allocResource(roleId, resourceIds);
        return CommonResult.success(count);
    }
}

