package com.sim.wifi.upgrade.modules.permissions.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sim.wifi.upgrade.modules.permissions.model.AbRoleResource;
import com.sim.wifi.upgrade.modules.permissions.mapper.AbRoleResourceMapper;
import com.sim.wifi.upgrade.modules.permissions.service.AbRoleResourceService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sim.wifi.upgrade.modules.permissions.service.AbUserCacheService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zl
 * @since 2021-06-25
 */
@Service
public class AbRoleResourceServiceImpl extends ServiceImpl<AbRoleResourceMapper, AbRoleResource> implements AbRoleResourceService {
    private static final Logger logger = LoggerFactory.getLogger(AbRoleResourceServiceImpl.class);
    @Autowired
    private AbUserCacheService userCacheService;

    @Override
    public int allocResource(Integer userId, List<Integer> resourceIds) {
        //先删除原有关系
        QueryWrapper<AbRoleResource> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(AbRoleResource::getRoleId, userId);
        remove(wrapper);
        //批量插入新关系
        List<AbRoleResource> relationList = new ArrayList<>();
        for (Integer resourceId : resourceIds) {
            AbRoleResource relation = new AbRoleResource();
            relation.setRoleId(userId);
            relation.setResourceId(resourceId);
            relationList.add(relation);
        }
        saveBatch(relationList);
        userCacheService.delResourceListByRole(userId);
        return resourceIds.size();
    }
}
