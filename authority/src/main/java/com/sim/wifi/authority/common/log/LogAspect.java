package com.sim.wifi.authority.common.log;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONUtil;
import com.sim.wifi.authority.permission.model.OperationLogs;
import com.sim.wifi.authority.permission.service.OperationLogsService;
import io.swagger.annotations.ApiOperation;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description: 日志
 * @CreateBy: li.zheng871@sim.com
 * @DateTime: 2021/7/9
 */
@Aspect
@Component
@Order(0)
public class LogAspect {
    private static final Logger logger = LoggerFactory.getLogger(LogAspect.class);
    @Autowired
    private OperationLogsService operationLogsService;

    @Pointcut("@annotation(com.sim.wifi.authority.common.log.CustomOperationLog)")
    public void pointCutPlace() {
    }

    @Before("pointCutPlace()")
    public void doBefore(JoinPoint joinPoint) throws Throwable {
    }


    @Around("pointCutPlace()")
    public Object doAround(ProceedingJoinPoint joinPoint) throws Throwable {
        //日志记录
        OperationLogs operationLog = new OperationLogs();
        long startTime = System.currentTimeMillis();
        Object result = joinPoint.proceed();
        long endTime = System.currentTimeMillis();
        operationLog.setDurationMs((int) (endTime - startTime));
        operationLog = getOperationLogs(operationLog, joinPoint);
        logger.info("操作日志{}", JSONUtil.parse(operationLog));
        operationLogsService.save(operationLog);//success
        return result;
    }


    @After("pointCutPlace()")
    public void doAfter(JoinPoint joinPoint) {
    }

    @AfterReturning(value = "pointCutPlace()", returning = "myResult")
    public void doAfterReturning(Object myResult) throws Throwable {
    }


    @AfterThrowing(pointcut = "pointCutPlace()", throwing = "myEx")
    public void afterThrowing(JoinPoint joinPoint, Throwable myEx) {
        //主要是为解决执行方法时出现运行时异常时导致在环绕体无法保存
        Signature signature = joinPoint.getSignature();
        logger.info("执行方法{}出错，异常为：{}", signature.getName(), myEx);
        OperationLogs operationLog = new OperationLogs();
        operationLog = getOperationLogs(operationLog, joinPoint);
        logger.info("操作日志{}", JSONUtil.parse(operationLog));
        operationLogsService.save(operationLog);
    }


    /**
     * @param
     * @return
     * @Description :为OperationLogs赋值
     * @Date 2021/7/12
     **/
    public OperationLogs getOperationLogs(OperationLogs operationLog, JoinPoint joinPoint) {
        //获取当前请求对象
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        //记录请求信息
        Signature signature = joinPoint.getSignature();//签名
        MethodSignature methodSignature = (MethodSignature) signature;
        Method method = methodSignature.getMethod();
        if (method.isAnnotationPresent(ApiOperation.class)) {
            ApiOperation apiOperation = method.getAnnotation(ApiOperation.class);
            operationLog.setDescription(apiOperation.value());
        }
        operationLog.setCreatedOn(DateUtil.parse(DateUtil.now()));
        operationLog.setIpAddr(request.getRemoteAddr());
        //operationLog.setIpAddr(getIp(request));
        operationLog.setAction(signature.getName());
        Object jsonParameter = getParameter(method, joinPoint.getArgs());
        if (StrUtil.isEmptyIfStr(jsonParameter)) {
            jsonParameter = "";
        }
        operationLog.setJson(jsonParameter.toString());
        //operationLog.setRequestPath(request.getRequestURL().toString());
        operationLog.setRequestPath(request.getRequestURI());
        operationLog.setCreatedBy(8888);//todo 对应的操作人id
        return operationLog;
    }


    /**
     * 根据方法和传入的参数获取请求参数
     */
    private Object getParameter(Method method, Object[] args) {
        List<Object> argList = new ArrayList<>();
        Parameter[] parameters = method.getParameters();
        for (int i = 0; i < parameters.length; i++) {
            //将RequestBody注解修饰的参数作为请求参数
            RequestBody requestBody = parameters[i].getAnnotation(RequestBody.class);
            if (requestBody != null) {
                argList.add(args[i]);
            }
            //将RequestParam注解修饰的参数作为请求参数
            RequestParam requestParam = parameters[i].getAnnotation(RequestParam.class);
            if (requestParam != null) {
                Map<String, Object> map = new HashMap<>();
                String key = parameters[i].getName();
                if (!StringUtils.isEmpty(requestParam.value())) {
                    key = requestParam.value();
                }
                map.put(key, args[i]);
                argList.add(map);
            }
        }
        if (argList.size() == 0) {
            return null;
        } else if (argList.size() == 1) {
            return argList.get(0);
        } else {
            return argList;
        }
    }

    /**
     * @param request
     * @return java.lang.String
     * @Description 得到真实ip
     * @Date 2021/7/12
     **/
    public static String getIp(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");
        if (StrUtil.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)) {
            //多次反向代理后会有多个ip值，第一个ip才是真实ip
            int index = ip.indexOf(",");
            if (index != -1) {
                return ip.substring(0, index);
            } else {
                return ip;
            }
        }
        ip = request.getHeader("X-Real-IP");
        if (StrUtil.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)) {
            return ip;
        }
        return request.getRemoteAddr();
    }
}
