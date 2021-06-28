package com.sim.wifi.upgrade.modules.permissions.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sim.wifi.upgrade.domain.MyUserDetails;
import com.sim.wifi.upgrade.modules.permissions.mapper.AbResourceMapper;
import com.sim.wifi.upgrade.modules.permissions.model.AbResource;
import com.sim.wifi.upgrade.modules.permissions.model.AbUser;
import com.sim.wifi.upgrade.modules.permissions.mapper.AbUserMapper;
import com.sim.wifi.upgrade.modules.permissions.service.AbUserCacheService;
import com.sim.wifi.upgrade.modules.permissions.service.AbUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author zl
 * @since 2021-06-22
 */
@Service
public class AbUserServiceImpl extends ServiceImpl<AbUserMapper, AbUser> implements AbUserService {
    private static final Logger LOGGER = LoggerFactory.getLogger(AbUserServiceImpl.class);
    @Autowired
    private AbUserCacheService userCacheService;
    @Autowired
    private AbResourceMapper resourceMapper;

    @Override
    public UserDetails loadUserByUsername(String username) {
        //获取用户信息
        AbUser abUser = getUserByUsername(username);
        if (abUser != null) {
            List<AbResource> resourceList = getResourceList(abUser.getId());
            return new MyUserDetails(abUser, resourceList); //zznote:AdminUserDetails实现了UserDetails，
        }
        throw new UsernameNotFoundException("用户名或密码错误");//未查询到
    }

    @Override
    public AbUser getUserByUsername(String username) {
        AbUser user = userCacheService.getUser(username);
        if (user != null) return user; //zznote：先去redis上拿，不存在再去访问数据库
        QueryWrapper<AbUser> wrapper = new QueryWrapper<>();//zznote:QueryWrapper mybaits-plus构造器
        wrapper.lambda().eq(AbUser::getUsername, username);//zznote：lambda的表达式 :：
        List<AbUser> adminList = list(wrapper);
        if (adminList != null && adminList.size() > 0) {
            user = adminList.get(0);
            userCacheService.setUser(user);//zznote:查询出来之后放入缓存中
            return user;
        }
        return null;
    }

    @Override
    public List<AbResource> getResourceList(Integer userId) {
        List<AbResource> resourceList = userCacheService.getResourceList(userId);
        if (CollUtil.isNotEmpty(resourceList)) {
            return resourceList;
        }
        resourceList = resourceMapper.getResourceList(userId);
        if (CollUtil.isNotEmpty(resourceList)) {
            userCacheService.setResourceList(userId, resourceList);
        }
        return resourceList;
    }
}
