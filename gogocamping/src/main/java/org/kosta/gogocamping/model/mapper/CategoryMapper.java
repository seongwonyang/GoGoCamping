package org.kosta.gogocamping.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.gogocamping.model.domain.CategoryVO;
import org.kosta.gogocamping.model.domain.ProductVO;

@Mapper
public interface CategoryMapper {

	List<ProductVO> getCategoryProductList(String categoryName);

	List<CategoryVO> getDetailCategory(String categoryName);

	List<CategoryVO> getDetailCateroryProductList(Map<String, Object> map);

}
