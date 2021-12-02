package com.nanjustar.api.moudle.system.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DictBackDto {

    /**
     * 主键
     */
    private Integer dictId;

    /**
     * 字典名称
     */
    private String dictName;

    /**
     * 编码值
     */
    private String dictValue;

    /**
     * 字典唯一编码
     */
    private String dictCode;

    /**
     * 字典父级 无父级则为 -1
     */
    private Integer parentId;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date gmtCreate;

    /**
     * 是否含有子级数据字典
     */
    private Boolean hasChildren;

}
