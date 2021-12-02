package com.nanjustar.business.handler;

import com.alibaba.fastjson.JSON;
import com.nanjustar.common.constant.SystemConst;
import com.nanjustar.common.enums.HttpResponseEnum;
import com.nanjustar.common.result.ResponseResult;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 退出 成功 处理器
 */
@Component
public class LogoutSuccessHandlerImpl implements LogoutSuccessHandler {
    @Override
    public void onLogoutSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        httpServletResponse.setContentType("application/json; charset=UTF-8");
        httpServletResponse.getWriter().write(JSON.toJSONString(ResponseResult.success(SystemConst.LOGOUT_SUCCESS)));
    }
}
