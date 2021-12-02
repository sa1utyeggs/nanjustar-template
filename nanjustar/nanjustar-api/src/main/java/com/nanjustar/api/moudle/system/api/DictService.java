package com.nanjustar.api.moudle.system.api;

import com.nanjustar.api.moudle.system.dto.DictBackDto;
import com.nanjustar.api.moudle.system.entity.Dict;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author nanjustar
 * @since 2021-11-26
 */
public interface DictService extends IService<Dict> {

    /**
     * 查询数据字典父级信息
     * @return {@link DictBackDto} 数据字典信息
     */
    List<DictBackDto> listParentDict();

    /**
     * 根据父级id查询数据字典信息
     * @param id 父级id
     * @return {@link DictBackDto} 数据字典信息
     */
    List<DictBackDto>  listDictById(Integer id);

    /**
     * 查询图标列表信息
     * @return 图标字典信息
     */
    List<DictBackDto> listIconDict();

}
