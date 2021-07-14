package com.sim.wifi.authority.security.securityExpand;

import com.sim.wifi.authority.permission.model.Permissions;
import com.sim.wifi.authority.permission.model.Users;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * @Description: 自定义UserDetails，SpringSecurity需要的用户详情
 * @CreateBy: li.zheng871@sim.com
 * @DateTime: 2021/7/9
 */
public class CustomUserDetails implements UserDetails {
    private Users users;
    private List<Permissions> permissionsList;

    public CustomUserDetails(Users users, List<Permissions> permissionsList) {
        this.users = users;
        this.permissionsList = permissionsList;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        //返回当前用户的角色，用户与权限绑定
        Collection<SimpleGrantedAuthority> collection = new ArrayList<>();
        for (Permissions permissions : permissionsList) {
            SimpleGrantedAuthority simpleGrantedAuthority = new SimpleGrantedAuthority(permissions.getId() + ":" + permissions.getName());
            collection.add(simpleGrantedAuthority);
        }
        return collection;
    }

    @Override
    public String getPassword() {
        return null;
    }

    @Override
    public String getUsername() {
        return null;
    }

    @Override
    public boolean isAccountNonExpired() {
        return false;
    }

    @Override
    public boolean isAccountNonLocked() {
        return false;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return false;
    }

    @Override
    public boolean isEnabled() {
        Boolean flag = true;
        if (0 == users.getStatus()){
            flag = false;
        }
        return flag;
    }
}
