package com.hcj.controller;

import com.hcj.domain.Role;
import com.hcj.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * RoleController
 *
 * @author hcj
 * @date 2023-06-01
 */
@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private IRoleService roleService;

    /**
     * 查询所有角色列表
    */
    @RequestMapping("/findRoleList")
    public String findRoleList(Model model){
        List<Role> roleList = roleService.selectRoleList();
        model.addAttribute("roleList",roleList);
        return "role_list";
    }

    /**
     * 根据角色的id删除角色拥有的权限
     * 根据角色的id删除角色拥有的用户
    */
    @RequestMapping("/deleteRole")
    public String deleteRole(@RequestParam(value="id",required = true) Integer id){
        roleService.deleteRoleById(id);
        return "forward:findRoleList";
    }
}
