package com.hcj.domain;

import java.util.List;

/**
 * Role
 *  对应数据库中的表role
 * @author hcj
 * @date 2023-06-01
 */
public class Role {
    private Integer id;
    private String roleName;
    private String roleDesc;

    // 非数据库字段，一个角色可以拥有多个权限
    private List<Permission> permissions;

    // 非数据库字段，一个角色可以拥有多个用户
    private List<User> users;

    public Role() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleDesc() {
        return roleDesc;
    }

    public void setRoleDesc(String roleDesc) {
        this.roleDesc = roleDesc;
    }

    public List<Permission> getPermissions() {
        return permissions;
    }

    public void setPermissions(List<Permission> permissions) {
        this.permissions = permissions;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    @Override
    public String toString() {
        return "Role{" +
                "id=" + id +
                ", roleName='" + roleName + '\'' +
                ", roleDesc='" + roleDesc + '\'' +
                ", permissions=" + permissions +
                ", users=" + users +
                '}';
    }
}
