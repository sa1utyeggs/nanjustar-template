package com.nanjustar.common.exception;

import com.nanjustar.common.enums.HttpResponseEnum;
import com.nanjustar.common.result.ResponseResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 异常处理 配置
 */
@ControllerAdvice
public class GlobalException {

    @ResponseBody
    @ExceptionHandler(Exception.class)
    public ResponseResult globalException(Exception e) {
        e.printStackTrace();
        return ResponseResult.fail(HttpResponseEnum.SYSTEM_ERROR);
    }

    /**
     * 自定义异常
     * @param nanjustarException 自定义异常
     * @return
     */
    @ResponseBody
    @ExceptionHandler(NanjustarException.class)
    public ResponseResult OMException(NanjustarException nanjustarException) {
        nanjustarException.printStackTrace();
        return ResponseResult.fail(nanjustarException.getCode(), nanjustarException.getMessage());
    }
}
