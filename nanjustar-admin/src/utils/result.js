import {messageInfo} from "./MessageInfo";


/**
 * 结果信息处理
 * @param res 数据
 * @param isShowMessage 是否弹窗
 * @returns {*}
 */
export const resultCheck = (res, isShowMessage = false) => {
    if (res.status) {
        if (isShowMessage) {
            messageInfo({message: res.message});
        }
        return res.data;
    }
};