package com.nanjustar.mapper.utils;

import com.nanjustar.api.moudle.security.dto.ConsumerDetailDto;
import org.springframework.security.core.context.SecurityContextHolder;

public class ConsumerUtil {

    /**
     * 获取当前登陆用户信息
     * @return 用户信息
     */
    public static ConsumerDetailDto getUserDetails() {
        return (ConsumerDetailDto) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }


}
