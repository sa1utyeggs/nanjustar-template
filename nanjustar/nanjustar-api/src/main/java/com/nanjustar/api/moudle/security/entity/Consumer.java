package com.nanjustar.api.moudle.security.entity;

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
 * @since 2021-11-13
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("njs_consumer")
@ApiModel(value="Consumer对象", description="")
public class Consumer extends Model<Consumer> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "用户ID")
    @TableId(value = "user_id", type = IdType.AUTO)
    private Long userId;

    @ApiModelProperty(value = "用户账号（第三方token）")
    private String username;

    @ApiModelProperty(value = "用户密码")
    private String password;

    @ApiModelProperty(value = "用户昵称")
    private String nickname;

    @ApiModelProperty(value = "用户头像")
    private String avatar;

    @ApiModelProperty(value = "用户邮箱")
    private String email;

    @ApiModelProperty(value = "用户电话")
    private String phonenum;

    @ApiModelProperty(value = "用户性别")
    private Integer gender;

    @ApiModelProperty(value = "登陆类型（1 邮箱 2账号密码 3QQ）")
    private Integer loginType;

    @ApiModelProperty(value = "最后登陆时间")
    private Date lastLoginTime;

    @ApiModelProperty(value = "登陆ip")
    private String loginIp;

    @ApiModelProperty(value = "登陆地区")
    private String loginAddress;

    @ApiModelProperty(value = "账号状态（0正常 1禁用）")
    private Boolean isDisable;

    @ApiModelProperty(value = "删除标识（0正常 1删除）")
    private Boolean delFlag;

    @ApiModelProperty(value = "创建者")
    @TableField(fill = FieldFill.INSERT)
    private String createBy;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private Date gmtCreate;

    @ApiModelProperty(value = "修改者")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private String updateBy;

    @ApiModelProperty(value = "修改时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date gmtUpdate;

    @ApiModelProperty(value = "备注")
    private String remark;


    @Override
    protected Serializable pkVal() {
        return this.userId;
    }

}
