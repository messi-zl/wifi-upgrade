package com.sim.wifi.upgrade.modules.permissions.controller;


import com.sim.wifi.upgrade.common.api.CommonResult;
import com.sim.wifi.upgrade.modules.permissions.model.Resource;
import com.sim.wifi.upgrade.modules.permissions.service.ResourceService;
import com.sim.wifi.upgrade.security.component.DynamicSecurityMetadataSource;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * description: 资源url管理controller
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
@Controller
@Api(tags = "ResourceController", description = "资源url管理")
@RequestMapping("/resource")
public class ResourceController {
    private static final Logger logger = LoggerFactory.getLogger(ResourceController.class);

    @Autowired
    private ResourceService resourceService;
    @Autowired
    private DynamicSecurityMetadataSource dynamicSecurityMetadataSource;


    @ApiOperation("添加后台资源")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult create(@RequestBody Resource resource) {
        logger.info("添加资源开始，参数为{}", resource.toString());
        boolean success = resourceService.create(resource);
        dynamicSecurityMetadataSource.clearDataSource();
        if (success) {
            logger.info("添加资源成功");
            return CommonResult.success(null);
        } else {
            logger.error("添加资源失败");
            return CommonResult.failed();
        }
    }

    @ApiOperation("由资源id修改后台资源")
    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult update(@PathVariable Integer resourceId,
                               @RequestBody Resource resource) {
        logger.info("开始修改resourceId为{}的资源，参数Resource{}", resourceId, resource.toString());
        boolean success = resourceService.update(resourceId, resource);
        dynamicSecurityMetadataSource.clearDataSource();
        if (success) {
            logger.info("修改资源成功");
            return CommonResult.success(null);
        } else {
            logger.error("修改资源失败");
            return CommonResult.failed();
        }
    }

    @ApiOperation("根据资源的ID获取资源详情")
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<Resource> getItem(@PathVariable Integer resourceId) {
        logger.info("开始获取resourceId为{}，的资源详情", resourceId);
        Resource resource = resourceService.getById(resourceId);
        logger.info("获取资源详情成功");
        return CommonResult.success(resource);
    }


    @ApiOperation("根据ID删除后台资源")
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult delete(@PathVariable Integer resourceId) {
        logger.info("开始删除resourceId为{}，的资源", resourceId);
        boolean success = resourceService.delete(resourceId);
        dynamicSecurityMetadataSource.clearDataSource();
        if (success) {
            logger.info("删除资源成功");
            return CommonResult.success(null);
        } else {
            logger.error("删除资源失败");
            return CommonResult.failed();
        }
    }

/*    @ApiOperation("分页模糊查询后台资源")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<CommonPage<UmsResource>> list(@RequestParam(required = false) Long categoryId,
                                                      @RequestParam(required = false) String nameKeyword,
                                                      @RequestParam(required = false) String urlKeyword,
                                                      @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                                                      @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
        Page<UmsResource> resourceList = resourceService.list(categoryId,nameKeyword, urlKeyword, pageSize, pageNum);
        return CommonResult.success(CommonPage.restPage(resourceList));
    }*/

    @ApiOperation("查询所有后台资源")
    @RequestMapping(value = "/listAll", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<List<Resource>> listAll() {
        logger.info("开始查询所有资源");
        List<Resource> resourceList = resourceService.list();
        logger.info("查询所有资源成功");
        return CommonResult.success(resourceList);
    }
}

