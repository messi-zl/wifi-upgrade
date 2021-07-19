package com.sim.wifi.authority.permission.controller;

import com.sim.wifi.authority.dto.UsersLoginParam;
import com.sim.wifi.common.BaseTest;
import lombok.extern.slf4j.Slf4j;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import static org.junit.Assert.*;

/**
 * @Description:
 * @CreateBy: li.zheng871@sim.com
 * @DateTime: 2021/7/19
 */
public class UsersControllerTest extends BaseTest {

    @Value("${login-lock-info.max-fail-count}")
    private Integer maxFailCount;
    @Autowired
    private UsersController usersController;


    @Test
    public void login() {
        UsersLoginParam usersLoginParam = new UsersLoginParam();

        for (int i = 0; i < maxFailCount; i++) {
            usersLoginParam.setUsername("zl");
            usersLoginParam.setPassword("1234");
            try {
                usersController.login(usersLoginParam);
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
        //Assert.assertSame(,,usersController.login(usersLoginParam));
    }
}