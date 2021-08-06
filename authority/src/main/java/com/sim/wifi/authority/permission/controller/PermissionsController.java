package com.sim.wifi.authority.permission.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sim.wifi.authority.common.api.CommonPage;
import com.sim.wifi.authority.common.api.CommonResult;
import com.sim.wifi.authority.common.log.CustomOperationLog;
import com.sim.wifi.authority.permission.model.Permissions;
import com.sim.wifi.authority.permission.service.PermissionsService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;


/**
 * description: 权限管理controller
 * create by: li.zheng871@sim.com
 * create time: 2021/7/9
 */
@Controller
@Api(tags = "PermissionsController", description = "权限管理")
@RequestMapping("/auth/permissions")
public class PermissionsController {
    private static final Logger logger = LoggerFactory.getLogger(PermissionsController.class);
    @Autowired
    private PermissionsService permissionsService;


    //权限管理-分页显示所有各用户对应的权限列表
    @CustomOperationLog
    @ApiOperation("分页显示所有各用户对应的权限列表")
    @RequestMapping(value = "/pageAllUsersLimits", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<CommonPage<Map<String, Object>>> pageAllUsersLimits(@RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                                                                            @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
        Page<Map<String, Object>> limitList = permissionsService.pageAllUsersLimits(pageSize, pageNum);
        return CommonResult.success(CommonPage.restPage(limitList));
    }


    //编辑权限后-展示所有权限(操作权限+型号权限)
    @CustomOperationLog
    @ApiOperation("查询所有后台权限结构供前端树形展示")
    @RequestMapping(value = "/getAllStructure", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<Map<String, Object>> getAllStructure() {
        logger.info("开始查询所有权限结构");
        Map<String, Object> map = permissionsService.getAllStructure();
        logger.info("查询所有权限结构成功");
        return CommonResult.success(map);
    }


    @CustomOperationLog
    @ApiOperation("添加权限")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult create(@RequestBody Permissions permission) {
        logger.info("添加权限开始，参数为{}", permission.toString());
        boolean success = permissionsService.create(permission);
        //dynamicSecurityMetadataSource.clearDataSource();
        if (success) {
            logger.info("添加权限成功");
            return CommonResult.success(null);
        } else {
            logger.error("添加权限失败");
            return CommonResult.failed();
        }
    }


    @CustomOperationLog
    @ApiOperation("根据ID删除后台权限")
    @RequestMapping(value = "/delete/{permissionId}", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult delete(@PathVariable Integer permissionId) {
        logger.info("开始删除permissionId为{}，的权限", permissionId);
        boolean success = permissionsService.delete(permissionId);
        // dynamicSecurityMetadataSource.clearDataSource();
        if (success) {
            logger.info("删除资源成功");
            return CommonResult.success(null);
        } else {
            logger.error("删除资源失败");
            return CommonResult.failed();
        }
    }


    @CustomOperationLog
    @ApiOperation("由权限id修改权限")
    @RequestMapping(value = "/update/{permissionId}", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult update(@PathVariable Integer permissionId,
                               @RequestBody Permissions permission) {
        logger.info("开始修改permissionId为{}的权限，参数Permission{}", permissionId, permission.toString());
        boolean success = permissionsService.update(permissionId, permission);
        //dynamicSecurityMetadataSource.clearDataSource();
        if (success) {
            logger.info("修改权限成功");
            return CommonResult.success(null);
        } else {
            logger.error("修改权限失败");
            return CommonResult.failed();
        }
    }


    @CustomOperationLog
    @ApiOperation("根据资源的ID获取权限详情")
    @RequestMapping(value = "/getInfo/{resourceId}", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<Permissions> getItem(@PathVariable Integer resourceId) {
        logger.info("开始获取permissionId为{}，的权限详情", resourceId);
        Permissions permission = permissionsService.getById(resourceId);
        logger.info("获取权限详情成功");
        return CommonResult.success(permission);
    }


    //由token信息及访问的url地址，看其是否具有权限
    @CustomOperationLog
    @ApiOperation("判断用户对某请求是否具有权限")
    @RequestMapping(value = "/judgePermission", method = RequestMethod.GET)
    @ResponseBody
    public boolean judgePermission(@RequestParam String username, @RequestParam String url) {
        return permissionsService.getPermission(username, url);
    }


}

