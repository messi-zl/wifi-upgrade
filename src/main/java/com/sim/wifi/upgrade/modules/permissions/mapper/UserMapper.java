package com.sim.wifi.upgrade.modules.permissions.mapper;

import com.sim.wifi.upgrade.modules.permissions.model.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * description:
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
public interface UserMapper extends BaseMapper<User> {
    /**
     * 获取资源相关用户ID列表
     */
    List<Integer> getUserIdList(@Param("resourceId") Integer resourceId);
}
