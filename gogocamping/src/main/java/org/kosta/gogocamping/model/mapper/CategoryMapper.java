package org.kosta.gogocamping.model.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.gogocamping.model.domain.CategoryVO;
import org.kosta.gogocamping.model.domain.ProductVO;

@Mapper
public interface CategoryMapper {

   List<CategoryVO> getCategoryList();

   List<ProductVO> getProductListByCategory(Map<String, Object> map); // 카테고리(대분류)별 상품조회
   
   List<ProductVO> getProductListByCategoryByPopular(Map<String, Object> map); // 카테고리(대분류)별 상품조회 (인기순 정렬)
   
   int getCategoryCount(String categoryName);

   List<CategoryVO> getProductListByDetailCategory(Map<String, Object> map); // 카테고리(소분류)별 상품조회
   
   List<CategoryVO> getProductListByDetailCategoryByPopular(Map<String, Object> map); // 카테고리(소분류)별 상품조회 (인기순 정렬)

   List<CategoryVO> getDetailCategory(Map<String, Object> map);

   String getCategoryNameByProductId(int productId);

   ArrayList<CategoryVO> getDetailCategoryList(String category);

   int getCategoryNoByDetailCategoryName(String detailCategoryName);


}