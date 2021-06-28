package com.sim.wifi.upgrade.modules.permissions.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sim.wifi.upgrade.modules.permissions.model.AbRole;
import com.sim.wifi.upgrade.modules.permissions.mapper.AbRoleMapper;
import com.sim.wifi.upgrade.modules.permissions.model.AbRoleMenu;
import com.sim.wifi.upgrade.modules.permissions.model.AbRoleResource;
import com.sim.wifi.upgrade.modules.permissions.service.AbRoleMenuService;
import com.sim.wifi.upgrade.modules.permissions.service.AbRoleResourceService;
import com.sim.wifi.upgrade.modules.permissions.service.AbRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sim.wifi.upgrade.modules.permissions.service.AbUserCacheService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zl
 * @since 2021-06-22
 */
@Service
public class AbRoleServiceImpl extends ServiceImpl<AbRoleMapper, AbRole> implements AbRoleService {
    private static final Logger logger = LoggerFactory.getLogger(AbRoleServiceImpl.class);
    @Autowired
    private AbRoleMenuService roleMenuService;
    @Autowired
    private AbRoleResourceService roleResourceService;
    @Autowired
    private AbUserCacheService userCacheService;

    @Override
    public int allocMenu(Integer roleId, List<Integer> menuIds) {
        //先删除原有关系
        QueryWrapper<AbRoleMenu> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(AbRoleMenu::getRoleId,roleId);
        roleMenuService.remove(wrapper);
        //批量插入新关系
        List<AbRoleMenu> relationList = new ArrayList<>();
        for (Integer menuId : menuIds) {
            AbRoleMenu relation = new AbRoleMenu();
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
        QueryWrapper<AbRoleResource> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(AbRoleResource::getRoleId,roleId);
        roleResourceService.remove(wrapper);
        //批量插入新关系
        List<AbRoleResource> relationList = new ArrayList<>();
        for (Integer resourceId : resourceIds) {
            AbRoleResource relation = new AbRoleResource();
            relation.setRoleId(roleId);
            relation.setResourceId(resourceId);
            relationList.add(relation);
        }
        roleResourceService.saveBatch(relationList);
        userCacheService.delResourceListByRole(roleId);
        return resourceIds.size();
    }
}
