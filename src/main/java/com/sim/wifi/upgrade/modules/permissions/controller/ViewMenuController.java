package com.sim.wifi.upgrade.modules.permissions.controller;


import com.sim.wifi.upgrade.common.api.CommonResult;
import com.sim.wifi.upgrade.modules.permissions.model.ViewMenu;
import com.sim.wifi.upgrade.modules.permissions.service.ViewMenuService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * description: 菜单管理controller
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
@Controller
@Api(tags = "ViewMenuController", description = "菜单管理")
@RequestMapping("/viewMenu")
public class ViewMenuController {
    @Autowired
    private ViewMenuService viewMenuService;


    @ApiOperation("添加后台菜单")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult create(@RequestBody ViewMenu viewMenu) {
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
                               @RequestBody ViewMenu viewMenu) {
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
    public CommonResult<ViewMenu> getItem(@PathVariable Integer menuId) {
        ViewMenu viewMenu = viewMenuService.getById(menuId);
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
    public CommonResult<List<ViewMenu>> listAll() {
        List<ViewMenu> viewMenuList = viewMenuService.list();
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

