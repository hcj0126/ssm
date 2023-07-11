package com.hcj.controller;

import com.github.pagehelper.PageInfo;
import com.hcj.domain.Product;
import com.hcj.domain.User;
import com.hcj.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Arrays;
import java.util.List;

/**
 * ProductController
 *
 * @author hcj
 * @date 2023-06-06
 */
@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private IProductService productService;

    /**
     * 根据分页插件的分页条件，查询出分页列表
     */
    @RequestMapping("/findProductListByPage")
    public String findProductListByPage(@RequestParam(defaultValue = "1",required = true)Integer pageNum,
                                     @RequestParam(defaultValue = "5",required = true)Integer pageSize,
                                     @RequestParam(value = "seach",required = false)String seach,
                                     Model model){
        List<Product> productList = productService.selectProductListAllByPage(pageNum,pageSize,seach);
        PageInfo pageInfo = new PageInfo(productList);
        model.addAttribute("pageInfo",pageInfo);
        // 查询成功，响应到product_list.jsp
        return "product_list";
    }

    /**
     * 批量删除
    */
    @RequestMapping("/batchProductByIds")
    public String batchProductByIds(@RequestParam(value="ids",required = true) String[] ids){
        // System.out.println(Arrays.toString(ids));
        productService.batchDeleteProductByIds(ids);
        return "redirect:findProductListByPage";
    }
}
