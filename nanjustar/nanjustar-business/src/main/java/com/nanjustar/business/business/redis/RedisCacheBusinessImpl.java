package com.nanjustar.business.business.redis;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.nanjustar.api.moudle.redis.RedisCacheBusiness;
import com.nanjustar.api.moudle.system.dto.DictBackDto;
import com.nanjustar.api.moudle.system.entity.Dict;
import com.nanjustar.common.constant.CommonConst;
import com.nanjustar.common.constant.RedisConst;
import com.nanjustar.common.core.redis.RedisCache;
import com.nanjustar.common.utils.AssertUtil;
import com.nanjustar.common.utils.BeanCopyUtil;
import com.nanjustar.mapper.mapper.system.DictMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RedisCacheBusinessImpl implements RedisCacheBusiness {

    @Autowired
    private RedisCache redisCache;
    @Autowired
    private DictMapper dictMapper;

    @Override
    public void cacheIconList() {
        /*------------------------  检查redis中是否含有数据开始  -----------------------------*/
        List<DictBackDto> dictCache = redisCache.getCacheList(RedisConst.DICT_ICON_LIST);
        if (AssertUtil.isNotEmpty(dictCache)) {
            return;
        }
        /*------------------------  检查redis中是否含有数据完成  -----------------------------*/
        /*------------------------  开始查询图标信息  -----------------------------*/
        Dict dict = dictMapper.selectOne(new LambdaQueryWrapper<Dict>()
                .eq(Dict::getDictCode, CommonConst.DICT_ICON_CODE));
        List<Dict> dicts = dictMapper.selectList(new LambdaQueryWrapper<Dict>()
                .eq(Dict::getParentId, dict.getDictId()));
        /*------------------------  查询图标信息完成  -----------------------------*/
        /*------------------------  存储图标信息开始  -----------------------------*/
        redisCache.setCacheList(RedisConst.DICT_ICON_LIST, BeanCopyUtil.copyList(dicts, DictBackDto.class));
        /*------------------------  存储图标信息完成  -----------------------------*/
    }
}
