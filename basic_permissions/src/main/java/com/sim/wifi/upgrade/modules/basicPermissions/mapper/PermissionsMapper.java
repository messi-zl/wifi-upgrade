package com.sim.wifi.upgrade.modules.basicPermissions.mapper;

import com.sim.wifi.upgrade.modules.basicPermissions.model.Permissions;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * description: 权限表 Mapper 接口
 * create by: li.zheng871@sim.com
 * create time: 2021/7/9
 */
@Mapper
public interface PermissionsMapper extends BaseMapper<Permissions> {

    /**
     * 由UserId得到该用户不同权限类型的权限列表
     */
    List<Permissions> getPermissionsList(@Param("userId") Integer userId,@Param("type") Integer type);
}
