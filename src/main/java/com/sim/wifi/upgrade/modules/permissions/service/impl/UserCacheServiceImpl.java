package com.sim.wifi.upgrade.modules.permissions.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sim.wifi.upgrade.common.service.RedisService;
import com.sim.wifi.upgrade.modules.permissions.mapper.UserMapper;
import com.sim.wifi.upgrade.modules.permissions.model.Resource;
import com.sim.wifi.upgrade.modules.permissions.model.User;
import com.sim.wifi.upgrade.modules.permissions.model.UserRole;
import com.sim.wifi.upgrade.modules.permissions.service.UserCacheService;
import com.sim.wifi.upgrade.modules.permissions.service.UserRoleService;
import com.sim.wifi.upgrade.modules.permissions.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * description:
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
@Service
public class UserCacheServiceImpl implements UserCacheService {
    @Autowired
    private UserService userService;
    @Autowired
    private RedisService redisService;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserRoleService userRoleService;
    @Value("${redis.database}")
    private String REDIS_DATABASE;
    @Value("${redis.expire.common}")
    private Long REDIS_EXPIRE;
    @Value("${redis.key.admin}")
    private String REDIS_KEY_ADMIN;
    @Value("${redis.key.resourceList}")
    private String REDIS_KEY_RESOURCE_LIST;

    @Override
    public void delUser(Integer userId) {
/*        User user = userService.getById(userId);
        if (user != null) {
            String key = REDIS_DATABASE + ":" + REDIS_KEY_ADMIN + ":" + user.getUsername();
            redisService.del(key);
        }*/
    }

    @Override
    public void delResourceList(Long userId) {
        String key = REDIS_DATABASE + ":" + REDIS_KEY_RESOURCE_LIST + ":" + userId;
        redisService.del(key);
    }

    @Override
    public void delResourceListByRole(Integer roleId) {
 /*       QueryWrapper<UserRole> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(UserRole::getRoleId, roleId);
        List<UserRole> userRoleList = userRoleService.list(wrapper);
        if (CollUtil.isNotEmpty(userRoleList)) {
            String keyPrefix = REDIS_DATABASE + ":" + REDIS_KEY_RESOURCE_LIST + ":";
            List<String> keys = userRoleList.stream().map(relation -> keyPrefix + relation.getUserId()).collect(Collectors.toList());
            redisService.del(keys);
        }*/
    }

    @Override
    public void delResourceListByRoleIds(List<Long> roleIds) {
        QueryWrapper<UserRole> wrapper = new QueryWrapper<>();
        wrapper.lambda().in(UserRole::getRoleId, roleIds);
        List<UserRole> userRoleList = userRoleService.list(wrapper);
        if (CollUtil.isNotEmpty(userRoleList)) {
            String keyPrefix = REDIS_DATABASE + ":" + REDIS_KEY_RESOURCE_LIST + ":";
            List<String> keys = userRoleList.stream().map(relation -> keyPrefix + relation.getUserId()).collect(Collectors.toList());
            redisService.del(keys);
        }
    }

    @Override
    public void delResourceListByResource(Integer resourceId) {
/*        List<Integer> userIdList = userMapper.getUserIdList(resourceId);
        if (CollUtil.isNotEmpty(userIdList)) {
            String keyPrefix = REDIS_DATABASE + ":" + REDIS_KEY_RESOURCE_LIST + ":";
            List<String> keys = userIdList.stream().map(adminId -> keyPrefix + adminId).collect(Collectors.toList());
            redisService.del(keys);
        }*/
    }

    @Override
    public User getUser(String userName) {
       /* String key = REDIS_DATABASE + ":" + REDIS_KEY_ADMIN + ":" + userName;//mall:ums:admin:
        return (User) redisService.get(key);*/
        return null;
    }

    @Override
    public void setUser(User user) {
        /*String key = REDIS_DATABASE + ":" + REDIS_KEY_ADMIN + ":" + user.getUsername();
        redisService.set(key, user, REDIS_EXPIRE);*/
    }

    @Override
    public List<Resource> getResourceList(Integer userId) {
/*        String key = REDIS_DATABASE + ":" + REDIS_KEY_RESOURCE_LIST + ":" + userId;
        return (List<Resource>) redisService.get(key);*/
        List<Resource> list = new ArrayList<>();
        return list;
    }

    @Override
    public void setResourceList(Integer userId, List<Resource> resourceList) {
        /*String key = REDIS_DATABASE + ":" + REDIS_KEY_RESOURCE_LIST + ":" + userId;
        redisService.set(key, resourceList, REDIS_EXPIRE);*/
    }
}
