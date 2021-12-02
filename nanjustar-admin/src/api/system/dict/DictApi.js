import {getRequest} from "../../../utils/request";

/**
 * 获取父级数据字典信息
 * @returns {AxiosPromise}
 */
export const listParentDict = () => {
    return getRequest('/dict/listParentDict');
}

/**
 * 根据id查询数据字典列表
 * @param id 数据字典父级id
 * @returns {AxiosPromise}
 */
export const listDictListById = (id) => {
    return getRequest(`/dict/listDictById/${id}`);
}