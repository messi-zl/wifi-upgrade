package com.sim.wifi.authority.permission.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sim.wifi.authority.common.exception.Asserts;
import com.sim.wifi.authority.common.service.RedisService;
import com.sim.wifi.authority.permission.mapper.UserPermissionRelationMapper;
import com.sim.wifi.authority.permission.model.Permissions;
import com.sim.wifi.authority.permission.model.UserPermissionRelation;
import com.sim.wifi.authority.permission.service.PermissionsService;
import com.sim.wifi.authority.permission.service.UserModelRelationService;
import com.sim.wifi.authority.permission.service.UserPermissionRelationService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * description: 用户与权限对应表 服务实现类
 * create by: li.zheng871@sim.com
 * create time: 2021/7/9
 */
@Transactional
@Service
public class UserPermissionRelationServiceImpl extends ServiceImpl<UserPermissionRelationMapper, UserPermissionRelation> implements UserPermissionRelationService {
    private static final Logger logger = LoggerFactory.getLogger(UserPermissionRelationServiceImpl.class);
    @Value("${redis.key.allPermission}")
    private String REDIS_KEY_ALL_PERMISSION;
    @Value("${redis.key.userPermissionRelation}")
    private String REDIS_KEY_ALL_USER_PERMISSION_RELATION;

    @Autowired
    private RedisService redisService;
    @Autowired
    private PermissionsService permissionsService;
    @Autowired
    private UserModelRelationService userModelRelationService;


    @Override
    public int allocPermissionToUser(Integer userId, List<Integer> permissionIds) {
        logger.info("开始给用户分配操作权限。用户id：{}，分配的操作权限id集{}", userId, permissionIds.toString());
        //先删除原有关系
        QueryWrapper<UserPermissionRelation> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(UserPermissionRelation::getUserId, userId);
        remove(wrapper);
        //批量插入新关系
        List<UserPermissionRelation> relationList = new ArrayList<>();
        for (Integer permissionId : permissionIds) {
            UserPermissionRelation relation = new UserPermissionRelation();
            relation.setUserId(userId);
            relation.setPermissionId(permissionId);
            relationList.add(relation);
        }
        saveBatch(relationList);
        //userCacheService.delResourceListByRole(userId);
        logger.info("给用户分配操作权限成功");
        return permissionIds.size();
    }

    @Override
    public void initPermissionUserRulesMap() {
        //todo 用户 资源  用户与资源变动均需执行
        //将所有资源，and，用户与资源对应的关系，放入redis中
        Map<String, String> allPermissionMap = new HashMap<>();
        QueryWrapper<Permissions> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(Permissions::getStatus, 1).eq(Permissions::getType, PermissionsService.TYPE_BUTTON);
        List<Permissions> list = permissionsService.list(wrapper);
        for (Permissions permission : list) {
            allPermissionMap.put(permission.getName(), permission.getUrl());
        }
        redisService.del(REDIS_KEY_ALL_PERMISSION);
        redisService.hSetAll(REDIS_KEY_ALL_PERMISSION, allPermissionMap);


        //得到所有的用户 对应的权限
        List<Map<String, Object>> mapList = permissionsService.getAllUserDePermissions();
        Map<String, List<Map<String, Object>>> usernamePermissionsMap = mapList.stream().collect(Collectors.groupingBy(item -> item.get("username").toString()));
        redisService.del(REDIS_KEY_ALL_USER_PERMISSION_RELATION);
        redisService.hSetAll(REDIS_KEY_ALL_USER_PERMISSION_RELATION, usernamePermissionsMap);
    }

    @Override
    public void allocLimits(Integer userId, Map<String, List<Integer>> limitIdMap) {
        if (limitIdMap == null) Asserts.fail("传入limitIdMap为null");
        List<Integer> permissionIds = limitIdMap.get("permissionIds");
        List<Integer> modelIds = limitIdMap.get("modelIds");
        allocPermissionToUser(userId, permissionIds);
        userModelRelationService.allocModelToUser(userId, modelIds);
    }
}
