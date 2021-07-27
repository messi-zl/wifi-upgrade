package com.sim.wifi.authority.config;

import com.sim.wifi.authority.common.config.BaseRedisConfig;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Configuration;

/**
 * description: Redis配置类
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
@EnableCaching
@Configuration
public class RedisConfig extends BaseRedisConfig {

}
