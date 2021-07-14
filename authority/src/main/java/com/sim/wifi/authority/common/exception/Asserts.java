package com.sim.wifi.authority.common.exception;


import com.sim.wifi.authority.common.api.IErrorCode;

/**
 * description: 断言处理类，用于抛出各种API异常
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
public class Asserts {
    public static void fail(String message) {
        throw new ApiException(message);
    }

    public static void fail(IErrorCode errorCode) {
        throw new ApiException(errorCode);
    }
}
