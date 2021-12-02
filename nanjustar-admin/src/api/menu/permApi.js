import {dataPostRequest, dataPutRequest, deleteRequest, getRequest} from "../../utils/request";

/**
 * 查询菜单信息
 * @param {*} url 接口路径
 * @returns  菜单信息
 */
export const listMenu = () => {
    return getRequest("/menu/consumerRouterList");
};

/**
 * 查询父级菜单信息
 * @returns {*}
 */
export const listMenuParent = () => {
    return getRequest('/menu/listParentMenu');
}

/**
 * 查询子集菜单信息
 * @param id 父级id
 * @returns {*}
 */
export const listMenuChildren = (id) => {
    return getRequest(`/menu/listMenu/${id}`);
};

/**
 * 条件查询菜单信息
 * @param param
 */
export const listMenuByCondition = (param) => {
    return getRequest('/menu/listMenuByCondition', param);
};

/**
 * 删除菜单信息
 * @param id 菜单id
 * @returns {AxiosPromise}
 */
export const deleteMenuById = (id) => {
    return deleteRequest('/menu/deleteMenu/' + id);
};

/**
 * 新增菜单信息
 * @param data 菜单信息
 * @returns {AxiosPromise}
 */
export const saveMenu = (data) => {
    return dataPostRequest('/menu/saveMenu', data);
}

/**
 * 修改菜单信息
 * @param data 菜单信息
 * @returns {AxiosPromise}
 */
export const updateMenu = (data) => {
    return dataPutRequest('/menu/updateMenu', data);
}