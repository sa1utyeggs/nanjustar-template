import {Message,Notification} from "element-ui";

/**
 * 消息提示设置
 * @param type 消息提示 类型
 * @param message 消息提示 消息
 * @param showClose 消息提示 是否可以关闭
 * @param duration 消息提示 延迟时间
 * @param center 消息提示 是否剧中
 */
export const messageInfo = ({type = 'success', message, showClose = false, duration = 3000, center = false}) => {
    if (type === 'success') {
        Message.success({message: message, showClose: showClose, center: center, duration: duration});
    } else if (type === 'info') {
        Message.info({message: message, showClose: showClose, center: center, duration: duration});
    } else if (type === 'warning') {
        Message.warning({message: message, showClose: showClose, center: center, duration: duration});
    } else if (type === 'error') {
        Message.error({message: message, showClose: showClose, center: center, duration: duration});
    }
};


/**
 * 通知 设置
 * @param type 通知 类型
 * @param title 通知 标题
 * @param message 通知 信息
 * @param duration 通知 时间间隔 0为不自动关闭
 * @param showClose 通知 是否可关闭
 */
export const notificationInfo = ({type = "success", title, message, duration = 3000, showClose = false}) => {
    if (type === 'success') {
        Notification.success({title: title, message: message, duration: duration, showClose: showClose});
    } else if (type === 'info') {
        Notification.info({title: title, message: message, duration: duration, showClose: showClose});
    } else if (type === 'warning') {
        Notification.warning({title: title, message: message, duration: duration, showClose: showClose});
    } else if (type === 'error') {
        Notification.error({title: title, message: message, duration: duration, showClose: showClose});
    }
};
