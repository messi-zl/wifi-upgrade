package com.sim.wifi.upgrade.modules.permissions.controller;


import com.sim.wifi.upgrade.common.api.CommonResult;
import com.sim.wifi.upgrade.modules.permissions.model.ViewMenu;
import com.sim.wifi.upgrade.modules.permissions.service.ViewMenuService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
    private static final Logger logger = LoggerFactory.getLogger(ViewMenuController.class);

    @Autowired
    private ViewMenuService viewMenuService;


    @ApiOperation("添加后台菜单")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult create(@RequestBody ViewMenu viewMenu) {
        logger.info("开始添加菜单，参数为{}", viewMenu.toString());
        boolean success = viewMenuService.create(viewMenu);
        if (success) {
            logger.info("添加菜单成功");
            return CommonResult.success(null);
        } else {
            logger.error("添加菜单失败");
            return CommonResult.failed();
        }
    }

    @ApiOperation("修改后台菜单")
    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult update(@PathVariable Integer menuId,
                               @RequestBody ViewMenu viewMenu) {
        logger.info("开始修改menuId为{}的菜单，参数ViewMenu{}", menuId, viewMenu.toString());
        boolean success = viewMenuService.update(menuId, viewMenu);
        if (success) {
            logger.info("修改菜单成功");
            return CommonResult.success(null);
        } else {
            logger.error("修改菜单失败");
            return CommonResult.failed();
        }
    }

    @ApiOperation("根据菜单ID获取菜单详情")
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<ViewMenu> getItem(@PathVariable Integer menuId) {
        logger.info("开始获取menuId为{}，的菜单详情", menuId);
        ViewMenu viewMenu = viewMenuService.getById(menuId);
        logger.info("获取菜单详情成功");
        return CommonResult.success(viewMenu);
    }

    @ApiOperation("根据菜单ID删除后台菜单")
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult delete(@PathVariable Integer menuId) {
        logger.info("开始删除menuId为{}，的菜单", menuId);
        boolean success = viewMenuService.removeById(menuId);
        if (success) {
            logger.info("删除菜单成功");
            return CommonResult.success(null);
        } else {
            logger.error("删除菜单失败");
            return CommonResult.failed();
        }
    }

    @ApiOperation("查询后台所有的菜单")
    @RequestMapping(value = "/listAll", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<List<ViewMenu>> listAll() {
        logger.info("开始查询所有菜单");
        List<ViewMenu> viewMenuList = viewMenuService.list();
        logger.info("查询所有菜单成功");
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

