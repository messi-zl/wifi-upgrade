package com.sim.wifi.authority.permission.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sim.wifi.authority.permission.mapper.PermissionsMapper;
import com.sim.wifi.authority.permission.model.Permissions;
import com.sim.wifi.authority.permission.service.PermissionsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
    public List<Permissions> getPermissionsList(Integer userId, Integer type) {
        List<Permissions> permissionsList = permissionsMapper.getPermissionsList(userId, type);
        return permissionsList;
    }

    @Override
    public boolean create(Permissions permission) {
        return save(permission);
    }

    @Override
    public boolean update(Integer permissionId, Permissions permission) {
        permission.setId(permissionId);
        boolean success = updateById(permission);
        //userCacheService.delResourceListByResource(resourceId);
        return success;
    }

    @Override
    public boolean delete(Integer permissionId) {
        boolean success = removeById(permissionId);
        return success;
    }

    @Override
    public Map<String, Object> listAll() {
        Map<String, Object> map = new HashMap<>();
        List<Permissions> permissionsList = list();
        map.put("directorys", permissionsList.stream().filter(permission -> permission.getType().compareTo(PermissionsService.TYPE_DIRECTORY) == 0).collect(Collectors.toList()));
        map.put("menus", permissionsList.stream().filter(permission -> permission.getType().compareTo(PermissionsService.TYPE_MENU) == 0).collect(Collectors.toList()));
        map.put("buttons", permissionsList.stream().filter(permission -> permission.getType().compareTo(PermissionsService.TYPE_BUTTON) == 0).collect(Collectors.toList()));
        return map;
    }
}
