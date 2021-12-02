package com.nanjustar.business.business.security;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.nanjustar.api.moudle.security.api.ConsumerRoleService;
import com.nanjustar.api.moudle.security.entity.ConsumerRole;
import com.nanjustar.mapper.mapper.security.ConsumerRoleMapper;
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
public class ConsumerRoleServiceImpl extends ServiceImpl<ConsumerRoleMapper, ConsumerRole> implements ConsumerRoleService {

}
