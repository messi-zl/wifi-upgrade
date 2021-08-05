package com.sim.wifi.authority.permission.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.sim.wifi.authority.permission.model.Permissions;

import java.util.List;
import java.util.Map;

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
     * @Description 由UserId得到该用户不同权限类型的操作权限列表
     * @Date 2021/7/9
     **/
    List<Permissions> getPermissionsList(Integer userId, Integer type);


    /**
     * 由用户名得到该用户不同权限类型的权限列表
     **/
    List<Permissions> getPermissionsListByUsername(String username, Integer type);


    /**
     * 添加权限Permission
     */
    boolean create(Permissions permission);


    /**
     * 修改权限
     */
    boolean update(Integer permissionId, Permissions permission);

    /**
     * 删除权限
     */
    boolean delete(Integer permissionId);

    /**
     * 查询所有后台树形权限结构(操作权限+型号权限)
     **/
    Map<String, Object> getAllStructure();


    /**
     * 得到所有用户的操作权限,存于redis
     */
    List<Map<String, Object>> getAllUserDePermissions();


    /**
     * 判断用户对某请求是否具有权限
     */
    Boolean getPermission(String username, String url);

    /**
     * 分页显示所有各用户对应的权限列表
     */
    Page<Map<String, Object>> pageAllUsersLimits(Integer pageSize, Integer pageNum);


}
