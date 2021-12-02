package com.nanjustar.business.business.system;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.nanjustar.api.moudle.system.api.DictService;
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

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author nanjustar
 * @since 2021-11-26
 */
@Service
public class DictServiceImpl extends ServiceImpl<DictMapper, Dict> implements DictService {

    @Autowired
    private RedisCache redisCache;

    @Override
    public List<DictBackDto> listParentDict() {
        /*------------------------  开始查询数据字典父级信息  -----------------------------*/
        List<Dict> dicts = baseMapper.selectList(new LambdaQueryWrapper<Dict>()
                .eq(Dict::getParentId, CommonConst.DICT_PARENT_ID));
        /*------------------------  查询数据字典父级信息完成  -----------------------------*/
        return dataTransform(dicts);
    }

    @Override
    public List<DictBackDto> listDictById(Integer id) {
        /*------------------------  开始查询数据字典信息  -----------------------------*/
        List<Dict> dicts = baseMapper.selectList(new LambdaQueryWrapper<Dict>()
                .eq(Dict::getParentId, id));
        /*------------------------  查询数据字典信息完成  -----------------------------*/
        return dataTransform(dicts);
    }

    @Override
    public List<DictBackDto> listIconDict() {
        /*------------------------  检查redis中是否含有数据开始  -----------------------------*/
        List<DictBackDto> dictCache = redisCache.getCacheList(RedisConst.DICT_ICON_LIST);
        if (AssertUtil.isNotEmpty(dictCache)) {
            return dictCache;
        }
        /*------------------------  检查redis中是否含有数据完成  -----------------------------*/
        /*------------------------  开始查询图标信息  -----------------------------*/
        Dict dict = baseMapper.selectOne(new LambdaQueryWrapper<Dict>()
                .eq(Dict::getDictCode, CommonConst.DICT_ICON_CODE));
        List<Dict> dicts = baseMapper.selectList(new LambdaQueryWrapper<Dict>()
                .eq(Dict::getParentId, dict.getDictId()));
        /*------------------------  查询图标信息完成  -----------------------------*/
        List<DictBackDto> list = dataTransform(dicts);
        /*------------------------  存储图标信息开始  -----------------------------*/
        redisCache.setCacheList(RedisConst.DICT_ICON_LIST, list);
        /*------------------------  存储图标信息完成  -----------------------------*/
        return list;
    }


    /**
     * 查询数据字典是否含有子级数据字典
     *
     * @param dictId 数据字典的id
     * @return True 含有    False 不含有
     */
    private Boolean checkDictIsHasChildren(Integer dictId) {
        return baseMapper.selectCount(new LambdaQueryWrapper<Dict>().eq(Dict::getParentId, dictId)) > 0;
    }

    /**
     * 数据转换
     *
     * @param dicts 数据字典 entity
     * @return {@link DictBackDto} 数据字典 Dto
     */
    private List<DictBackDto> dataTransform(List<Dict> dicts) {
        /*------------------------   数据转化开始 -----------------------------*/
        List<DictBackDto> list = new ArrayList<>();
        dicts.forEach(dict -> {
            DictBackDto dictBackDto = BeanCopyUtil.copyObject(dict, DictBackDto.class);
            dictBackDto.setHasChildren(checkDictIsHasChildren(dictBackDto.getDictId()));
            list.add(dictBackDto);
        });
        /*------------------------   数据转化完成 -----------------------------*/
        return list;
    }
}
