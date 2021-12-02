package com.nanjustar.web.runner;

import com.nanjustar.api.moudle.redis.RedisCacheBusiness;
import com.nanjustar.api.moudle.system.api.DictService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

/**
 * applicationRunner 实现启动自动执行部分方法
 */
@Component
public class ApplicationRunnerImpl implements ApplicationRunner {

    private Logger logger = LoggerFactory.getLogger(ApplicationRunnerImpl.class);

    @Autowired
    private RedisCacheBusiness redisCacheBusiness;

    @Override
    public void run(ApplicationArguments args) throws Exception {
        logger.info("开始拉取缓存数据！");
        /*------------------------  获取部分redis缓存  -----------------------------*/
        redisCacheBusiness.cacheIconList();
        /*------------------------  获取部分redis缓存  -----------------------------*/

    }
}
