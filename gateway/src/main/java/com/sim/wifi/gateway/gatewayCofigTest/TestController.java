package com.sim.wifi.gateway.gatewayCofigTest;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * description: 用户管理controller
 * create by: li.zheng871@sim.com
 * create time: 2021/7/9
 */
@Controller
@RequestMapping("/testGateway")
@RefreshScope
public class TestController {
    private static final Logger logger = LoggerFactory.getLogger(TestController.class);

    @Value("${test-nacos.test}")
    private String test;


    //测试nacos配置文件获取
    @RequestMapping(value = "/testNacos", method = RequestMethod.POST)
    @ResponseBody
    public String testNacos() {
        return test;
    }

}

