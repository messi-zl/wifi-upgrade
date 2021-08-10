package com.sim.wifi.gateway.feign;

import com.sim.wifi.authority.common.exception.ApiException;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Arrays;
import java.util.List;

/**
 * @Description: 调用微服务提供者
 * @CreateBy: li.zheng871@sim.com
 * @DateTime: 2021/7/29
 */
@Component
@FeignClient(name = "${auth-server.name}", fallback = ConsumerProvider.ConsumerProviderFallback.class)
public interface ConsumerProvider {

    // 配置需要调用的服务地址及参数
    @GetMapping("/auth/test/feginTest")
    List<String> feginTest();

    @GetMapping("/auth/permissions/judgePermission")
    Boolean judgePermission(@RequestParam("username") String username, @RequestParam("url") String url);

    @Component
    class ConsumerProviderFallback implements ConsumerProvider {
        //降级处理
        @Override
        public List<String> feginTest() {
            throw new ApiException("openfeign occurred error！");
        }

        @Override
        public Boolean judgePermission(String username, String url) {
            throw new ApiException("openfeign occurred error！");
        }
    }
}
