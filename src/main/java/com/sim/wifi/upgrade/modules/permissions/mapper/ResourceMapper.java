package com.sim.wifi.upgrade.modules.permissions.mapper;

import com.sim.wifi.upgrade.modules.permissions.model.Resource;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * description:
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
public interface ResourceMapper extends BaseMapper<Resource> {
    /**
     * 获取用户所有可访问资源
     */
    List<Resource> getResourceList(@Param("userId") Integer userId);
}
