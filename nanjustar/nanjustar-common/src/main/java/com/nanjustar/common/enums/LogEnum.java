package com.nanjustar.common.enums;

public enum LogEnum {
    LOG_TYPE_QUERY(0,"查询"),
    LOG_TYPE_SAVE(1, "新增"),
    LOG_TYPE_UPDATE(2, "修改"),
    LOG_TYPE_DELETE(3, "删除"),
    LOG_TYPE_UPLOAD(4, "上传");

    private final Integer optCode;

    private final String optName;

    LogEnum(Integer optCode, String optName) {
        this.optCode = optCode;
        this.optName = optName;
    }

    /**
     * 获取日志类型信息
     *
     * @param optCode 日志码
     * @return 日志类型
     */
    public static String getOptLogNameByCode(Integer optCode) {
        LogEnum[] logEnums = values();
        for (LogEnum logEnum : logEnums) {
            if (logEnum.getOptCode().equals(optCode)) {
                return logEnum.getOptName();
            }
        }
        return null;
    }

    public Integer getOptCode() {
        return optCode;
    }

    public String getOptName() {
        return optName;
    }
}
