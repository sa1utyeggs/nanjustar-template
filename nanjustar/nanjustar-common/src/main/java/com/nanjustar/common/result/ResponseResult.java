package com.nanjustar.common.result;

import com.nanjustar.common.enums.HttpResponseEnum;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@ApiModel("统一结果集处理器")
public class ResponseResult<T> {

    /**
     * 状态码
     */
    @ApiModelProperty(value = "状态码")
    private Integer code;

    /**
     * 状态信息
     */
    @ApiModelProperty(value = "状态信息")
    private Boolean status;

    /**
     * 返回信息
     */
    @ApiModelProperty(value = "返回信息")
    private String message;

    /**
     * 数据
     */
    @ApiModelProperty(value = "数据")
    private T data;

    /**
     *  全参数方法
     * @param code 状态码
     * @param status 状态
     * @param message 返回信息
     * @param data 返回数据
     * @param <T> 泛型
     * @return {@link ResponseResult<T>}
     */
    private static <T> ResponseResult<T> response(Integer code, Boolean status, String message, T data) {
        ResponseResult<T> responseResult = new ResponseResult<>();
        responseResult.setCode(code);
        responseResult.setStatus(status);
        responseResult.setMessage(message);
        responseResult.setData(data);
        return responseResult;
    }

    /**
     *  全参数方法
     * @param code 状态码
     * @param status 状态
     * @param message 返回信息
     * @param <T> 泛型
     * @return {@link ResponseResult<T>}
     */
    private static <T> ResponseResult<T> response(Integer code, Boolean status, String message) {
        ResponseResult<T> responseResult = new ResponseResult<>();
        responseResult.setCode(code);
        responseResult.setStatus(status);
        responseResult.setMessage(message);
        return responseResult;
    }

    /**
     * 成功返回（无参）
     * @param <T> 泛型
     * @return {@link ResponseResult<T>}
     */
    public static <T> ResponseResult<T> success() {
        return response(HttpResponseEnum.SUCCESS.getCode(), true, HttpResponseEnum.SUCCESS.getMessage(), null);
    }

    /**
     * 成功返回（枚举参数）
     * @param httpResponseEnum 枚举参数
     * @param <T> 泛型
     * @return {@link ResponseResult<T>}
     */
    public static <T> ResponseResult<T> success(HttpResponseEnum httpResponseEnum) {
        return response(httpResponseEnum.getCode(), true, httpResponseEnum.getMessage());
    }

    /**
     * 成功返回（状态码+返回信息）
     * @param code 状态码
     * @param message 返回信息
     * @param <T> 泛型
     * @return {@link ResponseResult<T>}
     */
    public static <T> ResponseResult<T> success(Integer code, String message) {
        return response(code, true, message);
    }

    /**
     * 成功返回（返回信息 + 数据）
     * @param message 返回信息
     * @param data 数据
     * @param <T> 泛型
     * @return {@link ResponseResult<T>}
     */
    public static <T> ResponseResult<T> success(String message, T data) {
        return response(HttpResponseEnum.SUCCESS.getCode(), true, message, data);
    }

    /**
     * 成功返回（状态码+返回信息+数据）
     * @param code 状态码
     * @param message 返回信息
     * @param data 数据
     * @param <T> 泛型
     * @return {@link ResponseResult<T>}
     */
    public static <T> ResponseResult<T> success(Integer code, String message, T data) {
        return response(code, true, message, data);
    }

    /**
     * 成功返回（数据）
     * @param data 数据
     * @param <T> 泛型
     * @return {@link ResponseResult<T>}
     */
    public static <T> ResponseResult<T> success(T data) {
        return response(HttpResponseEnum.SUCCESS.getCode(), true, HttpResponseEnum.SUCCESS.getMessage(), data);
    }

    /**
     * 失败返回（无参）
     * @param <T> 泛型
     * @return {@link ResponseResult<T>}
     */
    public static <T> ResponseResult<T> fail() {
        return response(HttpResponseEnum.FAIL.getCode(), false, HttpResponseEnum.FAIL.getMessage(), null);
    }

    /**
     *  失败返回（枚举）
     * @param httpResponseEnum 枚举
     * @param <T> 泛型
     * @return {@link ResponseResult<T>}
     */
    public static <T> ResponseResult<T> fail(HttpResponseEnum httpResponseEnum) {
        return response(httpResponseEnum.getCode(), false, httpResponseEnum.getMessage());
    }

    /**
     *  失败返回（状态码+返回信息）
     * @param code 状态码
     * @param message 返回信息
     * @param <T> 泛型
     * @return {@link ResponseResult<T>}
     */
    public static <T> ResponseResult<T> fail(Integer code, String message) {
        return response(code, false, message);
    }

    /**
     *  失败返回（返回信息+数据）
     * @param message 返回信息
     * @param data 数据
     * @param <T> 泛型
     * @return {@link ResponseResult<T>}
     */
    public static <T> ResponseResult<T> fail(String message, T data) {
        return response(HttpResponseEnum.FAIL.getCode(), false, message, data);
    }

    /**
     *  失败返回（状态码+返回信息+数据）
     * @param code 状态码
     * @param message 返回消息
     * @param data 数据
     * @param <T> 泛型
     * @return {@link ResponseResult<T>}
     */
    public static <T> ResponseResult<T> fail(Integer code, String message, T data) {
        return response(code, false, message, data);
    }

    /**
     *  失败返回（数据）
     * @param data 数据
     * @param <T> 泛型
     * @return {@link ResponseResult<T>}
     */
    public static <T> ResponseResult<T> fail(T data) {
        return response(HttpResponseEnum.FAIL.getCode(), false, HttpResponseEnum.FAIL.getMessage(), data);
    }
}
