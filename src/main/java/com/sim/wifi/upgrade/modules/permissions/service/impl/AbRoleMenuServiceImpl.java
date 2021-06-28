package com.sim.wifi.upgrade.modules.permissions.service.impl;

import com.sim.wifi.upgrade.modules.permissions.model.AbRoleMenu;
import com.sim.wifi.upgrade.modules.permissions.mapper.AbRoleMenuMapper;
import com.sim.wifi.upgrade.modules.permissions.service.AbRoleMenuService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

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

}
