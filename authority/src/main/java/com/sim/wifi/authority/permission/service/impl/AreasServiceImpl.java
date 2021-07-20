package com.sim.wifi.authority.permission.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sim.wifi.authority.permission.mapper.AreasMapper;
import com.sim.wifi.authority.permission.model.Areas;
import com.sim.wifi.authority.permission.service.AreasService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * description: 地区表 服务实现类
 * create by: li.zheng871@sim.com
 * create time: 2021/7/9
 */
@Transactional
@Service
public class AreasServiceImpl extends ServiceImpl<AreasMapper, Areas> implements AreasService {
    private static final Logger logger = LoggerFactory.getLogger(AreasServiceImpl.class);

}
