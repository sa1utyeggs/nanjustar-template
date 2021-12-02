package com.nanjustar.common.core.controller;

import com.nanjustar.common.result.ResponseResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BseController {

    private static final String MESSAGE = "欢迎使用  楠橘星 后台管理系统！进入 www.nanjustar.top 了解更多信息！";

    @GetMapping("/")
    public ResponseResult hello() {
        return ResponseResult.success(MESSAGE);
    }

}
