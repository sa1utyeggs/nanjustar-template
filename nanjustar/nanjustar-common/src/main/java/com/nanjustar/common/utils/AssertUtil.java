package com.nanjustar.common.utils;

import com.nanjustar.common.exception.NanjustarException;

import java.util.List;


public class AssertUtil {

    /**
     * 是否出现异常
     *
     * @param flag    标志
     * @param message 错误消息
     */
    public static void sysIsError(Boolean flag, String message) {
        if (flag) {
            throw new NanjustarException(message);
        }
    }

    /**
     * 检查List集合中是否为空
     *
     * @param list list 集合
     * @param <T>  泛型
     * @return List<T>
     */
    public static <T> List<T> checkListIfNull(List<T> list) {
        if (list.size() > 0) {
            return list;
        } else {
            return null;
        }
    }


    /**
     * 判断对象是否为空
     *
     * @param obj 对象
     * @return 是 / 否
     */
    public static Boolean isNull(Object obj) {
        return obj == null;
    }

    /**
     * 判断对象是否不为空
     *
     * @param obj 对象
     * @return 是 / 否
     */
    public static Boolean isNotNull(Object obj) {
        return obj != null;
    }

    /**
     * 判断集合是否为空
     *
     * @param list 集合
     * @return 是 / 否
     */
    public static <T> Boolean isEmpty(List<T> list) {
        return list == null || list.isEmpty();
    }

    /**
     * 判断集合是否不为空
     *
     * @param list 集合
     * @return 是 / 否
     */
    public static <T> Boolean isNotEmpty(List<T> list) {
        return !isEmpty(list);
    }

    /**
     * 判断字符串是否为空
     *
     * @param str 字符串
     * @return 是 / 否
     */
    public static Boolean isEmpty(String str) {
        return str == null || "".equals(str);
    }

    /**
     * 判断字符串是否不为空
     *
     * @param str 字符串
     * @return 是 / 否
     */
    public static Boolean isNotEmpty(String str) {
        return !isEmpty(str);
    }

    /**
     * 判断数组是否为 0
     * @param number 数字
     * @return true 0  false 不为零
     */
    public static Boolean isNumberZero(int number){
        return number == 0;
    }

    /**
     * 判断数组是不否为 0
     * @param number 数字
     * @return true 不为零  false 0
     */
    public static Boolean isNumberNotZero(int number){
        return !isNumberZero(number);
    }
}
