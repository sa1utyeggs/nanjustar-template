package com.nanjustar.api.moudle.system.vo;

import com.nanjustar.common.core.page.PageVo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OptLogVo extends PageVo {

    /**
     * 日志信息
     */
    private String optLogName;

}
