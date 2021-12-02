package com.nanjustar.common.result;

import io.swagger.annotations.ApiModel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@ApiModel(value = "分页结果集处理器")
@AllArgsConstructor
@NoArgsConstructor
public class PageResult<T> {

    /**
     * 数据列表
     */
    private List<T> data;

    /**
     * 数据总数
     */
    private long total;

}
