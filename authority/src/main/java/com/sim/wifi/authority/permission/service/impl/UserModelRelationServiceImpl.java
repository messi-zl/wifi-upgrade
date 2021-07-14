package com.sim.wifi.authority.permission.service.impl;

import com.sim.wifi.authority.permission.model.UserModelRelation;
import com.sim.wifi.authority.permission.mapper.UserModelRelationMapper;
import com.sim.wifi.authority.permission.service.UserModelRelationService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * description: 用户与型号对应关系表 服务实现类
 * create by: li.zheng871@sim.com
 * create time: 2021/7/9
 */
@Transactional
@Service
public class UserModelRelationServiceImpl extends ServiceImpl<UserModelRelationMapper, UserModelRelation> implements UserModelRelationService {
    private static final Logger logger = LoggerFactory.getLogger(UserModelRelationServiceImpl.class);

}
