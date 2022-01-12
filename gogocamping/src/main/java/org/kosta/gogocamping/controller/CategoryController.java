package org.kosta.gogocamping.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.gogocamping.model.domain.CategoryVO;
import org.kosta.gogocamping.model.domain.PagingBean;
import org.kosta.gogocamping.model.domain.SellerVO;
import org.kosta.gogocamping.model.mapper.CategoryMapper;
import org.kosta.gogocamping.model.mapper.ProductMapper;
import org.kosta.gogocamping.model.mapper.SellerMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/category")
public class CategoryController {
	@Resource
	ProductMapper productMapper;
	@Resource
	CategoryMapper categoryMapper;
	@Resource
	SellerMapper sellerMapper;
	
	@ModelAttribute("allBrandList")
	public List<SellerVO> allBrandList() {
		return sellerMapper.getAllBrandList(); // 전체 브랜드 리스트
	}
	@ModelAttribute("categoryList")
	public List<CategoryVO> categoryList() {
		return categoryMapper.getCategoryList(); // 전체 카테고리 리스트
	}

	@RequestMapping("/categoryProduct") // 카테고리(대분류)별 상품조회
	public String getProductListByCategory(String categoryName, int pageNo, String option, Model model) {
	      int totalCount = categoryMapper.getCategoryCount(categoryName); // 카테고리별(대분류) 상품수
	      
	      PagingBean pagingBean = new PagingBean(totalCount);

	      if (pageNo == 0) {
	         pagingBean = new PagingBean(totalCount);
	      } else {
	         pagingBean = new PagingBean(totalCount, pageNo);
	      }
	      
	      Map<String, Object> map = new HashMap<>();
	      map.put("startRowNumber", pagingBean.getStartRowNumber());
	      map.put("endRowNumber", pagingBean.getEndRowNumber());
	      map.put("categoryName", categoryName);
	      map.put("option", option);
	      
	      if(option.equals("popular")) {
	    	  model.addAttribute("productListByCategory", categoryMapper.getProductListByCategoryByPopular(map));
	      } else {
	    	  model.addAttribute("productListByCategory", categoryMapper.getProductListByCategory(map));
	      }   
	      model.addAttribute("option", option);
	      model.addAttribute("totalCount", totalCount);
	      model.addAttribute("pagingBean", pagingBean);
	      model.addAttribute("categoryName", categoryName);
	      model.addAttribute("detailCategoryList", categoryMapper.getDetailCategory(map));
		
	      return "product/category.tiles";
	}

	@RequestMapping("/detailCategoryProduct") // 카테고리(소분류)별 상품조회
	public String getProductListByDetailCategory(String categoryName, String detailCategoryName, String option, Model model) {
		  Map<String, Object> map = new HashMap<String, Object>();
	      map.put("categoryName", categoryName);
	      map.put("detailCategoryName", detailCategoryName);
	      map.put("option", option);
	      
	      if(option.equals("popular")) {
	    	  model.addAttribute("productListByDetailCategory", categoryMapper.getProductListByDetailCategoryByPopular(map));
	      } else {
	    	  model.addAttribute("productListByDetailCategory", categoryMapper.getProductListByDetailCategory(map));
	      }
	      model.addAttribute("option", option);
	      model.addAttribute("categoryName", categoryName);
	      model.addAttribute("detailCategoryName", detailCategoryName);
	      model.addAttribute("detailCategoryList", categoryMapper.getDetailCategory(map));
		
		return "product/detail-category.tiles";
	}

	@RequestMapping("/getDetailCategoryList")
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

