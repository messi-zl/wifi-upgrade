package com.sim.wifi.firmware.config;

import com.sim.wifi.firmware.common.config.BaseSwaggerConfig;
import com.sim.wifi.firmware.common.domain.SwaggerProperties;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * Swagger API文档相关配置
 */
@Configuration
@EnableSwagger2
public class SwaggerConfig extends BaseSwaggerConfig {

    @Override
    public SwaggerProperties swaggerProperties() {
        return SwaggerProperties.builder()
                .apiBasePackage("com.sim.wifi.firmware")
                .title("wifi-upgrade项目")
                .description("wifi-upgrade项目相关接口文档")
                .contactName("sim")
                .version("1.0")
                .enableSecurity(true)
                .build();
    }

}
