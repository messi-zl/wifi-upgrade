package com.sim.wifi.authority.permission.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.sim.wifi.authority.permission.model.UserModelRelation;

import java.util.List;

/**
 * description: 用户与型号对应关系表 服务类
 * create by: li.zheng871@sim.com
 * create time: 2021/7/9
 */
public interface UserModelRelationService extends IService<UserModelRelation> {
    /**
     * 给用户分配型号
     */
    int allocModelToUser(Integer userId, List<Integer> modelIds);
}
