package com.sim.wifi.authority.permission.service.impl;

import com.sim.wifi.authority.permission.model.Permissions;
import com.sim.wifi.authority.permission.mapper.PermissionsMapper;
import com.sim.wifi.authority.permission.service.PermissionsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * description: 权限表 服务实现类
 * create by: li.zheng871@sim.com
 * create time: 2021/7/9
 */
@Transactional
@Service
public class PermissionsServiceImpl extends ServiceImpl<PermissionsMapper, Permissions> implements PermissionsService {
    private static final Logger logger = LoggerFactory.getLogger(PermissionsServiceImpl.class);

    @Autowired
    private PermissionsMapper permissionsMapper;

    @Override
    public List<Permissions> getPermissionsList(Integer userId,Integer type) {
        List<Permissions> permissionsList = permissionsMapper.getPermissionsList(userId,type);
        return permissionsList;
    }
}
