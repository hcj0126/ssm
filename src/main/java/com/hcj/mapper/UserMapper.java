package com.hcj.mapper;

import com.hcj.domain.Role;
import com.hcj.domain.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * UserMapper
 *
 * @author hcj
 * @date 2023-05-31
 */
public interface UserMapper {
    /**
     * 根据手机号码查询用户
     */
    User queryUserByPhone(String phone);
    /**
     * 根据手机号码修改密码
     */
    void updateUserByPassword(@Param("phone")String phone, @Param("password")String password);

    /**
     * 查询所有用户列表
     */
    List<User> queryUserListAll();

    /**
     * 新增用户
     */
    void addUser(User user);

    /**
     * 根据id查询用户
     * property：表示实体类中的属性名称
     * column:表示数据库中的字段名称
     * 在进行表查询的时候如果需要将结果集封装为多个实体类对象，
     * 可以在xml中使用resultMap解决，但如果使用的是注解则需要使用@Result
     * @One一般用于一对一查询而@Many用于一对多或者多对多查询
    */
    @Select("select * from user where id=#{id}")
    @Results({
            @Result(property="id",column="id",id=true),
            @Result(property="username",column="username"),
            @Result(property="phone",column="phone"),
            @Result(property="password",column="password"),
            @Result(property="email",column="email"),
            @Result(property="status",column="status"),
            @Result(property="roles",column="id",javaType = java.util.List.class,
                    many = @Many(select="com.hcj.mapper.RoleMapper.queryRolesByUserId"))
    })
    User queryUserById(Integer id);

    /**
     * 根据id查询用户不配备的其他角色
     */
    List<Role> selectUserByIdAndOtherAllRoles(Integer id);

    void insertUserAndOtherRoles(@Param("userId")Integer userId,@Param("roleId")Integer roleId);

    // void insertUserAndOtherRoles(@Param("userId")Integer userId,@Param("roleIds")Integer[] roleIds);

    /**
     * 根据条件模糊查询
    */
    List<User> queryUserListBySeach(@Param("seach") String seach);
}
