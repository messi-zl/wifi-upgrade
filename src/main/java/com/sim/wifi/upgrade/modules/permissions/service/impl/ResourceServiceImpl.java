package com.sim.wifi.upgrade.modules.permissions.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.sim.wifi.upgrade.modules.permissions.model.Resource;
import com.sim.wifi.upgrade.modules.permissions.mapper.ResourceMapper;
import com.sim.wifi.upgrade.modules.permissions.service.ResourceService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sim.wifi.upgrade.modules.permissions.service.UserCacheService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * description:
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
@Service
public class ResourceServiceImpl extends ServiceImpl<ResourceMapper, Resource> implements ResourceService {
    private static final Logger logger = LoggerFactory.getLogger(ResourceServiceImpl.class);
    @Autowired
    private ResourceMapper resourceMapper;
    @Autowired
    private UserCacheService userCacheService;

    @Override
    public List<Resource> getResourceList(Integer userId) {
        List<Resource> resourceList = userCacheService.getResourceList(userId);
        if (CollUtil.isNotEmpty(resourceList)) {
            return resourceList;
        }
        resourceList = resourceMapper.getResourceList(userId);
        if (CollUtil.isNotEmpty(resourceList)) {
            userCacheService.setResourceList(userId, resourceList);
        }
        return resourceList;
    }


    @Override
    public boolean create(Resource resource) {
        //resource.setCreateTime(new Date());
        return save(resource);
    }

    @Override
    public boolean update(Integer resourceId, Resource resource) {
        resource.setId(resourceId);
        boolean success = updateById(resource);
        userCacheService.delResourceListByResource(resourceId);
        return success;
    }

    @Override
    public boolean delete(Integer resourceId) {
        boolean success = removeById(resourceId);
        userCacheService.delResourceListByResource(resourceId);
        return success;
    }
}
