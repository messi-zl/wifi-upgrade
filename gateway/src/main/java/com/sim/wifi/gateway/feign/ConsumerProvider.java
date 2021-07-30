package com.sim.wifi.gateway.feign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Arrays;
import java.util.List;

/**
 * @Description: 调用微服务提供者
 * @CreateBy: li.zheng871@sim.com
 * @DateTime: 2021/7/29
 */
@Component
@FeignClient(name = "wifi-upgrade-authority", fallback = ConsumerProvider.ConsumerProviderFallback.class)
public interface ConsumerProvider {

    // 配置需要调用的服务地址及参数
    @GetMapping("/permission/test/feginTest")
    List<String> feginTest();



    @Component
    class ConsumerProviderFallback implements ConsumerProvider {
        //降级处理
        @Override
        public List<String> feginTest() {
            return Arrays.asList("hahaha");
        }
    }
}
