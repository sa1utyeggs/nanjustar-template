package com.nanjustar.api.moudle.system.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import java.util.Date;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 
 * </p>
 *
 * @author nanjustar
 * @since 2021-11-26
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("njs_dict")
@ApiModel(value="Dict对象", description="")
public class Dict extends Model<Dict> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    @TableId(value = "dict_id", type = IdType.AUTO)
    private Integer dictId;

    @ApiModelProperty(value = "字典名称")
    private String dictName;

    @ApiModelProperty(value = "编码值")
    private String dictValue;

    @ApiModelProperty(value = "字典唯一编码")
    private String dictCode;

    @ApiModelProperty(value = "字典父级 无父级则为 -1")
    private Integer parentId;

    @ApiModelProperty(value = "创建者")
    @TableField(fill = FieldFill.INSERT)
    private String createBy;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private Date gmtCreate;

    @ApiModelProperty(value = "更新者")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private String updateBy;

    @ApiModelProperty(value = "更新时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date gmtUpdate;


    @Override
    protected Serializable pkVal() {
        return this.dictId;
    }

}
