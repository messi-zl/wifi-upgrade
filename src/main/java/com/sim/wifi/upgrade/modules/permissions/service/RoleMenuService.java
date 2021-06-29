package com.sim.wifi.upgrade.modules.permissions.service;

import com.sim.wifi.upgrade.modules.permissions.model.RoleMenu;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * description:
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
public interface RoleMenuService extends IService<RoleMenu> {
    /**
     * 分配菜单给用户
     */
    @Transactional
    int allocMenu(Integer userId, List<Integer> menuIds);
}
