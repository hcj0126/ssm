package com.hcj.mapper;

/**
 * RolePermissionMapper
 *
 * @author hcj
 * @date 2023-06-01
 */
public interface RolePermissionMapper {
    /**
     * 根据角色id删除数据
    */
    void deleteRoleAndPermissionByRoleId(Integer roleId);
}
