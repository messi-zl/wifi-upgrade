package com.sim.wifi.gateway.gatewayCofigTest;

import com.sim.wifi.gateway.fegin.ConsumerProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description:
 * @CreateBy: li.zheng871@sim.com
 * @DateTime: 2021/7/29
 */
@Service
public class TestService {
    @Autowired
    private ConsumerProvider consumerProvider;

    public List<String> testFegin(){
        List<String> list = consumerProvider.feginTest();
        return list;
    }

}
