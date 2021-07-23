package com.sim.wifi.authority.permission.controller;


import com.sim.wifi.authority.common.api.CommonResult;
import com.sim.wifi.authority.common.log.CustomOperationLog;
import com.sim.wifi.authority.permission.model.Permissions;
import com.sim.wifi.authority.permission.service.PermissionsService;
import com.sim.wifi.authority.security.component.DynamicSecurityMetadataSource;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Enumeration;
import java.util.Map;


/**
 * description: 权限管理controller
 * create by: li.zheng871@sim.com
 * create time: 2021/7/9
 */
@Controller
@Api(tags = "PermissionsController", description = "权限管理")
@RequestMapping("/permission/permissions")
public class PermissionsController {
    private static final Logger logger = LoggerFactory.getLogger(PermissionsController.class);
    @Autowired
    private PermissionsService permissionsService;
    @Autowired
    private DynamicSecurityMetadataSource dynamicSecurityMetadataSource;


    @CustomOperationLog
    @ApiOperation("添加权限")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult create(@RequestBody Permissions permission) {
        logger.info("添加权限开始，参数为{}", permission.toString());
        boolean success = permissionsService.create(permission);
        dynamicSecurityMetadataSource.clearDataSource();
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
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult delete(@PathVariable Integer permissionId) {
        logger.info("开始删除permissionId为{}，的权限", permissionId);
        boolean success = permissionsService.delete(permissionId);
        dynamicSecurityMetadataSource.clearDataSource();
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
    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult update(@PathVariable Integer permissionId,
                               @RequestBody Permissions permission) {
        logger.info("开始修改permissionId为{}的权限，参数Permission{}", permissionId, permission.toString());
        boolean success = permissionsService.update(permissionId, permission);
        dynamicSecurityMetadataSource.clearDataSource();
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
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<Permissions> getItem(@PathVariable Integer resourceId) {
        logger.info("开始获取permissionId为{}，的权限详情", resourceId);
        Permissions permission = permissionsService.getById(resourceId);
        logger.info("获取权限详情成功");
        return CommonResult.success(permission);
    }

    @CustomOperationLog
    @ApiOperation("查询所有后台树形权限")//权限页面展示所有权限
    @RequestMapping(value = "/listAll", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<Map<String, Object>> listAll() {
        logger.info("开始查询所有权限");
        Map<String, Object> map = permissionsService.listAll();
        logger.info("查询所有权限成功");
        return CommonResult.success(map);
    }


    @CustomOperationLog
    @ApiOperation("测试gateway啊")
    @RequestMapping(value = "/gatewayTest", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<Map<String, Object>> gatewayTest() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        Enumeration u = request.getHeaderNames();
        while (u.hasMoreElements()) {
            String header = (String) u.nextElement();
            try {
                System.out.println(header + ":" + URLDecoder.decode(request.getHeader(header), "UTF-8"));
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        String hh = request.getHeader("userInfoHead");

        logger.info("开始查询所有权限");
        Map<String, Object> map = permissionsService.listAll();
        logger.info("测试gateway成功");
        return CommonResult.success(map);
    }
}

