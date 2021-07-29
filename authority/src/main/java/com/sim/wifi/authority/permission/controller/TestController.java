package com.sim.wifi.authority.permission.controller;

import com.sim.wifi.authority.common.api.CommonResult;
import com.sim.wifi.authority.common.log.CustomOperationLog;
import com.sim.wifi.authority.permission.service.PermissionsService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

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
    @Autowired
    private PermissionsService permissionsService;

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
    //网关转发登录 能否获取到返回值



    @CustomOperationLog
    @ApiOperation("测试fegin调起")
    @RequestMapping(value = "/feginTest", method = RequestMethod.GET)
    @ResponseBody
    public List<String> feginTest(){
        System.out.printf("yeah我到了");
        List<String> list = Arrays.asList("111","222","333");
        return list;
    }
}
