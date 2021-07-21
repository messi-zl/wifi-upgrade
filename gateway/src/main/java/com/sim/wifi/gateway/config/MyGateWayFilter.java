package com.sim.wifi.gateway.config;

import com.sim.wifi.authority.permission.model.Users;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

/**
 * @Description:    自定义全局gateway过滤器
 * @CreateBy: li.zheng871@sim.com
 * @DateTime: 2021/7/21
 */
@Component
public class MyGateWayFilter implements GlobalFilter, Ordered {

    //拦截请求头
    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {

/*        ServerHttpRequest request = exchange.getRequest();
        String token = request.getHeaders().getFirst(RequestKeyConstants.TOKEN);
        //检查token是否为空
        if (StringUtils.isEmpty(token)) {
            return denyAccess(exchange, ResultCode.TOKEN_NULL);
        }
        JwtTokenUtil

        Map claimMap1 = jwtUtils.parseJwt(token);
        //token有误
        if (claimMap.containsKey("exception")) {
            log.error() (claimMap1.get("exception").toString());
            return denyAccess(exchange, ResultCode.TOKEN_INVALID);
        }

        //token无误，将用户信息设置进header中,传递到下游服务
        Map<String, Claim> claimMap = claimMap1;
        String userId = claimMap.get(RequestKeyConstants.USER_ID).asString();
        Consumer<HttpHeaders> headers = httpHeaders -> {
            httpHeaders.add(RequestKeyConstants.USER_ID, userId);
        };
        request.mutate().headers(headers).build();

        // todo 权限校验

        return chain.filter(exchange);*/

    }

    @Override
    public int getOrder() {
        return 0;
    }

    /**
     * 拦截并返回自定义的json字符串
     */
    private Mono<Void> denyAccess(ServerWebExchange exchange, ResultCode resultCode) {
//        ServerHttpResponse response = exchange.getResponse();
//        response.setStatusCode(HttpStatus.OK);
//        //这里在返回头添加编码，否则中文会乱码
//        response.getHeaders().add("Content-Type", "application/json;charset=UTF-8");
//        byte[] bytes = JSON.toJSONBytes(Result.error(resultCode), SerializerFeature.WriteMapNullValue);
//        DataBuffer buffer = response.bufferFactory().wrap(bytes);
//        return response.writeWith(Mono.just(buffer));
    }

}
