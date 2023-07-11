package com.hcj.service.impl;

import com.github.pagehelper.PageHelper;
import com.hcj.domain.Product;
import com.hcj.mapper.ProductMapper;
import com.hcj.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ProductServiceImpl
 *
 * @author hcj
 * @date 2023-06-06
 */
@Service
public class ProductServiceImpl implements IProductService {

    @Autowired
    private ProductMapper productMapper;

    @Override
    public List<Product> selectProductListAllByPage(Integer pageNum, Integer pageSize, String seach) {
        // 分页插件有现成的分页实体类
        PageHelper.startPage(pageNum,pageSize);
        // 模糊查询
        return productMapper.queryProductListBySeach(seach);
    }

    @Override
    public void batchDeleteProductByIds(String[] ids) {
        productMapper.batchDeleteProductByIds(ids);
    }
}
