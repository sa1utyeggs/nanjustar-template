package com.nanjustar.api.moudle.security.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MenuVo {

    @NotBlank(message = "菜单名不能为空！")
    @ApiModelProperty(value = "菜单名称", name = "menuName", required = true, dataType = "String")
    private String menuName;

    @NotBlank(message = "菜单路由不能为空！")
    @ApiModelProperty(value = "路由地址", name = "path", required = true, dataType = "String")
    private String path;

    @NotBlank(message = "组件名称不能为空！")
    @ApiModelProperty(value = "组件名称", name = "component", required = true, dataType = "String")
    private String component;

    @NotBlank(message = "菜单图标不能为空！")
    @ApiModelProperty(value = "菜单图标", name = "icon", required = true, dataType = "String")
    private String icon;

    @NotEmpty(message = "菜单排序不能为空！")
    @ApiModelProperty(value = "菜单排序", name = "orderNum", required = true, dataType = "Integer")
    private Integer orderNum;

    @NotBlank(message = "菜单父级id不能为空！")
    @ApiModelProperty(value = "父级菜单id",name = "parentId",dataType = "parentId")
    private Integer parentId;

    @ApiModelProperty(value = "菜单显示状态（0正常 1隐藏）",name = "isHidden",required = true,dataType = "Boolean")
    private Boolean isHidden;
}
