package com.nanjustar.web.controller.system;


import com.nanjustar.api.moudle.system.api.OptLogService;
import com.nanjustar.api.moudle.system.dto.OptLogBackDto;
import com.nanjustar.api.moudle.system.vo.OptLogVo;
import com.nanjustar.common.result.PageResult;
import com.nanjustar.common.result.ResponseResult;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author nanjustar
 * @since 2021-11-13
 */
@RestController
public class OptLogController {

    @Autowired
    private OptLogService optLogService;

    /**
     * 查询日志信息
     * @param optLogVo 日志信息vo类
     * @return {@link OptLogBackDto} 日志信息类
     */
    @ApiOperation(value = "查询日志信息")
    @GetMapping("/optLog/listOptLogs")
    public ResponseResult<PageResult<OptLogBackDto>> listOptLogs(OptLogVo optLogVo){
        return ResponseResult.success("日志信息查询成功！",optLogService.listOptLogs(optLogVo));
    }

    /**
     * 删除日志信息
     * @param id 日志id
     * @return 日志删除结果
     */
    @ApiOperation(value = "删除日志信息")
    @DeleteMapping("/optlog/deleteLog/{id}")
    public ResponseResult<String> deleteOptLog(@PathVariable Integer id){
        optLogService.deleteOptLog(id);
        return ResponseResult.success("日志信息删除成功！");
    }

    /**
     * 批量删除日志信息
     * @param idList id集合
     * @return 日志批量删除结果
     */
    @ApiOperation(value = "删除日志信息")
    @DeleteMapping("/optlog/deleteLogs")
    public ResponseResult<String> deleteOptLogs(@RequestParam List<Integer> idList){
        optLogService.deleteOptLogs(idList);
        return ResponseResult.success("日志信息删除成功！");
    }

}

