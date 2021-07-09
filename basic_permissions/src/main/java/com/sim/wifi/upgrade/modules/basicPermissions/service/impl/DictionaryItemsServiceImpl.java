package com.sim.wifi.upgrade.modules.basicPermissions.service.impl;

import com.sim.wifi.upgrade.modules.basicPermissions.model.DictionaryItems;
import com.sim.wifi.upgrade.modules.basicPermissions.mapper.DictionaryItemsMapper;
import com.sim.wifi.upgrade.modules.basicPermissions.service.DictionaryItemsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * description: 字典条目表 服务实现类
 * create by: li.zheng871@sim.com
 * create time: 2021/7/9
 */
@Transactional
@Service
public class DictionaryItemsServiceImpl extends ServiceImpl<DictionaryItemsMapper, DictionaryItems> implements DictionaryItemsService {
    private static final Logger logger = LoggerFactory.getLogger(DictionaryItemsServiceImpl.class);

}
