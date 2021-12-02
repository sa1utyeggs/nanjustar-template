package com.nanjustar.business.handler;

import com.alibaba.fastjson.JSON;
import com.nanjustar.api.moudle.security.dto.ConsumerDetailDto;
import com.nanjustar.business.util.ConsumerUtil;
import com.nanjustar.common.constant.SystemConst;
import com.nanjustar.common.result.ResponseResult;
import com.nanjustar.common.utils.JwtTokenUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 用户登陆 成功 处理器
 */
@Component
public class AuthenticationSuccessHandlerImpl implements AuthenticationSuccessHandler {

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        httpServletResponse.setContentType("application/json; charset=UTF-8");
        httpServletResponse.getWriter().write(JSON.toJSONString(ResponseResult.success(SystemConst.LOGIN_SUCCESS, "Bearer " + jwtTokenUtil.generatorToken(ConsumerUtil.getUserDetails()))));
    }
}
