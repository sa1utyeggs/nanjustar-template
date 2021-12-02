package com.nanjustar.business.annotation;


import java.lang.annotation.*;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Log {

    /**
     * 操作类型
     * @return
     */
    int logType() default 1;

}
