package com.sim.wifi.upgrade.modules.permissions.service.impl;

import com.sim.wifi.upgrade.modules.permissions.model.ViewMenu;
import com.sim.wifi.upgrade.modules.permissions.mapper.ViewMenuMapper;
import com.sim.wifi.upgrade.modules.permissions.service.RoleMenuService;
import com.sim.wifi.upgrade.modules.permissions.service.ViewMenuService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * description:
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
@Service
public class ViewMenuServiceImpl extends ServiceImpl<ViewMenuMapper, ViewMenu> implements ViewMenuService {
    private static final Logger logger = LoggerFactory.getLogger(ViewMenuServiceImpl.class);
    @Autowired
    private RoleMenuService roleMenuService;


    @Override
    public boolean create(ViewMenu viewMenu) {
/*        viewMenu.setCreateTime(new Date());
        updateLevel(umsMenu);*/
        return save(viewMenu);
    }

    @Override
    public boolean update(Integer menuId, ViewMenu viewMenu) {
        viewMenu.setId(menuId);
        //updateLevel(umsMenu);
        return updateById(viewMenu);
    }

    @Override
    public boolean updateHidden(Integer menuId, Integer hidden) {
        ViewMenu viewMenu = new ViewMenu();
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
