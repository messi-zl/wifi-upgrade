package com.sim.wifi.authority.permission.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sim.wifi.authority.permission.mapper.PermissionsMapper;
import com.sim.wifi.authority.permission.model.Permissions;
import com.sim.wifi.authority.permission.model.Users;
import com.sim.wifi.authority.permission.service.PermissionsService;
import com.sim.wifi.authority.permission.service.UsersService;
import com.sim.wifi.authority.security.util.ListUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;

import java.util.ArrayList;
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
    @Autowired
    private UsersService usersService;

    @Override
    public List<Permissions> getPermissionsList(Integer userId, Integer type) {
        List<Permissions> permissionsList = permissionsMapper.getPermissionsList(userId, type);
        return permissionsList;
    }

    @Override
    public List<Permissions> getPermissionsListByUsername(String username, Integer type) {
        List<Permissions> permissionsList = permissionsMapper.getPermissionsListByUsername(username, type);
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
    public Map<String, Object> getAllStructure() {
        Map<String, Object> map = new HashMap<>();
        QueryWrapper<Permissions> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(Permissions::getStatus, 1);
        List<Permissions> permissionsList = list(wrapper);
        map.put("directorys", permissionsList.stream().filter(permission -> permission.getType().compareTo(PermissionsService.TYPE_DIRECTORY) == 0).collect(Collectors.toList()));
        map.put("menus", permissionsList.stream().filter(permission -> permission.getType().compareTo(PermissionsService.TYPE_MENU) == 0).collect(Collectors.toList()));
        map.put("buttons", permissionsList.stream().filter(permission -> permission.getType().compareTo(PermissionsService.TYPE_BUTTON) == 0).collect(Collectors.toList()));

        List<Map<String, Object>> modelLimits = permissionsMapper.getModelStructure();
        map.put("型号权限", modelLimits);
        return map;
    }

    @Override
    public List<Map<String, Object>> getAllUserDePermissions() {
        return permissionsMapper.getAllUserDePermissions();
    }

    @Override
    public Boolean getPermission(String username, String url) {
        //all 启用的button权限
        QueryWrapper<Permissions> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(Permissions::getType, TYPE_BUTTON).eq(Permissions::getStatus, 1);
        List<Permissions> allButtonPermissionsList = list(wrapper);

        //匹配的
        List<String> matchUrlList = new ArrayList<>();
        PathMatcher pathMatcher = new AntPathMatcher();
        for (Permissions permission : allButtonPermissionsList) {
            String itrUrl = permission.getUrl();
            if (pathMatcher.match(itrUrl, url)) {
                matchUrlList.add(itrUrl);
            }
        }

        //无匹配的，表示对该请求url没有限制，直接放行
        if (CollUtil.isEmpty(matchUrlList)) return true;

        //有匹配的，表示对该请求url进行了限制。那么要去看用户对该url有无权限
        List<Permissions> authList = getPermissionsListByUsername(username, TYPE_BUTTON);//有权限的
        for (String matchUrl : matchUrlList) {
            for (Permissions permission : authList) {
                String authUrl = permission.getUrl();
                if (matchUrl.trim().equals(authUrl.trim())) return true;
            }
        }
        return false;
    }


    @Override
    public Page<Map<String, Object>> pageAllUsersLimits(Integer pageSize, Integer pageNum) {
        Page<Map<String, Object>> page = new Page<>(pageNum, pageSize);
        List<Map<String, Object>> content = new ArrayList<>();
        List<Users> usersList = usersService.list();
        //所有用户对应的操作权限
        List<Map<String, Object>> permissionLimitMaps = permissionsMapper.getAllUsersPermissionLimits();
        //所有用户对应的型号权限
        List<Map<String, Object>> modelLimitMaps = permissionsMapper.getAllUsersModelLimits();

        for (Users user : usersList) {
            Map<String, Object> lineContent = new HashMap<>();
            List<Map<String, Object>> linePermission = new ArrayList<>();
            List<Map<String, Object>> lineModel = new ArrayList<>();

            for (Map<String, Object> permissionLimit : permissionLimitMaps) {
                if (permissionLimit.get("user_id").equals(user.getId())) linePermission.add(permissionLimit);
            }
            for (Map<String, Object> modelLimit : modelLimitMaps) {
                if (modelLimit.get("user_id").equals(user.getId())) lineModel.add(modelLimit);
            }
            lineContent.put("users", user);
            lineContent.put("permissionLimit", linePermission);
            lineContent.put("modelLimit", lineModel);
            content.add(lineContent);
        }
        page.setRecords(ListUtil.startPage(content, pageNum, pageSize));//每页显示的数据
        page.setTotal(content.size());
        return page;
    }

}
