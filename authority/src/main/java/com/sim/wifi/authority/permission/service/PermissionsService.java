package com.sim.wifi.authority.permission.service;

import com.sim.wifi.authority.permission.model.Permissions;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * description: 权限表 服务类
 * create by: li.zheng871@sim.com
 * create time: 2021/7/9
 */
public interface PermissionsService extends IService<Permissions> {
    public static Integer TYPE_DIRECTORY = 0;  //目录权限类型值
    public static Integer TYPE_MENU = 1;    //菜单权限类型值
    public static Integer TYPE_BUTTON = 2;  //按钮权限类型值


    /**
     * @param userId
     * @param type
     * @return java.util.List<com.sim.wifi.upgrade.basicPermissions.model.Permissions>
     * @Description 由UserId得到该用户不同权限类型的权限列表
     * @Date 2021/7/9
     **/
    List<Permissions> getPermissionsList(Integer userId, Integer type);
}
