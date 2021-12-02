package com.nanjustar.business.business.system;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.nanjustar.api.moudle.system.api.OptLogService;
import com.nanjustar.api.moudle.system.entity.OptLog;
import com.nanjustar.mapper.mapper.system.OptLogMapper;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author nanjustar
 * @since 2021-11-13
 */
@Service
public class OptLogServiceImpl extends ServiceImpl<OptLogMapper, OptLog> implements OptLogService {

}
