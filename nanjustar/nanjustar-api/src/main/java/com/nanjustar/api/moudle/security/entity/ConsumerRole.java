package com.nanjustar.api.moudle.security.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
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
 * @since 2021-11-13
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("njs_consumer_role")
@ApiModel(value="ConsumerRole对象", description="")
public class ConsumerRole extends Model<ConsumerRole> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "关联表主键")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "用户主键")
    private Integer consumerId;

    @ApiModelProperty(value = "角色主键")
    private Integer roleId;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
