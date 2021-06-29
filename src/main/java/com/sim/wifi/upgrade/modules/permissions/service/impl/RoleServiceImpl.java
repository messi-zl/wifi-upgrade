package com.sim.wifi.upgrade.modules.permissions.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sim.wifi.upgrade.modules.permissions.model.Role;
import com.sim.wifi.upgrade.modules.permissions.mapper.RoleMapper;
import com.sim.wifi.upgrade.modules.permissions.model.RoleMenu;
import com.sim.wifi.upgrade.modules.permissions.model.RoleResource;
import com.sim.wifi.upgrade.modules.permissions.service.RoleMenuService;
import com.sim.wifi.upgrade.modules.permissions.service.RoleResourceService;
import com.sim.wifi.upgrade.modules.permissions.service.RoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sim.wifi.upgrade.modules.permissions.service.UserCacheService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * description:
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {
    private static final Logger logger = LoggerFactory.getLogger(RoleServiceImpl.class);
    @Autowired
    private RoleMenuService roleMenuService;
    @Autowired
    private RoleResourceService roleResourceService;
    @Autowired
    private UserCacheService userCacheService;

    @Override
    public int allocMenu(Integer roleId, List<Integer> menuIds) {
        //先删除原有关系
        QueryWrapper<RoleMenu> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(RoleMenu::getRoleId, roleId);
        roleMenuService.remove(wrapper);
        //批量插入新关系
        List<RoleMenu> relationList = new ArrayList<>();
        for (Integer menuId : menuIds) {
            RoleMenu relation = new RoleMenu();
            relation.setRoleId(roleId);
            relation.setMenuId(menuId);
            relationList.add(relation);
        }
        roleMenuService.saveBatch(relationList);
        return menuIds.size();
    }

    @Override
    public int allocResource(Integer roleId, List<Integer> resourceIds) {
        //先删除原有关系
        QueryWrapper<RoleResource> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(RoleResource::getRoleId, roleId);
        roleResourceService.remove(wrapper);
        //批量插入新关系
        List<RoleResource> relationList = new ArrayList<>();
        for (Integer resourceId : resourceIds) {
            RoleResource relation = new RoleResource();
            relation.setRoleId(roleId);
            relation.setResourceId(resourceId);
            relationList.add(relation);
        }
        roleResourceService.saveBatch(relationList);
        userCacheService.delResourceListByRole(roleId);
        return resourceIds.size();
    }
}
