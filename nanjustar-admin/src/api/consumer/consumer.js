import {getRequest, paramsPostRequest} from "@/utils/request";
/**
 * 获取当前登陆用户信息
 * @returns {AxiosPromise}
 * @constructor
 */
export const getUserInfo = () => {
    return getRequest('/getUserInfo');
};

export const getConsumerInfo = () => {
    return getRequest('/getUserInfo');
};
