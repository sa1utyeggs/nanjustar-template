package com.nanjustar.business.business.security;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.nanjustar.api.moudle.security.api.MenuRoleService;
import com.nanjustar.api.moudle.security.entity.MenuRole;
import com.nanjustar.mapper.mapper.security.MenuRoleMapper;
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
public class MenuRoleServiceImpl extends ServiceImpl<MenuRoleMapper, MenuRole> implements MenuRoleService {

}
