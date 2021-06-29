package com.sim.wifi.upgrade.modules.permissions.controller;


import com.sim.wifi.upgrade.common.api.CommonResult;
import com.sim.wifi.upgrade.modules.permissions.service.AbRoleMenuService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zl
 * @since 2021-06-25
 */
@Controller
@Api(tags = "AbRoleMenuController", description = "菜单对应关系管理")
@RequestMapping("/roleMenu")
public class AbRoleMenuController {
    @Autowired
    private AbRoleMenuService roleMenuService;

    @ApiOperation("分配菜单给用户")
    @RequestMapping(value = "/allocMenu", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult allocMenu(@RequestParam Integer userId, @RequestParam List<Integer> menuIds) {
        //弃用角色概念，roleId即为userId
        int count = roleMenuService.allocMenu(userId, menuIds);
        return CommonResult.success(count);
    }
}

