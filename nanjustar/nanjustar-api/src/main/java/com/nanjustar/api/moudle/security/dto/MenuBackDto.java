package com.nanjustar.api.moudle.security.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MenuBackDto {

    /**
     * 菜单主键
     */
    private Integer menuId;

    /**
     * 菜单名称
     */
    private String menuName;

    /**
     * 路由地址
     */
    private String path;

    /**
     * 组件名称
     */
    private String component;

    /**
     * 菜单图标
     */
    private String icon;

    /**
     * 菜单排序
     */
    private Integer orderNum;

    /**
     * 菜单显示状态（0正常 1隐藏）
     */
    private Boolean isHidden;

    /**
     * 菜单禁用状态（0正常 1禁用）
     */
    private Boolean isDisable;

    /**
     * 创建者
     */
    private String createBy;

    /**
     * 创建日志
     */
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date gmtCreate;

    /**
     * 修改者
     */
    private String updateBy;

    /**
     * 修改时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date gmtUpdate;

    /**
     * 备注信息
     */
    private String remark;

    /**
     * 是否含有子菜单
     */
    private Boolean hasChildren;
}
