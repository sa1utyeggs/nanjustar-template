package com.nanjustar.api.moudle.system.api;

import com.nanjustar.api.moudle.system.dto.OptLogBackDto;
import com.nanjustar.api.moudle.system.entity.OptLog;
import com.baomidou.mybatisplus.extension.service.IService;
import com.nanjustar.api.moudle.system.vo.OptLogVo;
import com.nanjustar.common.result.PageResult;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author nanjustar
 * @since 2021-11-13
 */
public interface OptLogService extends IService<OptLog> {

    /**
     * 查询日志信息
     * @param optLogVo 日志信息vo类
     * @return {@link OptLogBackDto} 日志信息类
     */
    PageResult<OptLogBackDto> listOptLogs(OptLogVo optLogVo);

    /**
     * 删除日志信息
     * @param id 日志id
     */
    void deleteOptLog(Integer id);

    /**
     * 批量删除日志信息
     * @param idList 日志id集合
     */
    void deleteOptLogs(List<Integer> idList);
}
