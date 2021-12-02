package com.nanjustar.api.moudle.system.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class OptLogBackDto {

    /**
     * 日志id
     */
    private Integer optId;

    /**
     * 模块标题
     */
    private String title;

    /**
     * 业务类型（1 新增 2 修改 3 删除 ）
     */
    private String businessType;

    /**
     * 方法描述
     */
    private String methodName;

    /**
     * 方法路径
     */
    private String methodUrl;

    /**
     * 请求方式
     */
    private String requestType;

    /**
     * 操作者
     */
    private String optName;

    /**
     * 请求路径
     */
    private String optUrl;

    /**
     * 操作者ip
     */
    private String optIp;

    /**
     * 操作者地址
     */
    private String optAddress;

    /**
     * 请求参数
     */
    private String requestParam;

    /**
     * 返回信息
     */
    private String responseData;

    /**
     * 操作日期
     */
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date optTime;
}
