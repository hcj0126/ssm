package com.hcj.mapper;

import com.hcj.domain.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * ProductMapper
 *
 * @author hcj
 * @date 2023-06-06
 */
public interface ProductMapper {
    /**
     * 根据条件模糊查询
     */
    List<Product> queryProductListBySeach(@Param("seach") String seach);

    /**
     * 根据id批量删除
     */
    void batchDeleteProductByIds(String[] ids);
}
