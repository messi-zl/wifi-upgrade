package com.sim.wifi.gateway.filter;

import cn.hutool.core.util.StrUtil;
import com.nimbusds.jose.JWSObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

/**
 * @Description: 将登录用户的JWT转化成用户信息的全局过滤器
 * @CreateBy: li.zheng871@sim.com
 * @DateTime: 2021/7/22
 */
@Component
public class ApiGlobalFilter implements GlobalFilter, Ordered {
    private Logger logger = LoggerFactory.getLogger(ApiGlobalFilter.class);
    @Value("${jwt.tokenHeader}")
    private String tokenHeader;
    @Value("${jwt.tokenHead}")
    private String tokenHead;
    @Value("${jwt.userInfoHead}")
    private String userInfo;


    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        ServerHttpRequest requestInitially = exchange.getRequest();
        ServerHttpResponse response = exchange.getResponse();
        String token = requestInitially.getHeaders().getFirst(tokenHeader);
        //todo 属于白名单，直接放行（无需token，无需权限筛查）

        if (StrUtil.isEmpty(token)) {
            //todo 不属于白名单，又无token，拒绝
            return chain.filter(exchange);
        }

        try {
            String realToken = token.replace(tokenHead, "");//认证信息请求头
            //todo 判断token是否有效

            //String userStr = jwtTokenUtil.getUserNameFromToken(realToken);
            JWSObject jwsObject = JWSObject.parse(realToken);
            String userStr = jwsObject.getPayload().toString();
            logger.info("AuthGlobalFilter.filter() user:{}", userStr);
            ServerHttpRequest requestModified = requestInitially.mutate().headers(httpHeaders -> {
                try {
                    httpHeaders.set(userInfo, URLEncoder.encode(userStr, "UTF-8"));
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
            }).build();
            exchange = exchange.mutate().request(requestModified).build();
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatusCode(HttpStatus.UNAUTHORIZED);
            return response.setComplete();
        }
        return chain.filter(exchange);
    }

    @Override
    public int getOrder() {
        return 0;
    }


}
