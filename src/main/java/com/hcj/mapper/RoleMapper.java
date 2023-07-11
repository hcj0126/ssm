package com.hcj.mapper;

import com.hcj.domain.Role;
import com.hcj.domain.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * RoleMapper
 *
 * @author hcj
 * @date 2023-05-31
 */
public interface RoleMapper {

    /**
     * 根据用户的id查询用户对应拥有的所有角色
     * property：表示实体类中的属性名称
     * column:表示数据库中的字段名称
    */
    @Select("select * from role where id in (select roleId from user_role where userId=#{userId})")
    @Results({
            @Result(property="id",column="id",id=true),
            @Result(property="roleName",column="roleName"),
            @Result(property="roleDesc",column="roleDesc"),
            @Result(property="permissions",column="id",javaType = List.class,
                    many = @Many(select="com.hcj.mapper.PermissionMapper.queryPermissionsByRoleId"))
    })
    List<Role> queryRolesByUserId(Integer userId);

    /**
     * 查询所有角色列表
     */
    List<Role> queryRoleList();
    
    /**
     * 根据角色id删除角色表数据
    */
    void deleteRoleByRoleId(Integer id);
}
