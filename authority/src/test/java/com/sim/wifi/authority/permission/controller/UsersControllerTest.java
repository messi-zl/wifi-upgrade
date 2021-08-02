package com.sim.wifi.authority.permission.controller;

import com.sim.wifi.authority.dto.UsersLoginParam;
import com.sim.wifi.common.BaseTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

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