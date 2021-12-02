package com.nanjustar.business.business.system;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.nanjustar.api.moudle.system.api.OptLogService;
import com.nanjustar.api.moudle.system.dto.OptLogBackDto;
import com.nanjustar.api.moudle.system.entity.OptLog;
import com.nanjustar.api.moudle.system.vo.OptLogVo;
import com.nanjustar.common.constant.ServiceErrorConst;
import com.nanjustar.common.enums.LogEnum;
import com.nanjustar.common.exception.NanjustarException;
import com.nanjustar.common.result.PageResult;
import com.nanjustar.common.utils.AssertUtil;
import com.nanjustar.common.utils.BeanCopyUtil;
import com.nanjustar.mapper.mapper.system.OptLogMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author nanjustar
 * @since 2021-11-13
 */
@Service
public class OptLogServiceImpl extends ServiceImpl<OptLogMapper, OptLog> implements OptLogService {

    @Override
    public PageResult<OptLogBackDto> listOptLogs(OptLogVo optLogVo) {
        /*------------------------  开始查询日志信息  -----------------------------*/
        Page<OptLog> optLogPage = baseMapper.selectPage(new Page<>(optLogVo.getCurrent(), optLogVo.getSize()),
                new LambdaQueryWrapper<OptLog>()
                        .like(AssertUtil.isNotEmpty(optLogVo.getOptLogName()), OptLog::getOptName, optLogVo.getOptLogName())
                        .orderByDesc(OptLog::getOptTime));
        /*------------------------  查询日志信息完成  -----------------------------*/
        /*------------------------  数据转换开始  -----------------------------*/
        List<OptLogBackDto> list = new ArrayList<>();
        optLogPage.getRecords().forEach(log -> {
            OptLogBackDto logBackDto = BeanCopyUtil.copyObject(log, OptLogBackDto.class);
            logBackDto.setBusinessType(LogEnum.getOptLogNameByCode(log.getBusinessType()));
            list.add(logBackDto);
        });
        /*------------------------  数据转换完成  -----------------------------*/
        return new PageResult<>(list, optLogPage.getTotal());
    }

    @Transactional(rollbackFor = NanjustarException.class)
    @Override
    public void deleteOptLog(Integer id) {
        /*------------------------  开始删除日志信息  -----------------------------*/
        int delete = baseMapper.deleteById(id);
        AssertUtil.sysIsError(delete == 0, ServiceErrorConst.DELETE_DATA_FAIL);
        /*------------------------  删除日志信息完成  -----------------------------*/
    }

    @Transactional(rollbackFor = NanjustarException.class)
    @Override
    public void deleteOptLogs(List<Integer> idList) {
        /*------------------------  开始批量删除日志信息  -----------------------------*/
        int delete = baseMapper.deleteBatchIds(idList);
        AssertUtil.sysIsError(delete == 0, ServiceErrorConst.DELETE_DATA_FAIL);
        /*------------------------  删除批量日志信息完成  -----------------------------*/
    }
}
