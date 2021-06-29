package com.sim.wifi.upgrade.common.exception;


import com.sim.wifi.upgrade.common.api.IErrorCode;

/**
 * description: 自定义API异常
 * create by: li.zheng871@sim.com
 * create time: 2021/6/29
 */
public class ApiException extends RuntimeException {
    private IErrorCode errorCode;

    public ApiException(IErrorCode errorCode) {
        super(errorCode.getMessage());
        this.errorCode = errorCode;
    }

    public ApiException(String message) {
        super(message);
    }

    public ApiException(Throwable cause) {
        super(cause);
    }

    public ApiException(String message, Throwable cause) {
        super(message, cause);
    }

    public IErrorCode getErrorCode() {
        return errorCode;
    }
}
