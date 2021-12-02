package com.nanjustar.mapper.handler;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.nanjustar.api.moudle.security.dto.ConsumerDetailDto;
import com.nanjustar.mapper.utils.ConsumerUtil;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * 时间信息自动注入
 */
@Component
public class MeatObjectHandlerImpl implements MetaObjectHandler {
    @Override
    public void insertFill(MetaObject metaObject) {
        this.setFieldValByName("gmtCreate", new Date(), metaObject);
        this.setFieldValByName("gmtUpdate", new Date(), metaObject);
        this.setFieldValByName("lastLoginTime", new Date(), metaObject);
        this.setFieldValByName("createBy", ConsumerUtil.getUserDetails().getNickname(), metaObject);
        this.setFieldValByName("updateBy", ConsumerUtil.getUserDetails().getNickname(), metaObject);
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        this.setFieldValByName("gmtUpdate", new Date(), metaObject);
        this.setFieldValByName("updateBy", ConsumerUtil.getUserDetails().getNickname(), metaObject);
    }
}
