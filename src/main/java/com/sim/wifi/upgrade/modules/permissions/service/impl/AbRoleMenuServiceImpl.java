package com.sim.wifi.upgrade.modules.permissions.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sim.wifi.upgrade.modules.permissions.model.AbRoleMenu;
import com.sim.wifi.upgrade.modules.permissions.mapper.AbRoleMenuMapper;
import com.sim.wifi.upgrade.modules.permissions.service.AbRoleMenuService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zl
 * @since 2021-06-28
 */
@Service
public class AbRoleMenuServiceImpl extends ServiceImpl<AbRoleMenuMapper, AbRoleMenu> implements AbRoleMenuService {
    private static final Logger logger = LoggerFactory.getLogger(AbRoleMenuServiceImpl.class);

    @Override
    public int allocMenu(Integer userId, List<Integer> menuIds) {
        //先删除原有关系
        QueryWrapper<AbRoleMenu> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(AbRoleMenu::getRoleId,userId);
        remove(wrapper);
        //批量插入新关系
        List<AbRoleMenu> relationList = new ArrayList<>();
        for (Integer menuId : menuIds) {
            AbRoleMenu relation = new AbRoleMenu();
            relation.setRoleId(userId);
            relation.setMenuId(menuId);
            relationList.add(relation);
        }
        saveBatch(relationList);
        return menuIds.size();
    }
}
