package com.sim.wifi.common;

import org.junit.After;
import org.junit.Before;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

/**
 * @Description:
 * @CreateBy: li.zheng871@sim.com
 * @DateTime: 2021/7/19
 */
@RunWith(SpringRunner.class)
@SpringBootTest
@WebAppConfiguration
public class BaseTest {
    @Before
    public void setUp() throws Exception {
        System.out.println("-----------------开始测试-----------------");
    }

    @After
    public void tearDown() throws Exception {
        System.out.println("-----------------测试结束-----------------");

    }
}
