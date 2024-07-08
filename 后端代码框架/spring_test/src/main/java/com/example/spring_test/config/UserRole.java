package com.example.spring_test.config;

/**
 * 功能：
 * 日期：2024/7/5 11:36
 */
public enum UserRole {
    ROLE_SYS_ADMIN("admin",123456),
    ROLE_NORMAL("user", 111111);

    private final String roleName;

    private final Integer roleCode;

    UserRole(String roleName, Integer roleCode) {
        this.roleName = roleName;
        this.roleCode = roleCode;
    }

    public String getRoleName() {
        return roleName;
    }

    public Integer getRoleCode() {
        return roleCode;
    }

    public static String getRoleNameByRoleCode(Integer roleCode) {
        for (UserRole enums : UserRole.values()) {
            if(enums.getRoleCode().equals(roleCode)) {
                return enums.getRoleName();
            }
        }
        return null;
    }
}
