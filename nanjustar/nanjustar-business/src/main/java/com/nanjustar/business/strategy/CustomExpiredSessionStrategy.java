package com.nanjustar.business.strategy;

import com.alibaba.fastjson.JSON;
import com.nanjustar.common.enums.HttpResponseEnum;
import com.nanjustar.common.result.ResponseResult;
import org.springframework.security.web.session.SessionInformationExpiredEvent;
import org.springframework.security.web.session.SessionInformationExpiredStrategy;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import java.io.IOException;

@Component
public class CustomExpiredSessionStrategy implements SessionInformationExpiredStrategy {
    @Override
    public void onExpiredSessionDetected(SessionInformationExpiredEvent event) throws IOException, ServletException {
        event.getResponse().setContentType("application/json; charset=UTF-8");
        event.getResponse().getWriter().write(JSON.toJSONString(ResponseResult.success(HttpResponseEnum.USER_LOGIN_IN_OTHER_PLACE)));
    }
}
