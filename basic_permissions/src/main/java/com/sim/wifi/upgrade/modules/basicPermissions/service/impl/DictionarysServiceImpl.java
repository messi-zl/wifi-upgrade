package com.sim.wifi.upgrade.modules.basicPermissions.service.impl;

import com.sim.wifi.upgrade.modules.basicPermissions.model.Dictionarys;
import com.sim.wifi.upgrade.modules.basicPermissions.mapper.DictionarysMapper;
import com.sim.wifi.upgrade.modules.basicPermissions.service.DictionarysService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * description: 数据字典表 服务实现类
 * create by: li.zheng871@sim.com
 * create time: 2021/7/9
 */
@Transactional
@Service
public class DictionarysServiceImpl extends ServiceImpl<DictionarysMapper, Dictionarys> implements DictionarysService {
    private static final Logger logger = LoggerFactory.getLogger(DictionarysServiceImpl.class);

}
