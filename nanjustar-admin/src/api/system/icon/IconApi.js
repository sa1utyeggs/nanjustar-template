import {getRequest} from "../../../utils/request";

/**
 * 查询图标列表
 * @returns {AxiosPromise}
 */
export const listIcon = () => {
    return getRequest('/dict/listIcon');
};