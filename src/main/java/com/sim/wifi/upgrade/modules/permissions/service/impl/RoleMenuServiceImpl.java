package com.sim.wifi.upgrade.modules.permissions.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sim.wifi.upgrade.modules.permissions.model.RoleMenu;
import com.sim.wifi.upgrade.modules.permissions.mapper.RoleMenuMapper;
import com.sim.wifi.upgrade.modules.permissions.service.RoleMenuService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * description:
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
@Service
public class RoleMenuServiceImpl extends ServiceImpl<RoleMenuMapper, RoleMenu> implements RoleMenuService {
    private static final Logger logger = LoggerFactory.getLogger(RoleMenuServiceImpl.class);

    @Override
    public int allocMenu(Integer userId, List<Integer> menuIds) {
        //先删除原有关系
        QueryWrapper<RoleMenu> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(RoleMenu::getRoleId, userId);
        remove(wrapper);
        //批量插入新关系
        List<RoleMenu> relationList = new ArrayList<>();
        for (Integer menuId : menuIds) {
            RoleMenu relation = new RoleMenu();
            relation.setRoleId(userId);
            relation.setMenuId(menuId);
            relationList.add(relation);
        }
        saveBatch(relationList);
        return menuIds.size();
    }
}
