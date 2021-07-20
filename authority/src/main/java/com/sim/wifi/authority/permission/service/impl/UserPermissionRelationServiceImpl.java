package com.sim.wifi.authority.permission.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sim.wifi.authority.permission.mapper.UserPermissionRelationMapper;
import com.sim.wifi.authority.permission.model.UserPermissionRelation;
import com.sim.wifi.authority.permission.service.UserPermissionRelationService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * description: 用户与权限对应表 服务实现类
 * create by: li.zheng871@sim.com
 * create time: 2021/7/9
 */
@Transactional
@Service
public class UserPermissionRelationServiceImpl extends ServiceImpl<UserPermissionRelationMapper, UserPermissionRelation> implements UserPermissionRelationService {
    private static final Logger logger = LoggerFactory.getLogger(UserPermissionRelationServiceImpl.class);

    @Override
    public int allocPermissionToUser(Integer userId, List<Integer> permissionIds) {
        logger.info("开始给用户分配权限。用户id：{}，分配的权限id集{}", userId, permissionIds.toString());
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
        logger.info("给用户分配权限成功");
        return permissionIds.size();
    }
}
