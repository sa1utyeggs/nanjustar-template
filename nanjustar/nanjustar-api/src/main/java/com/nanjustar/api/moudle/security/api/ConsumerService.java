package com.nanjustar.api.moudle.security.api;

import com.nanjustar.api.moudle.security.entity.Consumer;
import com.baomidou.mybatisplus.extension.service.IService;
import com.nanjustar.api.moudle.security.vo.LoginVo;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author nanjustar
 * @since 2021-11-13
 */
public interface ConsumerService extends IService<Consumer> {

    /**
     * 用户登陆
     * @param loginVo 登陆信息 vo类
     * @return token 值
     */
    String userLogin(LoginVo loginVo);
}
