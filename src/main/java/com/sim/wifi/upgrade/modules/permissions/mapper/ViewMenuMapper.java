package com.sim.wifi.upgrade.modules.permissions.mapper;

import com.sim.wifi.upgrade.modules.permissions.model.ViewMenu;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * description:
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
public interface ViewMenuMapper extends BaseMapper<ViewMenu> {

    List<ViewMenu> getMenuListByUserId(@Param("userId") Integer userId);
}
