package com.sim.wifi.firmware;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement
public class FirmwareApplication {

    public static void main(String[] args) {
        SpringApplication.run(FirmwareApplication.class, args);
    }

}
