package com.sim.wifi.upgrade.modules.permissions.service;

import com.sim.wifi.upgrade.modules.permissions.model.AbRoleMenu;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zl
 * @since 2021-06-28
 */
public interface AbRoleMenuService extends IService<AbRoleMenu> {
    /**
     * 分配菜单给用户
     */
    @Transactional
    int allocMenu(Integer userId, List<Integer> menuIds);
}
