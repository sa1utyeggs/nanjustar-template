import { getRequest } from "@/utils/request";

/**
 * 查询菜单信息
 * @param {*} url 接口路径
 * @returns  菜单信息
 */
export const listMenu = () => {
    return getRequest("/menu/consumerRouterList");
};