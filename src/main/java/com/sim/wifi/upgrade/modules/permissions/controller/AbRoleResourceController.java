package com.sim.wifi.upgrade.modules.permissions.controller;


import com.sim.wifi.upgrade.common.api.CommonResult;
import com.sim.wifi.upgrade.modules.permissions.service.AbRoleResourceService;
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
@Api(tags = "AbRoleResourceController", description = "资源分配管理")
@RequestMapping("/roleResource")
public class AbRoleResourceController {
    @Autowired
    private AbRoleResourceService roleResourceService;

    @ApiOperation("分配资源给用户")
    @RequestMapping(value = "/allocResource", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult allocResource(@RequestParam Integer userId, @RequestParam List<Integer> resourceIds) {
        //弃用角色概念，roleId即为userId
        int count = roleResourceService.allocResource(userId, resourceIds);
        return CommonResult.success(count);
    }
}

