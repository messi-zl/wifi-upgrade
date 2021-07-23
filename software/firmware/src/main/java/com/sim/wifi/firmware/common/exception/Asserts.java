package com.sim.wifi.firmware.common.exception;

import com.sim.wifi.firmware.common.api.IErrorCode;

/**
 * 断言处理类，用于抛出各种API异常
 */
public class Asserts {

    public static void fail(String message) {
        throw new ApiException(message);
    }

    public static void fail(IErrorCode errorCode) {
        throw new ApiException(errorCode);
    }

}
