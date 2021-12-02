package com.nanjustar.api.moudle.security.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class MenuConditionVo {

    @ApiModelProperty(value = "菜单名称", name = "menuName", dataType = "String")
    private String menuName;

    @ApiModelProperty(value = "菜单显示状态（0正常 1禁用）",name = "isDisable",dataType = "Boolean")
    private Boolean isDisable;
}
