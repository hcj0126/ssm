package com.hcj.service;

import com.hcj.domain.Role;
import com.hcj.domain.User;

import java.util.List;

/**
 * IUserService
 *
 * @author hcj
 * @date 2023-05-31
 */
public interface IUserService {
    /**
     * 根据手机号码查询用户
     */
    User queryUserByPhone(String phone);
    /**
     * 根据手机号码修改密码
     */
    void updateUserByPassword(String phone,String password);
    /**
     * 查询所有用户列表
     */
    List<User> selectUserListAll();
    /**
     * 新增用户
     */
    void addUser(User user);

    /**
     * 根据id查询用户
     */
    User selectUserById(Integer id);
    /**
     * 根据id查询用户不配备的其他角色
     */
    List<Role> selectUserByIdAndOtherAllRoles(Integer id);

    /**
     * 新增当前用户下的其他角色
     */
    void addUserAndOtherRoles(Integer userId,Integer[] roleIds);

    /**
     * 根据分页插件的分页条件，查询出分页列表
     */
    List<User> selectUserListAllByPage(Integer currentPage,Integer pageSize,String seach);

}
