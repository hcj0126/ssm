package com.hcj.mapper;

import com.hcj.domain.Permission;
import com.hcj.domain.Role;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * RoleMapper
 *
 * @author hcj
 * @date 2023-05-31
 */
public interface PermissionMapper {

    /**
     * 根据角色的id查询角色对应拥有的所有权限
    */
    List<Permission> queryPermissionsByRoleId(Integer roleId);
}
