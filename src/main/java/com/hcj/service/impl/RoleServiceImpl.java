package com.hcj.service.impl;

import com.hcj.domain.Role;
import com.hcj.mapper.RoleMapper;
import com.hcj.mapper.RolePermissionMapper;
import com.hcj.mapper.UserRoleMapper;
import com.hcj.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * RoleServiceImpl
 *
 * @author hcj
 * @date 2023-06-01
 */
@Service
public class RoleServiceImpl implements IRoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private UserRoleMapper userRoleMapper;

    @Autowired
    private RolePermissionMapper rolePermissionMapper;

    @Override
    public List<Role> selectRoleList() {
        return roleMapper.queryRoleList();
    }

    @Override
    public void deleteRoleById(Integer id) {
        /**
         * 注意：删除的逻辑有主外键约束 先删除user_role和role_permission中间表，
         * 之后再删除主表role
        */

        // 根据角色的id删除角色拥有的用户 user_role
        userRoleMapper.deleteUserAndRoleByRoleId(id);

        // 根据角色的id删除角色拥有的权限 role_permission
        rolePermissionMapper.deleteRoleAndPermissionByRoleId(id);

        // 根据角色id删除role表中数据
        roleMapper.deleteRoleByRoleId(id);
    }
}
