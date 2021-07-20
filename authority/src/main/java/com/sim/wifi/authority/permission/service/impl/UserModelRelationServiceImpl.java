package com.sim.wifi.authority.permission.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sim.wifi.authority.permission.mapper.UserModelRelationMapper;
import com.sim.wifi.authority.permission.model.UserModelRelation;
import com.sim.wifi.authority.permission.service.UserModelRelationService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * description: 用户与型号对应关系表 服务实现类
 * create by: li.zheng871@sim.com
 * create time: 2021/7/9
 */
@Transactional
@Service
public class UserModelRelationServiceImpl extends ServiceImpl<UserModelRelationMapper, UserModelRelation> implements UserModelRelationService {
    private static final Logger logger = LoggerFactory.getLogger(UserModelRelationServiceImpl.class);

    @Override
    public int allocModelToUser(Integer userId, List<Integer> modelIds) {
        logger.info("开始给用户分配型号。用户id：{}，分配的型号id集{}", userId, modelIds.toString());
        //先删除原有关系
        QueryWrapper<UserModelRelation> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(UserModelRelation::getUserId, userId);
        remove(wrapper);
        //批量插入新关系
        List<UserModelRelation> relationList = new ArrayList<>();
        for (Integer modelId : modelIds) {
            UserModelRelation relation = new UserModelRelation();
            relation.setUserId(userId);
            relation.setModelId(modelId);
            relationList.add(relation);
        }
        saveBatch(relationList);
        //userCacheService.delResourceListByRole(userId);
        logger.info("给用户分配权限成功");
        return modelIds.size();
    }
}
