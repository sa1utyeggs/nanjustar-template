import {deleteRequest, getRequest} from "../../../utils/request";

/**
 * 获取日志信息
 * @param params 参数
 * @returns {AxiosPromise}
 */
export const listOptLog = (params) => {
    return getRequest('/optLog/listOptLogs', params);
};

/**
 * 删除日志信息
 * @param id 日志id
 * @returns {AxiosPromise}
 */
export const deleteLog = (id) => {
    return deleteRequest('/optlog/deleteLog/' + id);
}

/**
 * 批量删除日志信息
 * @param params id集合
 * @returns {AxiosPromise}
 */
export const deleteLogList = (params) => {
    return deleteRequest('/optlog/deleteLogs?idList=' + params);
}