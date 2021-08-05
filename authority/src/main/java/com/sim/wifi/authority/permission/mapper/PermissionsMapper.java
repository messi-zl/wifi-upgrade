package com.sim.wifi.authority.permission.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sim.wifi.authority.permission.model.Permissions;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * description: 权限表 Mapper 接口
 * create by: li.zheng871@sim.com
 * create time: 2021/7/9
 */
@Mapper
public interface PermissionsMapper extends BaseMapper<Permissions> {

    /**
     * 由UserId得到该用户不同权限类型的操作列表（该用户已启用的操作权限，渲染）
     */
    List<Permissions> getPermissionsList(@Param("userId") Integer userId, @Param("type") Integer type);

    /**
     * 由用户名得到该用户不同权限类型的操作权限列表
     */
    List<Permissions> getPermissionsListByUsername(@Param("username") String username, @Param("type") Integer type);

    /**
     * 得到所有用户的操作权限
     */
    List<Map<String, Object>> getAllUserDePermissions();


    /**
     * 得到所有型号权限结构
     */
    List<Map<String, Object>> getModelStructure();


    /**
     * 得到所有用户对应的操作权限(包含未启用的用户)
     */
    List<Map<String, Object>> getAllUsersPermissionLimits();

    /**
     * 得到所有用户对应的型号权限(包含未启用的用户)
     */
    List<Map<String, Object>> getAllUsersModelLimits();


}
