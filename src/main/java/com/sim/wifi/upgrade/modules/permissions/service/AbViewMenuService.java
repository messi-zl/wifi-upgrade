package com.sim.wifi.upgrade.modules.permissions.service;

import com.sim.wifi.upgrade.modules.permissions.model.AbViewMenu;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zl
 * @since 2021-06-22
 */
public interface AbViewMenuService extends IService<AbViewMenu> {


    /**
     * 创建后台菜单
     */
    boolean create(AbViewMenu viewMenu);

    /**
     * 由菜单id修改后台菜单
     */
    boolean update(Integer menuId, AbViewMenu viewMenu);


    /**
     * 根据菜单id修改菜单显示状态
     */
    boolean updateHidden(Integer menuId, Integer hidden);
}
