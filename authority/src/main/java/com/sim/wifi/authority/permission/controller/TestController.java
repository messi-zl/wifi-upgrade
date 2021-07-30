package com.sim.wifi.authority.permission.controller;

import com.sim.wifi.authority.common.api.CommonResult;
import com.sim.wifi.authority.common.exception.Asserts;
import com.sim.wifi.authority.common.log.CustomOperationLog;
import com.sim.wifi.authority.dto.UsersLoginParam;
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
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.*;

/**
 * @Description:
 * @CreateBy: li.zheng871@sim.com
 * @DateTime: 2021/7/29
 */
@Controller
@Api(tags = "TestController", description = "相关测试")
@RequestMapping("/permission/test")
public class TestController {
    private static final Logger logger = LoggerFactory.getLogger(TestController.class);

    @Value("${jwt.tokenHead}")
    private String tokenHead;
    @Autowired
    private PermissionsService permissionsService;
    @Autowired
    private UsersService usersService;

    @CustomOperationLog
    @ApiOperation("测试gateway网关转发")
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
        logger.info("开始查询所有权限");
        Map<String, Object> map = permissionsService.listAll();
        logger.info("测试gateway成功");
        return CommonResult.success(map);
    }




    @CustomOperationLog
    @ApiOperation("测试fegin调起")
    @RequestMapping(value = "/feginTest", method = RequestMethod.GET)
    @ResponseBody
    public List<String> feginTest(){
        System.out.printf("yeah我到了");
        List<String> list = Arrays.asList("111","222","333");
        return list;
    }

    @CustomOperationLog
    @ApiOperation(value = "登录以后返回token")
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult login(@RequestParam String username, @RequestParam String password) {
        Map<String, String> map = usersService.login(username,password);
        if (map.get("errorMessage") != null) {
            Asserts.fail(map.get("errorMessage"));
        }
        Map<String, String> tokenMap = new HashMap<>();
        tokenMap.put("token", map.get("token"));
        tokenMap.put("tokenHead", tokenHead);
        return CommonResult.success(tokenMap);
    }
}
