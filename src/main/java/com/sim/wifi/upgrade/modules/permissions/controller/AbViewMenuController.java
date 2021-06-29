package com.sim.wifi.upgrade.modules.permissions.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sim.wifi.upgrade.common.api.CommonPage;
import com.sim.wifi.upgrade.common.api.CommonResult;
import com.sim.wifi.upgrade.modules.permissions.model.AbViewMenu;
import com.sim.wifi.upgrade.modules.permissions.service.AbRoleService;
import com.sim.wifi.upgrade.modules.permissions.service.AbViewMenuService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 *
 */
@Controller
@Api(tags = "AbViewMenuController", description = "菜单管理")
@RequestMapping("/viewMenu")
public class AbViewMenuController {
    @Autowired
    private AbViewMenuService viewMenuService;


    @ApiOperation("添加后台菜单")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult create(@RequestBody AbViewMenu viewMenu) {
        boolean success = viewMenuService.create(viewMenu);
        if (success) {
            return CommonResult.success(null);
        } else {
            return CommonResult.failed();
        }
    }

    @ApiOperation("修改后台菜单")
    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult update(@PathVariable Integer menuId,
                               @RequestBody AbViewMenu viewMenu) {
        boolean success = viewMenuService.update(menuId, viewMenu);
        if (success) {
            return CommonResult.success(null);
        } else {
            return CommonResult.failed();
        }
    }

    @ApiOperation("根据菜单ID获取菜单详情")
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<AbViewMenu> getItem(@PathVariable Integer menuId) {
        AbViewMenu viewMenu = viewMenuService.getById(menuId);
        return CommonResult.success(viewMenu);
    }

    @ApiOperation("根据菜单ID删除后台菜单")
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult delete(@PathVariable Integer menuId) {
        boolean success = viewMenuService.removeById(menuId);
        if (success) {
            return CommonResult.success(null);
        } else {
            return CommonResult.failed();
        }
    }

    @ApiOperation("查询后台所有的菜单")
    @RequestMapping(value = "/listAll", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<List<AbViewMenu>> listAll() {
        List<AbViewMenu> viewMenuList = viewMenuService.list();
        return CommonResult.success(viewMenuList);
    }

   /* @ApiOperation("分页查询后台菜单")
    @RequestMapping(value = "/list/{parentId}", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<CommonPage<AbViewMenu>> list(@PathVariable Long parentId,
                                                  @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                                                  @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
        Page<UmsMenu> menuList = viewMenuService.list(parentId, pageSize, pageNum);
        return CommonResult.success(CommonPage.restPage(menuList));
    }

    @ApiOperation("树形结构返回所有菜单列表")
    @RequestMapping(value = "/treeList", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<List<UmsMenuNode>> treeList() {
        List<UmsMenuNode> list = viewMenuService.treeList();
        return CommonResult.success(list);
    }*/

/*    @ApiOperation("根据菜单id修改菜单显示状态")
    @RequestMapping(value = "/updateHidden/{id}", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult updateHidden(@PathVariable Integer menuId, @RequestParam("hidden") Integer hidden) {
        boolean success = viewMenuService.updateHidden(menuId, hidden);
        if (success) {
            return CommonResult.success(null);
        } else {
            return CommonResult.failed();
        }
    }*/
}

