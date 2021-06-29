package com.sim.wifi.upgrade.modules.permissions.service;

import com.sim.wifi.upgrade.modules.permissions.model.ViewMenu;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * description:
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
public interface ViewMenuService extends IService<ViewMenu> {


    /**
     * 创建后台菜单
     */
    boolean create(ViewMenu viewMenu);

    /**
     * 由菜单id修改后台菜单
     */
    boolean update(Integer menuId, ViewMenu viewMenu);


    /**
     * 根据菜单id修改菜单显示状态
     */
    boolean updateHidden(Integer menuId, Integer hidden);
}
