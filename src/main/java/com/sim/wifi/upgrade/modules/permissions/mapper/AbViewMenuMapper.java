package com.sim.wifi.upgrade.modules.permissions.mapper;

import com.sim.wifi.upgrade.modules.permissions.model.AbViewMenu;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zl
 * @since 2021-06-22
 */
public interface AbViewMenuMapper extends BaseMapper<AbViewMenu> {

    List<AbViewMenu> getMenuListByUserId(@Param("userId") Integer userId);
}
