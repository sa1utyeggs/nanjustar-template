package com.nanjustar.common.exception;

import com.nanjustar.common.enums.HttpResponseEnum;
import lombok.Getter;

@Getter
public class NanjustarException extends RuntimeException{

    /**
     * 状态码
     */
    private Integer code = HttpResponseEnum.FAIL.getCode();

    /**
     * 返回信息
     */
    private final String message;

    /**
     * 错误信息设置
     * @param message 信息
     */
    public NanjustarException(String message) {
        this.message = message;
    }

    /**
     * 枚举填充异常信息
     * @param httpResponseEnum 枚举信息
     */
    public NanjustarException(HttpResponseEnum httpResponseEnum) {
        this.code = httpResponseEnum.getCode();
        this.message = httpResponseEnum.getMessage();
    }
}
