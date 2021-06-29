package com.sim.wifi.upgrade.modules.permissions.service;

import com.sim.wifi.upgrade.modules.permissions.model.Role;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * description:
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
public interface RoleService extends IService<Role> {

    /**
     * 给角色分配菜单
     */
    @Transactional
    int allocMenu(Integer roleId, List<Integer> menuIds);

    /**
     * 给角色分配资源
     */
    @Transactional
    int allocResource(Integer roleId, List<Integer> resourceIds);
}

