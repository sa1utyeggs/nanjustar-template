package com.nanjustar.common.enums;


import java.util.List;

public enum RoleLevelEnum {
    SUPER_ADMIN("super_admin", "超级管理员"),
    ADMIN("admin", "管理员"),
    CONSUMER("user", "用户"),
    TEST("test", "测试账号");

    private final String roleCode;

    private final String groleName;


    RoleLevelEnum(String roleCode, String groleName) {
        this.roleCode = roleCode;
        this.groleName = groleName;
    }

    /**
     * 获取性别信息
     *
     * @param roleList 角色列表
     * @return 性别名称
     */
    public static String getGenderNameByCode(List<String> roleList) {
        for (String role : roleList) {
            if (role.equals("super_admin")) {
                return SUPER_ADMIN.groleName;
            } else if (role.equals("admin")) {
                return ADMIN.groleName;
            } else if (role.equals("user")) {
                return CONSUMER.groleName;
            } else if (role.equals("test")) {
                return TEST.groleName;
            }
        }
        return null;
    }

    public String getRoleCode() {
        return roleCode;
    }

    public String getGroleName() {
        return groleName;
    }
}
