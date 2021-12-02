package com.nanjustar.web.controller.system;


import com.nanjustar.api.moudle.system.api.DictService;
import com.nanjustar.api.moudle.system.dto.DictBackDto;
import com.nanjustar.business.annotation.Log;
import com.nanjustar.common.constant.LogConst;
import com.nanjustar.common.result.ResponseResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author nanjustar
 * @since 2021-11-26
 */
@RestController
@Api(tags = "数据字典模块")
public class DictController {

    @Autowired
    private DictService dictService;

    /**
     * 查询数据字典父级菜单
     *
     * @return {@link DictBackDto}  数据字典信息
     */
    @ApiOperation(value = "查询数据字典父级菜单")
    @GetMapping("/dict/listParentDict")
    public ResponseResult<List<DictBackDto>> listParentDict() {
        return ResponseResult.success("查询数据字典信息成功！", dictService.listParentDict());
    }

    /**
     * 根据父级id查询数据字典信息
     *
     * @param id 父级 id
     * @return {@link DictBackDto} 数据字典信息
     */
    @ApiOperation(value = "根据父级id查询数据字典信息")
    @GetMapping("/dict/listDictById/{id}")
    public ResponseResult<List<DictBackDto>> listDictById(@PathVariable Integer id) {
        return ResponseResult.success("查询数据字典信息成功！", dictService.listDictById(id));
    }

    /**
     * 查询图标列表信息
     *
     * @return 图标列表信息
     */
    @ApiOperation(value = "查询图标列表信息")
    @GetMapping("/dict/listIcon")
    public ResponseResult<List<DictBackDto>> listIconDict() {
        return ResponseResult.success("查询图标列表信息成功", dictService.listIconDict());
    }


}

