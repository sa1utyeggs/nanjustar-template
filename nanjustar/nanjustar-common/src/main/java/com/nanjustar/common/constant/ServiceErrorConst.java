package com.nanjustar.common.constant;

import lombok.Getter;

@Getter
public class ServiceErrorConst {
    /**
     * 查询数据失败
     */
    public static final String QUERY_DATA_FAIL = "查询数据失败！";

    /**
     * 更新数据失败
     */
    public static final String UPDATE_DATA_FAIL = "更新数据失败！";

    /**
     * 新增数据失败
     */
    public static final String SAVE_DATA_FAIL = "新增数据失败！";

    /**
     * 删除数据失败
     */
    public static final String DELETE_DATA_FAIL = "删除数据失败！";

    /**
     * 删除数据不存在
     */
    public static final String DELETE_DATA_NULL = "删除数据不存在！";

    /**
     * 查询数据失出现错误
     */
    public static final String QUERY_DATA_WITH_ERROR = "查询数据失出现错误！";

    /**
     * 更新数据出现错误
     */
    public static final String UPDATE_DATA_WITH_ERROR = "更新数据出现错误！";

    /**
     * 新增数据出现错误
     */
    public static final String SAVE_DATA_WITH_ERROR = "新增数据出现错误！";

    /**
     * 删除数据出现错误
     */
    public static final String DELETE_DATA_WITH_ERROR = "删除数据出现错误！";

    /**
     * 您要新增/修改的 数据名称 已经存在！
     */
    public static final String DATA_ALREADY_EXISTS = "您要新增/修改的 数据名称 已经存在！";

    /**
     * 数据不能为空
     */
    public static final String DATA_CANNOT_BE_NULL = "数据不能为空！";

    /**
     * 参数信息为空
     */
    public static final String PARAMETER_INFORMATION_IS_EMPTY = "参数信息为空！";

    /**
     * 参数信息不完整
     */
    public static final String PARAMETER_INFORMATION_INCOMPLETE = "参数信息不完整！";

    /**
     * 存在子级元素，无法删除
     */
    public static final String EXISTS_CHILD_ELEMENT = "存在子级元素，无法删除！";

    /**
     * Redis缓存数据清空失败
     */
    public static final String REDIS_CLEAR_FAIL = "Redis缓存数据清空失败！";

    /**
     * Redis缓存数据添加失败
     */
    public static final String REDIS_SAVE_FAIL = "Redis缓存数据添加失败！";
}
