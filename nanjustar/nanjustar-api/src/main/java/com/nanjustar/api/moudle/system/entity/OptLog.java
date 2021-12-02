package com.nanjustar.api.moudle.system.entity;

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
@TableName("njs_opt_log")
@ApiModel(value="OptLog对象", description="")
public class OptLog extends Model<OptLog> {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "日志id")
      @TableId(value = "opt_id", type = IdType.AUTO)
    private Integer optId;

    @ApiModelProperty(value = "模块标题")
    private String title;

    @ApiModelProperty(value = "业务类型（1 新增 2 修改 3 删除 ）")
    private Boolean businessType;

    @ApiModelProperty(value = "方法路径")
    private String methodUrl;

    @ApiModelProperty(value = "请求方式")
    private String requestType;

    @ApiModelProperty(value = "操作者")
    private String optName;

    @ApiModelProperty(value = "请求路径")
    private String optUrl;

    @ApiModelProperty(value = "操作者ip")
    private String optIp;

    @ApiModelProperty(value = "操作者地址")
    private String optAddress;

    @ApiModelProperty(value = "请求参数")
    private String requestParam;

    @ApiModelProperty(value = "返回信息")
    private String responseData;

    @ApiModelProperty(value = "错误信息")
    private String errorMsg;

    @ApiModelProperty(value = "操作状态（0正常 1错误）")
    private Boolean status;

    @ApiModelProperty(value = "操作日期")
    private Date optTime;


    @Override
    protected Serializable pkVal() {
        return this.optId;
    }

}
