package com.hcj.service;

import com.hcj.domain.Product;
import com.hcj.domain.User;

import java.util.List;

/**
 * IProductService
 *
 * @author hcj
 * @date 2023-06-06
 */
public interface IProductService {
    /**
     * 根据分页插件的分页条件，查询出分页列表
     */
    List<Product> selectProductListAllByPage(Integer currentPage, Integer pageSize, String seach);
    /**
     * 根据id批量删除
    */
    void batchDeleteProductByIds(String[] ids);
}
