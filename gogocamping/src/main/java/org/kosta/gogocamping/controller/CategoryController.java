package org.kosta.gogocamping.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.gogocamping.model.domain.CategoryVO;
import org.kosta.gogocamping.model.domain.PagingBean;
import org.kosta.gogocamping.model.domain.ProductVO;
import org.kosta.gogocamping.model.mapper.CategoryMapper;
import org.kosta.gogocamping.model.mapper.ProductMapper;
import org.kosta.gogocamping.model.mapper.SellerMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CategoryController {
	@Resource
	ProductMapper productMapper;
	@Resource
	CategoryMapper categoryMapper;
	@Resource
	SellerMapper sellerMapper;

	/*
	 * @RequestMapping("categoryList") public String getCategoryList(Model model) {
	 * List<CategoryVO> category = categoryMapper.getCateroryList();
	 * model.addAttribute("category", category); System.out.println(category);
	 * return "/header.jsp"; }
	 */

	@RequestMapping("category")
	public String getProductListByCategory(String categoryName, int pageNo, String option, Model model) {
	      int totalCount = categoryMapper.getCategoryCount(categoryName); // 카테고리별(대분류) 상품수
	      
	      PagingBean pagingBean = new PagingBean(totalCount);

	      if (pageNo == 0) {
	         // 현재 페이지가 1page로 할당되어 있음
	         pagingBean = new PagingBean(totalCount);
	      } else {
	         // client에서 보낸 page번호로 할당한다
	         pagingBean = new PagingBean(totalCount, pageNo);
	      }
	      
	      Map<String, Object> map = new HashMap<>();
	      map.put("startRowNumber", pagingBean.getStartRowNumber());
	      map.put("endRowNumber", pagingBean.getEndRowNumber());
	      map.put("categoryName", categoryName);
	      map.put("option", option);
	      
	      List<ProductVO> productListByCategory = categoryMapper.getProductListByCategory(map);
	      List<CategoryVO> detailCategoryList = categoryMapper.getDetailCategory(map);
	      
	      model.addAttribute("pagingBean", pagingBean);
	      model.addAttribute("categoryName", categoryName);
	      model.addAttribute("productListByCategory", productListByCategory);
	      model.addAttribute("detailCategoryList", detailCategoryList);
		  model.addAttribute("categoryList", categoryMapper.getCategoryList());
		  model.addAttribute("allBrandList", sellerMapper.getAllBrandList()); // 전체 브랜드 리스트
		  model.addAttribute("option", option);
		
	      return "product/category.tiles";
	}

	@RequestMapping("detailCategoryProduct")
	public String getProductListByDetailCategory(String categoryName, String detailCategoryName, String option, Model model) {
		  Map<String, Object> map = new HashMap<String, Object>();
	      map.put("categoryName", categoryName);
	      map.put("detailCategoryName", detailCategoryName);
	      map.put("option", option);

	      List<CategoryVO> productListByDetailCategory = categoryMapper.getProductListByDetailCategory(map);
	      List<CategoryVO> detailCategoryList = categoryMapper.getDetailCategory(map);
	      
	      model.addAttribute("categoryName", categoryName);
	      model.addAttribute("detailCategoryName", detailCategoryName);
	      model.addAttribute("productListByDetailCategory", productListByDetailCategory);
	      model.addAttribute("detailCategoryList", detailCategoryList);
	      model.addAttribute("categoryList", categoryMapper.getCategoryList());
	      model.addAttribute("allBrandList", sellerMapper.getAllBrandList()); // 전체 브랜드 리스트
		
		return "product/detail-category.tiles";
	}

	@RequestMapping("getDetailCategoryList")
	@ResponseBody
	public ArrayList<String> getDetailCategoryList(String category){
	ArrayList<CategoryVO> getDetailList = categoryMapper.getDetailCategoryList(category);
	ArrayList<String> detailList = new ArrayList<String>();
	      
	for(int i=0; i<getDetailList.size(); i++) {
		detailList.add(getDetailList.get(i).getDetailCategoryName());
	}
	      
		return detailList;
	}
	
}










