package com.nanjustar.api.moudle.security.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class ConsumerInfoDto {

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 用户账号（第三方token）
     */
    private String username;

    /**
     * 用户昵称
     */
    private String nickname;

    /**
     * 用户头像
     */
    private String avatar;

    /**
     * 用户邮箱
     */
    private String email;

    /**
     * 用户电话
     */
    private String phonenum;

    /**
     * 用户性别
     */
    private String gender;

    /**
     * 登陆类型（1 邮箱 2账号密码 3QQ）
     */
    private String loginType;

    /**
     * 最后登陆时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date lastLoginTime;

    /**
     * 登陆ip
     */
    private String loginIp;

    /**
     * 登陆地区
     */
    private String loginAddress;

    /**
     * 操作系统
     */
    private String os;

    /**
     * 浏览器
     */
    private String browser;

    /**
     * 角色列表
     */
    private List<String> roleList;

    /**
     * 用户登陆
     */
    private String consumerLevel;
}
