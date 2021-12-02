package com.nanjustar.api.moudle.security.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import java.util.Date;
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
@TableName("njs_menu")
@ApiModel(value="Menu对象", description="")
public class Menu extends Model<Menu> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "菜单主键")
    @TableId(value = "menu_id", type = IdType.AUTO)
    private Integer menuId;

    @ApiModelProperty(value = "菜单名称")
    private String menuName;

    @ApiModelProperty(value = "路由地址")
    private String path;

    @ApiModelProperty(value = "组件名称")
    private String component;

    @ApiModelProperty(value = "菜单图标")
    private String icon;

    @ApiModelProperty(value = "菜单排序")
    private Integer orderNum;

    @ApiModelProperty(value = "父级菜单id")
    private Integer parentId;

    @ApiModelProperty(value = "菜单显示状态（0正常 1隐藏）")
    private Boolean isHidden;

    @ApiModelProperty(value = "菜单禁用状态（0正常 1禁用）")
    private Boolean isDisable;

    @ApiModelProperty(value = "删除标识（0 正常。1 删除）")
    private Boolean delFlag;

    @ApiModelProperty(value = "创建者")
    private String createBy;

    @ApiModelProperty(value = "创建日志")
    private Date gmtCreate;

    @ApiModelProperty(value = "修改者")
    private String updateBy;

    @ApiModelProperty(value = "修改时间")
    private Date gmtUpdate;

    @ApiModelProperty(value = "备注信息")
    private String remark;


    @Override
    protected Serializable pkVal() {
        return this.menuId;
    }

}
