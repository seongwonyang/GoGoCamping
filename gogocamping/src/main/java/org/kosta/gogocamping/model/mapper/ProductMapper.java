package org.kosta.gogocamping.model.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.gogocamping.model.domain.ProductVO;

@Mapper
public interface ProductMapper {

	List<ProductVO> getAllProductList(Map<String, Object> map);

	int getAllProductCount();

	List<ProductVO> getSortedProductListOrderByHighPrice(Map<String, Integer> map);

	List<ProductVO> getSortedProductListOrderByLowPrice(Map<String, Integer> map);

	List<ProductVO> getSearchProductList(Map<String, Object> map);
	
	int getSearchProductCount(String keyword);

	List<ProductVO> getProductListByBrand(Map<String, String> map);

	List<ProductVO> getBrandCategroyList(Map<String, String> map);

	List<ProductVO> getProductListByBrandAndCategory(Map<String, String> map);

	ProductVO getProductDetailInfo(int productId);

	ArrayList<ProductVO> getRelatedProductList(String categoryName);

}
