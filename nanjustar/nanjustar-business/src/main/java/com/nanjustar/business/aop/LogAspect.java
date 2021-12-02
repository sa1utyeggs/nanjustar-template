package com.nanjustar.business.aop;

import com.alibaba.fastjson.JSON;
import com.nanjustar.api.moudle.system.entity.OptLog;
import com.nanjustar.business.annotation.Log;
import com.nanjustar.common.constant.ServiceErrorConst;
import com.nanjustar.common.exception.NanjustarException;
import com.nanjustar.common.utils.AssertUtil;
import com.nanjustar.common.utils.IpUtils;
import com.nanjustar.mapper.mapper.system.OptLogMapper;
import com.nanjustar.mapper.utils.ConsumerUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.Objects;

@Aspect
@Component
public class LogAspect {

    private Logger logger = LoggerFactory.getLogger(LogAspect.class);

    @Autowired
    private OptLogMapper optLogMapper;

    /**
     * 日志切入点
     */
    @Pointcut("@annotation(com.nanjustar.business.annotation.Log)")
    public void logPointCut() {
    }

    @Transactional(rollbackFor = NanjustarException.class)
    @AfterReturning(value = "logPointCut()", returning = "response")
    public void saveOptLog(JoinPoint joinPoint, Object response) {
        // 获取RequestAttributes
        RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
        // 从获取RequestAttributes中获取HttpServletRequest的信息
        HttpServletRequest request = (HttpServletRequest) Objects.requireNonNull(requestAttributes).resolveReference(RequestAttributes.REFERENCE_REQUEST);
        // 从切面织入点处通过反射机制获取织入点处的方法
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        // 获取切入点所在的方法
        Method method = signature.getMethod();
        // 获取操作
        Api api = (Api) signature.getDeclaringType().getAnnotation(Api.class);
        ApiOperation apiOperation = method.getAnnotation(ApiOperation.class);
        Log log = method.getAnnotation(Log.class);

        // 获取类名
        String className = joinPoint.getTarget().getClass().getName();
        String name = method.getName();
        String methodName = className + "." + name;

        /*------------------------  数据封装  -----------------------------*/
        OptLog optLog = OptLog.builder()
                .title(api.tags()[0])
                .businessType(log.logType())
                .methodName(apiOperation.value())
                .methodUrl(methodName)
                .requestType(Objects.requireNonNull(request).getMethod())
                .optUrl(request.getRequestURI())
                .optName(ConsumerUtil.getUserDetails().getNickname())
                .optIp(IpUtils.getIpAddress(request))
                .optAddress(IpUtils.getIpSource(IpUtils.getIpAddress(request)))
                .requestParam(JSON.toJSONString(joinPoint.getArgs()))
                .responseData(JSON.toJSONString(response))
                .optTime(new Date())
                .build();

        int insert = optLogMapper.insert(optLog);
        AssertUtil.sysIsError(insert == 0, ServiceErrorConst.SAVE_DATA_FAIL);
    }

}
