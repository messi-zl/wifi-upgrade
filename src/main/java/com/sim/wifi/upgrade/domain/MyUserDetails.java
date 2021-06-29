package com.sim.wifi.upgrade.domain;

import com.sim.wifi.upgrade.modules.permissions.model.Resource;
import com.sim.wifi.upgrade.modules.permissions.model.User;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

/**
 * description: SpringSecurity需要的用户详情
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
public class MyUserDetails implements UserDetails {//封装用户信息的类（主要是用户信息和权限）
    private User user;
    private List<Resource> resourceList;

    public MyUserDetails(User user, List<Resource> resourceList) {
        this.user = user;
        this.resourceList = resourceList;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        //返回当前用户的角色，用户与权限绑定
        return resourceList.stream()
                .map(resource -> new SimpleGrantedAuthority(resource.getId() + ":" + resource.getName()))
                .collect(Collectors.toList());
    }

    @Override
    public String getPassword() {
        return user.getPassword();
    }

    @Override
    public String getUsername() {
        return user.getUsername();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return user.getActive();//是否激活
    }
}
