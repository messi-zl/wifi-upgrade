package com.sim.wifi.upgrade.modules.permissions.controller;


import cn.hutool.core.collection.CollUtil;
import com.sim.wifi.upgrade.common.api.CommonResult;
import com.sim.wifi.upgrade.modules.permissions.dto.AbUserLoginParam;
import com.sim.wifi.upgrade.modules.permissions.dto.AbUserParam;
import com.sim.wifi.upgrade.modules.permissions.mapper.AbViewMenuMapper;
import com.sim.wifi.upgrade.modules.permissions.model.AbUser;
import com.sim.wifi.upgrade.modules.permissions.service.AbResourceService;
import com.sim.wifi.upgrade.modules.permissions.service.AbRoleService;
import com.sim.wifi.upgrade.modules.permissions.service.AbUserService;
import com.sim.wifi.upgrade.modules.permissions.service.AbViewMenuService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * wifi-upgrade后台用户管理controller
 */
@Controller
@Api(tags = "AbUserController", description = "wifi-upgrade后台用户管理")
@RequestMapping("/user")
public class AbUserController {
    @Value("${jwt.tokenHead}")
    private String tokenHead;
    @Autowired
    private AbUserService userService;
    @Autowired
    private AbViewMenuMapper viewMenuMapper;
    @Autowired
    private AbResourceService resourceService;


    @ApiOperation(value = "用户注册")
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult<AbUser> register(@Validated @RequestBody AbUserParam abUserParam) {
        AbUser user = userService.register(abUserParam);
        if (user == null) {
            return CommonResult.failed();
        }
        return CommonResult.success(user);
    }

    @ApiOperation(value = "登录并返回token")
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult login(@Validated @RequestBody AbUserLoginParam userLoginParam) {
        String token = userService.login(userLoginParam.getUsername(), userLoginParam.getPassword());
        if (token == null) {
            return CommonResult.validateFailed("用户名或密码错误");
        }
        Map<String, String> tokenMap = new HashMap<>();
        tokenMap.put("token", token);
        tokenMap.put("tokenHead", tokenHead);
        return CommonResult.success(tokenMap);
    }

    @ApiOperation(value = "登出")
    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult logout() {
        return CommonResult.success(null);
    }


    @ApiOperation(value = "获取当前登录用户的信息")
    @RequestMapping(value = "/info", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult getUserInfo(Principal principal) {
        if(principal==null){
            return CommonResult.unauthorized(null);
        }
        String username = principal.getName();
        AbUser user = userService.getUserByUsername(username);
        Map<String, Object> data = new HashMap<>();
        data.put("username", user.getUsername());
        data.put("menus", viewMenuMapper.getMenuListByUserId(user.getId()));
        //返回该用户对应的resourceUrl
        data.put("resources",resourceService.getResourceList(user.getId()));
/*        data.put("icon", umsAdmin.getIcon());
        List<UmsRole> roleList = adminService.getRoleList(umsAdmin.getId());
        if(CollUtil.isNotEmpty(roleList)){
            List<String> roles = roleList.stream().map(UmsRole::getName).collect(Collectors.toList());
            data.put("roles",roles);
        }*/
        return CommonResult.success(data);
    }


}

