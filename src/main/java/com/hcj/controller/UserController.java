package com.hcj.controller;

import com.github.pagehelper.PageInfo;
import com.hcj.domain.Role;
import com.hcj.domain.User;
import com.hcj.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/**
 * UserController
 *
 * @author hcj
 * @date 2023-05-31
 */
@Controller
@RequestMapping("/user")
public class UserController {

    // 依赖注入
    @Autowired
    private IUserService userService;

    /**
     * 根据手机号码查询用户
    */
    @RequestMapping("/findUserByPhone")
    public String findUserByPhone(String phone, String password, HttpSession session){
        User user = userService.queryUserByPhone(phone);
        if(user!=null){
            // 去验证密码
            if(user.getPassword().equals(password)){
                session.setAttribute("user",user);
                // 有这个用户
                return "index";
            }else{
                // 响应给登录失败页面
                return "failer";
            }
        }else{
            // 响应给登录失败页面
            return "failer";
        }
    }
    /**
     * 注销用户
    */
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        // 将session存入的user注销
        session.invalidate();
        // 响应到登录页面
        return "login";
    }
    /**
     * 修改
    */
    @RequestMapping("/updatePassword")
    public String updatePassword(String phone,String oldpassword,String password){
        // System.out.println(phone+":"+oldpassword+":"+password);
        User user = userService.queryUserByPhone(phone);
        if(user!=null){
            if(user.getPassword().equals(oldpassword)){
                // 修改密码
                userService.updateUserByPassword(phone,password);
                // 返回到登录页
                return "login";
            }else{
                return "password_edit";
            }
        }
        return "index";
    }

    /**
     * 查询所有用户列表
    */
    @RequestMapping("/findUserList")
    public String findUserList(Model model){
        List<User> userList = userService.selectUserListAll();
        // 存入model中，方面页面获取
        model.addAttribute("userList",userList);
        // 查询成功，响应到user_list.jsp
        return "user_list";
    }

    /**
     * 保存用户
     */
    @RequestMapping("/save")
    public String save(User user){
        // 在保存用户信息之前验证手机号
        userService.addUser(user);
        // 保存成功，页面跳转到用户列表页
        return "redirect:findUserList";
    }
    /**
     * 验证手机号
     */
    @RequestMapping("/findExistPhone")
    public void findExistPhone(String phone, HttpServletResponse response){
        User user = userService.queryUserByPhone(phone);
        if(user==null){
            // 说明手机号不存在
            try {
                response.getWriter().println(0);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{
            // 说明手机号存在
            try {
               response.getWriter().println(1);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 根据id查询用户信息
    */
    @RequestMapping("/findUserById")
    public String findUserById(@RequestParam(value="id",required = true) Integer id,Model model){
        // System.out.println(id);
        User user = userService.selectUserById(id);
        // System.out.println(user);
        // 保存数据
        model.addAttribute("user",user);
        // 返回页面
        return "user_show";
    }
    /**
     * 根据id查询用户不配备的其他角色
     */
    @RequestMapping("/findUserByIdAndOtherAllRoles")
    public String findUserByIdAndOtherAllRoles(@RequestParam(value="id",required = true) Integer id,Model model){
        List<Role> otherRoleList = userService.selectUserByIdAndOtherAllRoles(id);
        model.addAttribute("otherRoleList",otherRoleList);
        User user = userService.selectUserById(id);
        model.addAttribute("user",user);
        return "user_role_add";
    }

    /**
     * 新增当前用户下的其他角色
    */
    @RequestMapping("/addUserAndOtherRoles")
    public String addUserAndOtherRoles(@RequestParam(value="userId",required = true)Integer userId,@RequestParam(value="ids",required = true)Integer[] roleIds){
        // System.out.println(userId);
        // System.out.println(Arrays.toString(roleIds));
        // 把userId和roleIds存入user_role中间表中
        userService.addUserAndOtherRoles(userId,roleIds);
        // 保存成功，页面跳转到用户列表页
        return "redirect:findUserList";
    }

    /**
     * 根据分页插件的分页条件，查询出分页列表
    */
    @RequestMapping("/findUserListByPage")
    public String findUserListByPage(@RequestParam(defaultValue = "1",required = true)Integer pageNum,
                                     @RequestParam(defaultValue = "5",required = true)Integer pageSize,
                                     @RequestParam(value = "seach",required = false)String seach,
                                     Model model){
        System.out.println(pageNum);
        System.out.println(pageSize);
        System.out.println(seach);
        List<User> userList = userService.selectUserListAllByPage(pageNum,pageSize,seach);
        PageInfo pageInfo = new PageInfo(userList);
        model.addAttribute("pageInfo",pageInfo);
        // 查询成功，响应到user_list.jsp
        return "user_list";
    }
}
