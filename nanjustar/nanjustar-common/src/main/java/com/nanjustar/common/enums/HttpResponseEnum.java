package com.nanjustar.common.enums;

public enum HttpResponseEnum {
    /**
     * 操作成功
     */
    SUCCESS(20000, "操作成功！"),
    /**
     * 没有操作权限
     */
    AUTHORIZED(40003, "没有操作权限！"),
    /**
     * 系统异常
     */
    SYSTEM_ERROR(50000, "系统异常"),
    /**
     * 操作失败
     */
    FAIL(50000, "操作失败！"),
    /**
     * 参数格式不合法
     */
    VALID_ERROR(52000,"参数格式不合法！"),
    /**
     * 用户名已经存在
     */
    USERNAME_EXIST(52001, "用户名已经存在！"),
    /**
     * 用户未登陆
     */
    PLEASE_LOGIN(52002,"尚未登陆，请登陆！"),
    /**
     * 账号在其他地方登陆，您将被迫下线！
     */
    USER_LOGIN_IN_OTHER_PLACE(55555,"账号在其他地方登陆，您将被迫下线！");

    private final Integer code;
    private final String message;

    HttpResponseEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

    public Integer getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }
}

