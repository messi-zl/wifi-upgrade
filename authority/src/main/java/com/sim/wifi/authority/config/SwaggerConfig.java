package com.sim.wifi.authority.config;

import com.sim.wifi.authority.common.config.BaseSwaggerConfig;
import com.sim.wifi.authority.common.domain.SwaggerProperties;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * description: Swagger API文档相关配置
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
@Configuration
@EnableSwagger2
public class SwaggerConfig extends BaseSwaggerConfig {

    @Override
    public SwaggerProperties swaggerProperties() {
        return SwaggerProperties.builder()
                .apiBasePackage("com.sim.wifi.authority")//pakagemodify
                .title("wifi-upgrade项目Authority模块")
                .description("wifi-upgrade项目Authority模块相关接口文档")
                .contactName("zl")
                .version("1.0")
                .enableSecurity(true)
                .build();
    }
}
