package com.sim.wifi.authority.permission.controller;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sim.wifi.authority.common.api.CommonResult;
import com.sim.wifi.authority.common.exception.Asserts;
import com.sim.wifi.authority.common.log.CustomOperationLog;
import com.sim.wifi.authority.permission.model.Permissions;
import com.sim.wifi.authority.permission.service.PermissionsService;
import com.sim.wifi.authority.permission.service.UsersService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.*;

/**
 * @Description:
 * @CreateBy: li.zheng871@sim.com
 * @DateTime: 2021/7/29
 */
@Controller
@Api(tags = "TestController", description = "相关测试")
@RequestMapping("/permission/test")
public class TestController {
    private static final Logger logger = LoggerFactory.getLogger(TestController.class);

    @Value("${jwt.tokenHead}")
    private String tokenHead;
    @Autowired
    private PermissionsService permissionsService;
    @Autowired
    private UsersService usersService;

    @CustomOperationLog
    @ApiOperation("测试gateway网关转发")
    @RequestMapping(value = "/gatewayTest", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<Map<String, Object>> gatewayTest() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        Enumeration u = request.getHeaderNames();
        while (u.hasMoreElements()) {
            String header = (String) u.nextElement();
            try {
                System.out.println(header + ":" + URLDecoder.decode(request.getHeader(header), "UTF-8"));
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        logger.info("开始查询所有权限");
        Map<String, Object> map = permissionsService.listAll();
        logger.info("测试gateway成功");
        return CommonResult.success(map);
    }


    @CustomOperationLog
    @ApiOperation("测试fegin调起")
    @RequestMapping(value = "/feginTest", method = RequestMethod.GET)
    @ResponseBody
    public List<String> feginTest() {
        System.out.printf("yeah我到了");
        List<String> list = Arrays.asList("111", "222", "333");
        return list;
    }

    @CustomOperationLog
    @ApiOperation(value = "登录以后返回token")
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult login(@RequestParam String username, @RequestParam String password) {
        Map<String, String> map = usersService.login(username, password);
        if (map.get("errorMessage") != null) {
            Asserts.fail(map.get("errorMessage"));
        }
        Map<String, String> tokenMap = new HashMap<>();
        tokenMap.put("token", map.get("token"));
        tokenMap.put("tokenHead", tokenHead);
        return CommonResult.success(tokenMap);
    }

    //由token信息及访问的url地址，看其是否具有权限
    @CustomOperationLog
    @ApiOperation("判断用户对某请求是否具有权限")
    @RequestMapping(value = "/judgePermission", method = RequestMethod.GET)
    @ResponseBody
    public boolean judgePermission(@RequestParam String username, @RequestParam String url) {
        System.out.println(username);
        System.out.println(url);
        return getPermission(username, url);
    }


    //判断用户对某请求是否具有权限
    public Boolean getPermission(String username, String url) {
        //all button权限
        QueryWrapper<Permissions> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(Permissions::getType, PermissionsService.TYPE_BUTTON);
        List<Permissions> allButtonPermissionsList = permissionsService.list(wrapper);

        //匹配的
        List<String> matchUrlList = new ArrayList<>();
        PathMatcher pathMatcher = new AntPathMatcher();
        for (Permissions permission : allButtonPermissionsList) {
            String itrUrl = permission.getUrl();
            if (pathMatcher.match(itrUrl, url)) {
                matchUrlList.add(itrUrl);
            }
        }

        //无匹配的，表示对该请求url没有限制，直接放行
        if (CollUtil.isEmpty(matchUrlList)) return true;

        //有匹配的，表示对该请求url进行了限制。那么要去看用户对该url有无权限
        List<Permissions> authList = permissionsService.getPermissionsListByUsername(username, PermissionsService.TYPE_BUTTON);//有权限的
        for (String matchUrl : matchUrlList) {
            for (Permissions permission : authList) {
                String authUrl = permission.getUrl();
                if (matchUrl.trim().equals(authUrl.trim())) return true;
            }
        }
        return false;
    }

    //判断用户对某请求是否具有权限
/*    public Boolean getPermissionTest(String username, String url) {
        Boolean flag = false;
        //得到所有的权限集合map（url，id：name），遍历所有的url，每一个都需要取到，与请求的url进行匹配，匹配到的 value放进一个list里面

        //若list为空的话，放行
        //遍历list，与用户值有相等的，即可放行。找不到，就不允许

        //匹配的   相等的（不能只看是否有相等的。有匹配的说明对该类url进行了限制。没有匹配的说明对该类url没有限制）
        //没有匹配的 放行
        //有匹配的，那么就要有相等的，没有则无权限
        //得到map
        Map<String, ConfigAttribute> map = new ConcurrentHashMap<>();
        QueryWrapper<Permissions> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(Permissions::getType, PermissionsService.TYPE_BUTTON);
        List<Permissions> permissionsList = permissionsService.list(wrapper);
        for (Permissions permission : permissionsList) {
            map.put(permission.getUrl(), new org.springframework.security.access.SecurityConfig(permission.getId() + ":" + permission.getName()));
        }
        //得到list
        List<ConfigAttribute> configAttributes = new ArrayList<>();
        PathMatcher pathMatcher = new AntPathMatcher();
        Iterator<String> iterator = map.keySet().iterator();
        //获取访问该路径所需资源
        while (iterator.hasNext()) {
            String pattern = iterator.next();
            if (pathMatcher.match(pattern, url)) {
                logger.info("当前请求路径={},与configAttributeMap的key值={}，匹配，add all value", url, pattern);
                configAttributes.add(map.get(pattern));
            }
        }

        if (CollUtil.isEmpty(configAttributes)) {
            return true;
        }
        Iterator<ConfigAttribute> iterator2 = configAttributes.iterator();
        while (iterator2.hasNext()) {//与当前请求url匹配的
            ConfigAttribute configAttribute = iterator2.next();
            //将访问所需资源或用户拥有资源进行比对
            String needAuthority = configAttribute.getAttribute();
*//*            for (GrantedAuthority grantedAuthority : authentication.getAuthorities()) {//系统拥有的authorities=该用户所拥有的
                if (needAuthority.trim().equals(grantedAuthority.getAuthority())) {
                    logger.info("configAttributes中有元素={}，与当前用户有权限的元素={}相等，放行", needAuthority.trim(), grantedAuthority.getAuthority());j
                    return true;
                }
            }*//*
        }
*//*        logger.warn("sorry,无权限");
        throw new AccessDeniedException("抱歉小盆友，您没有访问权限");*//*
        return flag;
    }*/
}
