package com.sim.wifi.upgrade.modules.permissions.controller;


import com.sim.wifi.upgrade.common.api.CommonResult;
import com.sim.wifi.upgrade.modules.permissions.model.AbResource;
import com.sim.wifi.upgrade.modules.permissions.service.AbResourceService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zl
 * @since 2021-06-25
 */
@Controller
@Api(tags = "AbResourceController", description = "资源url管理")
@RequestMapping("/resource")
public class AbResourceController {
    @Autowired
    private AbResourceService resourceService;


    @ApiOperation("根据资源ID获取资源详情")
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<AbResource> getItem(@PathVariable Long id) {
        AbResource resource = resourceService.getById(id);
        return CommonResult.success(resource);
    }


}

