package com.sim.wifi.authority.security.annotation;

import java.lang.annotation.*;

/**
 * description: 自定义注解，有该注解的缓存方法会抛出异常
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
@Documented
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface CacheException {
}
