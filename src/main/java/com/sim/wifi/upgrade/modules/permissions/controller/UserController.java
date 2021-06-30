package com.sim.wifi.upgrade.modules.permissions.controller;


import com.sim.wifi.upgrade.common.api.CommonResult;
import com.sim.wifi.upgrade.modules.permissions.dto.UserLoginParam;
import com.sim.wifi.upgrade.modules.permissions.dto.UserParam;
import com.sim.wifi.upgrade.modules.permissions.mapper.ViewMenuMapper;
import com.sim.wifi.upgrade.modules.permissions.model.User;
import com.sim.wifi.upgrade.modules.permissions.service.ResourceService;
import com.sim.wifi.upgrade.modules.permissions.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

/**
 * description: wifi-upgrade后台用户管理controller
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
@Controller
@Api(tags = "UserController", description = "wifi-upgrade后台用户管理")
@RequestMapping("/user")
public class UserController {
    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Value("${jwt.tokenHead}")
    private String tokenHead;
    @Value("${jwt.tokenHeader}")
    private String tokenHeader;
    @Autowired
    private UserService userService;
    @Autowired
    private ViewMenuMapper viewMenuMapper;
    @Autowired
    private ResourceService resourceService;


    @ApiOperation(value = "用户注册")
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult<User> register(@Validated @RequestBody UserParam userParam) {
        User user = userService.register(userParam);
        if (user == null) {
            logger.error("用户注册失败");
            return CommonResult.failed();
        }
        logger.info("用户注册成功！！！");
        return CommonResult.success(user);
    }

    @ApiOperation(value = "登录并返回token")
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult login(@Validated @RequestBody UserLoginParam userLoginParam) {
        String token = userService.login(userLoginParam.getUsername(), userLoginParam.getPassword());
        if (token == null) {
            logger.error("登录时用户名或密码错误");
            return CommonResult.validateFailed("登录时用户名或密码错误");
        }
        Map<String, String> tokenMap = new HashMap<>();
        tokenMap.put("token", token);
        tokenMap.put("tokenHead", tokenHead);
        logger.info("登录成功,返回token");
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
        logger.info("开始获取当前登录用户的信息");
        if (principal == null) {
            return CommonResult.unauthorized(null);
        }
        String username = principal.getName();
        User user = userService.getUserByUsername(username);
        Map<String, Object> data = new HashMap<>();
        data.put("username", user.getUsername());
        logger.info("由用户id：{}，获取其对应的menu", user.getId());
        data.put("menus", viewMenuMapper.getMenuListByUserId(user.getId()));
        logger.info("由用户id：{}，获取其对应的resourceList", user.getId());
        data.put("resources", resourceService.getResourceList(user.getId()));
/*        data.put("icon", umsAdmin.getIcon());
        List<UmsRole> roleList = adminService.getRoleList(umsAdmin.getId());
        if(CollUtil.isNotEmpty(roleList)){
            List<String> roles = roleList.stream().map(UmsRole::getName).collect(Collectors.toList());
            data.put("roles",roles);
        }*/
        logger.info("获取当前登录用户的信息成功");
        return CommonResult.success(data);
    }


    @ApiOperation(value = "刷新token")
    @RequestMapping(value = "/refreshToken", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult refreshToken(HttpServletRequest request) {
        logger.info("开始刷新token");
        String token = request.getHeader(tokenHeader);
        String refreshToken = userService.refreshToken(token);
        if (refreshToken == null) {
            return CommonResult.failed("sorry,token已经过期！");
        }
        Map<String, String> tokenMap = new HashMap<>();
        tokenMap.put("token", refreshToken);
        tokenMap.put("tokenHead", tokenHead);
        logger.info("刷新token成功");
        return CommonResult.success(tokenMap);
    }

}

