package com.sim.wifi.upgrade.modules.permissions.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sim.wifi.upgrade.modules.permissions.model.RoleResource;
import com.sim.wifi.upgrade.modules.permissions.mapper.RoleResourceMapper;
import com.sim.wifi.upgrade.modules.permissions.service.RoleResourceService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sim.wifi.upgrade.modules.permissions.service.UserCacheService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * description:
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
@Service
public class RoleResourceServiceImpl extends ServiceImpl<RoleResourceMapper, RoleResource> implements RoleResourceService {
    private static final Logger logger = LoggerFactory.getLogger(RoleResourceServiceImpl.class);
    @Autowired
    private UserCacheService userCacheService;

    @Override
    public int allocResource(Integer userId, List<Integer> resourceIds) {
        //先删除原有关系
        QueryWrapper<RoleResource> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(RoleResource::getRoleId, userId);
        remove(wrapper);
        //批量插入新关系
        List<RoleResource> relationList = new ArrayList<>();
        for (Integer resourceId : resourceIds) {
            RoleResource relation = new RoleResource();
            relation.setRoleId(userId);
            relation.setResourceId(resourceId);
            relationList.add(relation);
        }
        saveBatch(relationList);
        userCacheService.delResourceListByRole(userId);
        return resourceIds.size();
    }
}
