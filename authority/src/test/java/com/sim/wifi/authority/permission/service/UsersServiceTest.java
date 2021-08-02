package com.sim.wifi.authority.permission.service;

import com.sim.wifi.common.BaseTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @Description:
 * @CreateBy: li.zheng871@sim.com
 * @DateTime: 2021/7/20
 */
public class UsersServiceTest extends BaseTest {
    @Autowired
    private UsersService usersService;

    @Test
    public void getUserInfo() {
        usersService.getUserInfo("zl");
    }
}