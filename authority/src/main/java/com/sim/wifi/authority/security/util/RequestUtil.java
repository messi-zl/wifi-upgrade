package com.sim.wifi.authority.security.util;

import com.sim.wifi.authority.common.exception.ApiException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Enumeration;

/**
 * @Description: 请求头加载用户
 * @CreateBy: li.zheng871@sim.com
 * @DateTime: 2021/8/2
 */
@Component
public class RequestUtil {
    private static String userInfoHead;

    @Value("${jwt.userInfoHead}")
    public void setUserInfoHead(String userInfoHead) {
        RequestUtil.userInfoHead = userInfoHead;
    }


    public static String getUserInfo() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String username = null;

        try {
            username = URLDecoder.decode(request.getHeader(userInfoHead), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        if (username == null) throw new ApiException("由网关获取用户名出错！");
        return username;
    }


    public void getAllHeader() {
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
    }
}
