package org.kosta.gogocamping.model.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.gogocamping.model.domain.ProductVO;

@Mapper
public interface ProductMapper {

	List<ProductVO> getAllProductList(Map<String, Object> map); // 전체 상품 조회
	
	List<ProductVO> getAllProductListByPopular(Map<String, Object> map); // 전체 상품 조회 (인기순 정렬)

	int getAllProductCount();

	List<ProductVO> getSearchProductList(Map<String, Object> map); // 검색된 상품 조회
	
	List<ProductVO> getSearchProductListByPopular(Map<String, Object> map); // 검색된 상품 조회 (인기순 정렬)
	
	int getSearchProductCount(String keyword);

	List<ProductVO> getBrandCategroyList(Map<String, String> map); // 해당 브랜드에 존재하는 카테고리 조회
	
	List<ProductVO> getProductListByBrand(Map<String, String> map); // 브랜드별 상품 조회
	
	List<ProductVO> getProductListByBrandByPopular(Map<String, String> map); // 브랜드별 상품 조회 (인기순 정렬)

	List<ProductVO> getProductListByBrandAndCategory(Map<String, String> map); // 브랜드 카테고리별 상품 조회
	
	List<ProductVO> getProductListByBrandAndCategoryByPopular(Map<String, String> map); // 브랜드 카테고리별 상품 조회 (인기순 정렬)

	void registerProduct(ProductVO productVO);

	List<ProductVO> getSellerProductList(String sellerId);
	
	ProductVO getProductInfo(int productId);

	void updateProduct(ProductVO productVO);

	List<ProductVO> getOrderList(String sellerId);

	void updateDeliveryStatus(Map<String, String> orderMap);
  
	ProductVO getProductDetailInfo(int productId);

	int getProductStockCount(int productId);

	void updateProductStockCount(Map<String, Object> map);

	ArrayList<ProductVO> getRelatedProductList(String categoryName);

}
