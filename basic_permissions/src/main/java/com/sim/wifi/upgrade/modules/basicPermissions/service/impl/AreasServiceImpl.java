package com.sim.wifi.upgrade.modules.basicPermissions.service.impl;

import com.sim.wifi.upgrade.modules.basicPermissions.model.Areas;
import com.sim.wifi.upgrade.modules.basicPermissions.mapper.AreasMapper;
import com.sim.wifi.upgrade.modules.basicPermissions.service.AreasService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
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
