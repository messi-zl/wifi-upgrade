package com.sim.wifi.upgrade.modules.permissions.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sim.wifi.upgrade.common.exception.Asserts;
import com.sim.wifi.upgrade.domain.MyUserDetails;
import com.sim.wifi.upgrade.modules.permissions.dto.AbUserParam;
import com.sim.wifi.upgrade.modules.permissions.mapper.AbResourceMapper;
import com.sim.wifi.upgrade.modules.permissions.mapper.AbRoleMapper;
import com.sim.wifi.upgrade.modules.permissions.mapper.AbUserRoleMapper;
import com.sim.wifi.upgrade.modules.permissions.model.AbResource;
import com.sim.wifi.upgrade.modules.permissions.model.AbRole;
import com.sim.wifi.upgrade.modules.permissions.model.AbUser;
import com.sim.wifi.upgrade.modules.permissions.mapper.AbUserMapper;
import com.sim.wifi.upgrade.modules.permissions.model.AbUserRole;
import com.sim.wifi.upgrade.modules.permissions.service.AbResourceService;
import com.sim.wifi.upgrade.modules.permissions.service.AbRoleService;
import com.sim.wifi.upgrade.modules.permissions.service.AbUserCacheService;
import com.sim.wifi.upgrade.modules.permissions.service.AbUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sim.wifi.upgrade.security.util.JwtTokenUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author zl
 * @since 2021-06-22
 */
@Transactional
@Service
public class AbUserServiceImpl extends ServiceImpl<AbUserMapper, AbUser> implements AbUserService {
    private static final Logger logger = LoggerFactory.getLogger(AbUserServiceImpl.class);

    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private AbUserCacheService userCacheService;
    @Autowired
    private AbRoleMapper roleMapper;
    @Autowired
    private AbUserRoleMapper userRoleMapper;
    @Autowired
    private JwtTokenUtil jwtTokenUtil;
    @Autowired
    private AbResourceService resourceService;

    @Override
    public UserDetails loadUserByUsername(String username) {
        //获取用户信息
        AbUser abUser = getUserByUsername(username);
        if (abUser != null) {
            List<AbResource> resourceList = resourceService.getResourceList(abUser.getId());
            return new MyUserDetails(abUser, resourceList);
        }
        throw new UsernameNotFoundException("用户名或密码错误");
    }

    @Override
    public AbUser getUserByUsername(String username) {
        AbUser user = userCacheService.getUser(username);
        user = null;
        if (user != null) return user;
        QueryWrapper<AbUser> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(AbUser::getUsername, username);
        List<AbUser> adminList = list(wrapper);
        if (adminList != null && adminList.size() > 0) {
            user = adminList.get(0);
            //userCacheService.setUser(user);
            return user;
        }
        return null;
    }


    @Override
    public AbUser register(AbUserParam abUserParm) {
        logger.info("开始注册！！！");
        AbUser user = new AbUser();
        BeanUtils.copyProperties(abUserParm, user);
        user.setActive(true);
        //查询是否有相同用户名的用户
        QueryWrapper<AbUser> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(AbUser::getUsername,user.getUsername());
        List<AbUser> userList = list(wrapper);
        if (userList.size() > 0) {
            logger.error("Abuser中已经有了用户名："+user.getUsername());
            return null;
        }
        //将密码进行加密操作
        String encodePassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(encodePassword);
        baseMapper.insert(user);
        //往角色表插入默认数据
        AbUserRole userRole = new AbUserRole();
        userList = list(wrapper);
        AbRole role = new AbRole();
        role.setId(userList.get(0).getId());
        role.setName(user.getUsername());
        roleMapper.insert(role);
        //往用户与角色对应表插入默认数据
        QueryWrapper<AbRole> wrapper2 = new QueryWrapper<>();
        wrapper2.lambda().eq(AbRole::getName,role.getName());
        List<AbRole> roleList = roleMapper.selectList(wrapper2);
        userRole.setUserId(userList.get(0).getId());
        userRole.setRoleId(roleList.get(0).getId());
        userRole.setId(userList.get(0).getId());
        userRoleMapper.insert(userRole);
        logger.info("注册成功！！！");
        return user;
    }

    @Override
    public String login(String username, String password) {
        logger.info("开始login");
        String token = null;
        //密码需要客户端加密后传递
        try {
            UserDetails userDetails = loadUserByUsername(username);
            if(!passwordEncoder.matches(password,userDetails.getPassword())){
                Asserts.fail("密码不正确");
            }
            if(!userDetails.isEnabled()){
                Asserts.fail("帐号已被禁用");
            }
            UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
            SecurityContextHolder.getContext().setAuthentication(authentication);
            token = jwtTokenUtil.generateToken(userDetails);
//            updateLoginTimeByUsername(username);
//            insertLoginLog(username);
        } catch (AuthenticationException e) {
            logger.warn("登录异常:{}", e.getMessage());
        }
        logger.info("login完毕,返回token");
        return token;
    }
}
