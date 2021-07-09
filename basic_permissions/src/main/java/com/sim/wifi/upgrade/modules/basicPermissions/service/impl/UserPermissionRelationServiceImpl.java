package com.sim.wifi.upgrade.modules.basicPermissions.service.impl;

import com.sim.wifi.upgrade.modules.basicPermissions.model.UserPermissionRelation;
import com.sim.wifi.upgrade.modules.basicPermissions.mapper.UserPermissionRelationMapper;
import com.sim.wifi.upgrade.modules.basicPermissions.service.UserPermissionRelationService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * description: 用户与权限对应表 服务实现类
 * create by: li.zheng871@sim.com
 * create time: 2021/7/9
 */
@Transactional
@Service
public class UserPermissionRelationServiceImpl extends ServiceImpl<UserPermissionRelationMapper, UserPermissionRelation> implements UserPermissionRelationService {
    private static final Logger logger = LoggerFactory.getLogger(UserPermissionRelationServiceImpl.class);

}
