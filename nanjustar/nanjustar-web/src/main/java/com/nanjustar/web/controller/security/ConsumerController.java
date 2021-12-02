package com.nanjustar.web.controller.security;

import com.nanjustar.api.moudle.security.dto.ConsumerInfoDto;
import com.nanjustar.mapper.utils.ConsumerUtil;
import com.nanjustar.common.enums.RoleLevelEnum;
import com.nanjustar.common.result.ResponseResult;
import com.nanjustar.common.utils.BeanCopyUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;


/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author nanjustar
 * @since 2021-11-13
 */
@RestController
@Api(tags = "获取用户信息")
public class ConsumerController {

    /**
     * 获取当前用户信息
     *
     * @return {@link ConsumerInfoDto} 当前用户信息
     */
    @ApiOperation(value = "获取用户信息")
    @GetMapping("/getUserInfo")
    public ResponseResult<ConsumerInfoDto> getUserInfo() {
        ConsumerInfoDto consumerInfo = BeanCopyUtil.copyObject(ConsumerUtil.getUserDetails(), ConsumerInfoDto.class);
        consumerInfo.setConsumerLevel(RoleLevelEnum.getGenderNameByCode(consumerInfo.getRoleList()));
        return ResponseResult.success("用户信息获取成功！", consumerInfo);
    }

}

