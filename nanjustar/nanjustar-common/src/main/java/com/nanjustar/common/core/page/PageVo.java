package com.nanjustar.common.core.page;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageVo {

    @NotNull(message = "当前页不能为空！")
    @ApiModelProperty(name = "current", value = "当前页", required = true, dataType = "long", example = "1")
    private long current;

    @NotNull(message = "每页条数信息不能为空！")
    @ApiModelProperty(name = "size", value = "每页条数", required = true, dataType = "long", example = "8")
    private long size;

}
