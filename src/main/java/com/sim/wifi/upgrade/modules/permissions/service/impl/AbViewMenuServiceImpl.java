package com.sim.wifi.upgrade.modules.permissions.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sim.wifi.upgrade.modules.permissions.model.AbRoleMenu;
import com.sim.wifi.upgrade.modules.permissions.model.AbViewMenu;
import com.sim.wifi.upgrade.modules.permissions.mapper.AbViewMenuMapper;
import com.sim.wifi.upgrade.modules.permissions.service.AbRoleMenuService;
import com.sim.wifi.upgrade.modules.permissions.service.AbViewMenuService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
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
public class AbViewMenuServiceImpl extends ServiceImpl<AbViewMenuMapper, AbViewMenu> implements AbViewMenuService {
    private static final Logger logger = LoggerFactory.getLogger(AbViewMenuServiceImpl.class);
    @Autowired
    private AbRoleMenuService roleMenuService;


    @Override
    public boolean create(AbViewMenu viewMenu) {
/*        viewMenu.setCreateTime(new Date());
        updateLevel(umsMenu);*/
        return save(viewMenu);
    }

    @Override
    public boolean update(Integer menuId, AbViewMenu viewMenu) {
        viewMenu.setId(menuId);
        //updateLevel(umsMenu);
        return updateById(viewMenu);
    }

    @Override
    public boolean updateHidden(Integer menuId, Integer hidden) {
        AbViewMenu viewMenu = new AbViewMenu();
        viewMenu.setId(menuId);
        //viewMenu.setHidden(hidden);
        return updateById(viewMenu);
    }

/*    *//**
     * 修改菜单层级
     *//*
    private void updateLevel(AbViewMenu viewMenu) {
        if (viewMenu.getParentId() == 0) {
            //没有父菜单时为一级菜单
            viewMenu.setLevel(0);
        } else {
            //有父菜单时选择根据父菜单level设置
            AbViewMenu parentViewMenu = getById(viewMenu.getParentId());
            if (parentMenu != null) {
                viewMenu.setLevel(parentMenu.getLevel() + 1);
            } else {
                viewMenu.setLevel(0);
            }
        }
    }*/
}
