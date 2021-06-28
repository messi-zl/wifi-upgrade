package com.sim.wifi.upgrade.config;

import com.sim.wifi.upgrade.common.config.BaseSwaggerConfig;
import com.sim.wifi.upgrade.common.domain.SwaggerProperties;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * Swagger API文档相关配置
 * Created by macro on 2018/4/26.
 */
@Configuration
@EnableSwagger2
public class SwaggerConfig extends BaseSwaggerConfig {

    @Override
    public SwaggerProperties swaggerProperties() {
        return SwaggerProperties.builder()
                .apiBasePackage("com.sim.wifi.upgrade.modules")
                .title("wifi-upgrade项目")
                .description("wifi-upgrade项目相关接口文档")
                .contactName("zl")
                .version("1.0")
                .enableSecurity(true)
                .build();
    }
}
