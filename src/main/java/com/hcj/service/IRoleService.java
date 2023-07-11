package com.hcj.service;

import com.hcj.domain.Role;

import java.util.List;

/**
 * IRoleService
 *
 * @author hcj
 * @date 2023-06-01
 */
public interface IRoleService {
    /**
     * 查询所有角色列表
     */
    List<Role> selectRoleList();

    /**
     * 根据id删除角色
    */
    void deleteRoleById(Integer id);
}
