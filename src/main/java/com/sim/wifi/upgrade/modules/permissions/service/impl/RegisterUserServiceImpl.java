package com.sim.wifi.upgrade.modules.permissions.service.impl;

import com.sim.wifi.upgrade.modules.permissions.model.RegisterUser;
import com.sim.wifi.upgrade.modules.permissions.mapper.RegisterUserMapper;
import com.sim.wifi.upgrade.modules.permissions.service.RegisterUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * description:
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
@Service
public class RegisterUserServiceImpl extends ServiceImpl<RegisterUserMapper, RegisterUser> implements RegisterUserService {
    private static final Logger logger = LoggerFactory.getLogger(RegisterUserServiceImpl.class);
}
