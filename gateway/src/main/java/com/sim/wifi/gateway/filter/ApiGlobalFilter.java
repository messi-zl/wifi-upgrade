package com.sim.wifi.gateway.filter;

import cn.hutool.core.date.DatePattern;
import cn.hutool.core.util.StrUtil;
import com.sim.wifi.gateway.config.IgnoreUrlsConfig;
import com.sim.wifi.gateway.feign.ConsumerProvider;
import com.sim.wifi.gateway.util.JwtTokenUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.core.io.buffer.DataBuffer;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Flux;
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

    @Autowired
    private IgnoreUrlsConfig ignoreUrlsConfig;
    @Autowired
    private JwtTokenUtil jwtTokenUtil;
    @Autowired
    private ConsumerProvider consumerProvider;


    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        ServerHttpRequest requestOriginal = exchange.getRequest();
        ServerHttpResponse response = exchange.getResponse();
        String token = requestOriginal.getHeaders().getFirst(tokenHeader);
        String urlOriginal = requestOriginal.getPath().value(); //发给网关的url（与真实到服务的url有差别，不然网关无法识别转发到哪个服务）
        try {
            //白名单请求直接放行，无需token
            PathMatcher pathMatcher = new AntPathMatcher();
            for (String path : ignoreUrlsConfig.getUrls()) {
                if (pathMatcher.match(path, urlOriginal)) {
                    return chain.filter(exchange);
                }
            }
            //不属于白名单，又无token，拒绝
            if (StrUtil.isEmpty(token)) {
                return unauthorized(exchange);
            }
            String realToken = token.replace(tokenHead, "");//认证信息请求头
            //判断token是否有效
            if (jwtTokenUtil.isTokenExpired(realToken)) {
                return tokenOverdue(exchange);
            }
            //解析token得到用户名
            String username = jwtTokenUtil.getUserNameFromToken(realToken);
            String dataString = DatePattern.NORM_DATETIME_FORMAT.format(jwtTokenUtil.getExpiredDateFromToken(realToken));
            //判断该token对应的用户是否对该url有权限
            //String urlReal = urlOriginal.substring(urlOriginal.indexOf("/", 1));
            Boolean flag = consumerProvider.judgePermission(username, urlOriginal);
            if (!flag) return urlNoPermission(exchange, urlOriginal);

            //String userStr = jwtTokenUtil.getUserNameFromToken(realToken);
/*            JWSObject jwsObject = JWSObject.parse(realToken);
            String userStr = jwsObject.getPayload().toString();
            logger.info("AuthGlobalFilter.filter() user:{}", userStr);*/
            ServerHttpRequest requestNow = requestOriginal.mutate().headers(httpHeaders -> {
                try {
                    httpHeaders.set(userInfo, URLEncoder.encode(username, "UTF-8"));
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
            }).build();
            exchange = exchange.mutate().request(requestNow).build();
        } catch (Exception e) {
            e.printStackTrace();
//            response.setStatusCode(HttpStatus.UNAUTHORIZED);
//            return response.setComplete();
            return error(exchange);
        }
        return chain.filter(exchange);
    }

    @Override
    public int getOrder() {
        return 0;
    }


    /**
     * 网关拒绝，返回401（不属于白名单且无token）
     *
     * @param
     */
    private Mono<Void> unauthorized(ServerWebExchange serverWebExchange) {
        ServerHttpResponse response = serverWebExchange.getResponse();
        return writeResonse(response, HttpStatus.UNAUTHORIZED, "老哥，你不属于白名单且无token，网关拒绝你");
    }

    /**
     * 网关拒绝，返回401（token过期，已经失效）
     *
     * @param
     */
    private Mono<Void> tokenOverdue(ServerWebExchange serverWebExchange) {
        ServerHttpResponse response = serverWebExchange.getResponse();
        return writeResonse(response, HttpStatus.UNAUTHORIZED, "老哥，你token过期失效了");
    }

    /**
     * 网关拒绝，返回401（用户对当前url无权限访问）
     *
     * @param
     */
    private Mono<Void> urlNoPermission(ServerWebExchange serverWebExchange, String url) {
        ServerHttpResponse response = serverWebExchange.getResponse();
        return writeResonse(response, HttpStatus.UNAUTHORIZED, "老哥，你对当前请求:" + url + "没有权限");
    }

    /**
     * 网关拒绝，返回401（用户对当前url无权限访问）
     *
     * @param
     */
    private Mono<Void> error(ServerWebExchange serverWebExchange) {
        ServerHttpResponse response = serverWebExchange.getResponse();
        return writeResonse(response, HttpStatus.UNAUTHORIZED, "老哥，网关出错了");
    }

    /**
     * 往ServerHttpResponse写信息+代码
     **/
    private Mono<Void> writeResonse(ServerHttpResponse response, HttpStatus httpStatus, String message) {
        response.setStatusCode(httpStatus);
        DataBuffer buffer = response.bufferFactory().wrap(message.getBytes());
        return response.writeWith(Flux.just(buffer));
    }
}
