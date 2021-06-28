package com.sim.wifi.upgrade.modules.permissions.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sim.wifi.upgrade.common.service.RedisService;
import com.sim.wifi.upgrade.modules.permissions.mapper.AbUserMapper;
import com.sim.wifi.upgrade.modules.permissions.model.AbResource;
import com.sim.wifi.upgrade.modules.permissions.model.AbUser;
import com.sim.wifi.upgrade.modules.permissions.model.AbUserRole;
import com.sim.wifi.upgrade.modules.permissions.service.AbUserCacheService;
import com.sim.wifi.upgrade.modules.permissions.service.AbUserRoleService;
import com.sim.wifi.upgrade.modules.permissions.service.AbUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;


@Service
public class AbUserCacheServiceImpl implements AbUserCacheService {
    @Autowired
    private AbUserService userService;
    @Autowired
    private RedisService redisService;
    @Autowired
    private AbUserMapper userMapper;
    @Autowired
    private AbUserRoleService userRoleService;
    @Value("${redis.database}")
    private String REDIS_DATABASE;
    @Value("${redis.expire.common}")
    private Long REDIS_EXPIRE;
    @Value("${redis.key.admin}")
    private String REDIS_KEY_ADMIN;
    @Value("${redis.key.resourceList}")
    private String REDIS_KEY_RESOURCE_LIST;

    @Override
    public void delUser(Long userId) {
        AbUser abUser = userService.getById(userId);
        if (abUser != null) {
            String key = REDIS_DATABASE + ":" + REDIS_KEY_ADMIN + ":" + abUser.getUsername();
            redisService.del(key);
        }
    }

    @Override
    public void delResourceList(Long userId) {
        String key = REDIS_DATABASE + ":" + REDIS_KEY_RESOURCE_LIST + ":" + userId;
        redisService.del(key);
    }

    @Override
    public void delResourceListByRole(Integer roleId) {
        QueryWrapper<AbUserRole> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(AbUserRole::getRoleId,roleId);
        List<AbUserRole> userRoleList = userRoleService.list(wrapper);
        if (CollUtil.isNotEmpty(userRoleList)) {
            String keyPrefix = REDIS_DATABASE + ":" + REDIS_KEY_RESOURCE_LIST + ":";
            List<String> keys = userRoleList.stream().map(relation -> keyPrefix + relation.getUserId()).collect(Collectors.toList());
            redisService.del(keys);
        }
    }

    @Override
    public void delResourceListByRoleIds(List<Long> roleIds) {
        QueryWrapper<AbUserRole> wrapper = new QueryWrapper<>();
        wrapper.lambda().in(AbUserRole::getRoleId,roleIds);
        List<AbUserRole> userRoleList = userRoleService.list(wrapper);
        if (CollUtil.isNotEmpty(userRoleList)) {
            String keyPrefix = REDIS_DATABASE + ":" + REDIS_KEY_RESOURCE_LIST + ":";
            List<String> keys = userRoleList.stream().map(relation -> keyPrefix + relation.getUserId()).collect(Collectors.toList());
            redisService.del(keys);
        }
    }

    @Override
    public void delResourceListByResource(Long resourceId) {
        List<Long> userIdList = userMapper.getUserIdList(resourceId);
        if (CollUtil.isNotEmpty(userIdList)) {
            String keyPrefix = REDIS_DATABASE + ":" + REDIS_KEY_RESOURCE_LIST + ":";
            List<String> keys = userIdList.stream().map(adminId -> keyPrefix + adminId).collect(Collectors.toList());
            redisService.del(keys);
        }
    }

    @Override
    public AbUser getUser(String userName) {
        String key = REDIS_DATABASE + ":" + REDIS_KEY_ADMIN + ":" + userName;//mall:ums:admin:
        return (AbUser) redisService.get(key);
    }

    @Override
    public void setUser(AbUser user) {
        String key = REDIS_DATABASE + ":" + REDIS_KEY_ADMIN + ":" + user.getUsername();
        redisService.set(key, user, REDIS_EXPIRE);
    }

    @Override
    public List<AbResource> getResourceList(Integer userId) {
        String key = REDIS_DATABASE + ":" + REDIS_KEY_RESOURCE_LIST + ":" + userId;
        return (List<AbResource>) redisService.get(key);
    }

    @Override
    public void setResourceList(Integer userId, List<AbResource> resourceList) {
        String key = REDIS_DATABASE + ":" + REDIS_KEY_RESOURCE_LIST + ":" + userId;
        redisService.set(key, resourceList, REDIS_EXPIRE);
    }
}
