package com.sim.wifi.authority.permission.controller;


import com.sim.wifi.authority.common.api.CommonResult;
import com.sim.wifi.authority.common.exception.Asserts;
import com.sim.wifi.authority.common.log.CustomOperationLog;
import com.sim.wifi.authority.dto.UpdateUsersPasswordParam;
import com.sim.wifi.authority.dto.UsersLoginParam;
import com.sim.wifi.authority.dto.UsersParam;
import com.sim.wifi.authority.permission.model.Users;
import com.sim.wifi.authority.permission.service.PermissionsService;
import com.sim.wifi.authority.permission.service.UsersService;
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
 * description: 用户管理controller
 * create by: li.zheng871@sim.com
 * create time: 2021/7/9
 */
@Controller
@Api(tags = "UsersController", description = "后台用户管理")
@RequestMapping("/permission/users")
public class UsersController {
    private static final Logger logger = LoggerFactory.getLogger(UsersController.class);

    @Value("${jwt.tokenHead}")
    private String tokenHead;
    @Value("${jwt.tokenHeader}")
    private String tokenHeader;
    @Autowired
    private UsersService usersService;
    @Autowired
    private PermissionsService permissionsService;

    @CustomOperationLog
    @ApiOperation(value = "用户注册")
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult<Users> register(@Validated @RequestBody UsersParam usersParam) {
        Users user = usersService.register(usersParam);
        if (user == null) {
            return CommonResult.failed();
        }
        logger.info("用户注册成功！！！");
        return CommonResult.success(user);
    }

    @CustomOperationLog
    @ApiOperation(value = "登录以后返回token")
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult login(@Validated @RequestBody UsersLoginParam usersLoginParam) {
        Map<String, String> map = usersService.login(usersLoginParam.getUsername(), usersLoginParam.getPassword());
        if (map.get("errorMessage") != null) {
            Asserts.fail(map.get("errorMessage"));
        }
        Map<String, String> tokenMap = new HashMap<>();
        tokenMap.put("token", map.get("token"));
        tokenMap.put("tokenHead", tokenHead);
        return CommonResult.success(tokenMap);
    }

    @CustomOperationLog
    @ApiOperation(value = "登出")
    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult logout() {
        return CommonResult.success(null);
    }


    @CustomOperationLog
    @ApiOperation(value = "获取当前登录用户的信息")//用户渲染
    @RequestMapping(value = "/info", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult getUserInfo(Principal principal) {
        logger.info("开始获取当前登录用户的信息");
        if (principal == null) {
            return CommonResult.unauthorized(null);
        }
        String username = principal.getName();
        return usersService.getUserInfo(username);
    }

    @CustomOperationLog
    @ApiOperation(value = "刷新token")
    @RequestMapping(value = "/refreshToken", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult refreshToken(HttpServletRequest request) {
        logger.info("开始刷新token");
        String token = request.getHeader(tokenHeader);
        String refreshToken = usersService.refreshToken(token);
        if (refreshToken == null) {
            return CommonResult.failed("sorry,token已经过期！");
        }
        Map<String, String> tokenMap = new HashMap<>();
        tokenMap.put("token", refreshToken);
        tokenMap.put("tokenHead", tokenHead);
        logger.info("刷新token成功");
        return CommonResult.success(tokenMap);
    }

    @CustomOperationLog
    @ApiOperation("根据UserId修改用户信息")
    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult update(@PathVariable Integer userId, @RequestBody Users user) {
        boolean success = usersService.update(userId, user);
        if (success) {
            return CommonResult.success(null);
        }
        return CommonResult.failed();
    }

    @CustomOperationLog
    @ApiOperation("修改登录密码")
    @RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult updatePassword(@Validated @RequestBody UpdateUsersPasswordParam updatePasswordParam) {
        int status = usersService.updatePassword(updatePasswordParam);
        if (status > 0) {
            return CommonResult.success(status);
        } else if (status == -1) {
            return CommonResult.failed("提交参数不合法");
        } else if (status == -2) {
            return CommonResult.failed("找不到该用户");
        } else if (status == -3) {
            return CommonResult.failed("旧密码错误");
        } else {
            return CommonResult.failed();
        }
    }


}

