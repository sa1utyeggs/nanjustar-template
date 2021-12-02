package com.nanjustar.business.business.security;


import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.nanjustar.api.moudle.security.api.ConsumerService;
import com.nanjustar.api.moudle.security.entity.Consumer;
import com.nanjustar.api.moudle.security.vo.LoginVo;
import com.nanjustar.mapper.mapper.security.ConsumerMapper;
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
public class ConsumerServiceImpl extends ServiceImpl<ConsumerMapper, Consumer> implements ConsumerService {

    @Override
    public String userLogin(LoginVo loginVo) {
        System.out.println(loginVo);
        System.out.println(loginVo.getUsername());
        System.out.println(loginVo.getPassword());
        System.out.println(loginVo.getCaptcha());
        return null;
    }
}
