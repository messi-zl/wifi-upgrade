package com.sim.wifi.gateway.gatewayCofigTest;


import com.sim.wifi.authority.common.service.RedisService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;


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
    @Value("${redis.key.allPermission}")
    private String REDIS_KEY_ALL_PERMISSION;
    @Value("${redis.key.userPermissionRelation}")
    private String REDIS_KEY_ALL_USER_PERMISSION_RELATION;

    /*    @Autowired
        private RedisTemplate<String, Object> redisTemplate;*/
    @Autowired
    private RedisService redisService;


    //测试nacos配置文件的获取
    @RequestMapping(value = "/testNacos", method = RequestMethod.POST)
    @ResponseBody
    public String testNacos() {
        return test;
    }


    //测试从redis中取数据
    @RequestMapping(value = "/testRedis", method = RequestMethod.GET)
    @ResponseBody
    public Map testRedis() {
/*        Map<Object, Object> resourceRolesMap = redisTemplate.opsForHash().entries(REDIS_KEY_ALL_PERMISSION);
        Map<Object, Object> resourceRolesMap2 = redisTemplate.opsForHash().entries(REDIS_KEY_ALL_USER_PERMISSION_RELATION);*/
        Map<Object, Object> resourceRolesMap3 = redisService.hGetAll(REDIS_KEY_ALL_PERMISSION);
        Map<Object, Object> resourceRolesMap4 = redisService.hGetAll(REDIS_KEY_ALL_USER_PERMISSION_RELATION);
        return resourceRolesMap4;
    }

}

