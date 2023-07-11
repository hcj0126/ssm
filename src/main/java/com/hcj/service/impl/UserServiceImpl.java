package com.hcj.service.impl;

import com.github.pagehelper.PageHelper;
import com.hcj.domain.Role;
import com.hcj.domain.User;
import com.hcj.mapper.UserMapper;
import com.hcj.service.IUserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * UserServiceImpl
 *
 * @author hcj
 * @date 2023-05-31
 */
@Service
public class UserServiceImpl implements IUserService {

    // 依赖注入
    @Autowired
    private UserMapper userMapper;

    /**
     * 根据手机号码查询用户
     */
    @Override
    public User queryUserByPhone(String phone) {
        return userMapper.queryUserByPhone(phone);
    }

    /**
     * 根据手机号码修改密码
     */
    @Override
    public void updateUserByPassword(@Param("phone") String phone,@Param("password") String password) {
        userMapper.updateUserByPassword(phone,password);
    }

    @Override
    public List<User> selectUserListAll() {
        return userMapper.queryUserListAll();
    }

    @Override
    public void addUser(User user) {
        userMapper.addUser(user);
    }

    @Override
    public User selectUserById(Integer id) {
        return userMapper.queryUserById(id);
    }

    @Override
    public List<Role> selectUserByIdAndOtherAllRoles(Integer id) {
        List<Role> otherRoleList = userMapper.selectUserByIdAndOtherAllRoles(id);
        return otherRoleList;
    }

    @Override
    public void addUserAndOtherRoles(Integer userId, Integer[] roleIds) {
        for (Integer roleId : roleIds) {
            userMapper.insertUserAndOtherRoles(userId,roleId);
        }
        // userMapper.insertUserAndOtherRoles(userId,roleIds);
    }


    // 分页的具体实现业务逻辑
    @Override
    public List<User> selectUserListAllByPage(Integer pageNum, Integer pageSize,String seach) {
        // 分页插件有现成的分页实体类
        PageHelper.startPage(pageNum,pageSize);
        // 模糊查询
        return userMapper.queryUserListBySeach(seach);
    }

}
