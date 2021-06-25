package com.sim.wifi.upgrade.modules.permissions.mapper;

import com.sim.wifi.upgrade.modules.permissions.model.AbResource;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zl
 * @since 2021-06-25
 */
public interface AbResourceMapper extends BaseMapper<AbResource> {
    /**
     * 获取用户所有可访问资源
     */
    List<AbResource> getResourceList(@Param("userId") Integer userId);
}
