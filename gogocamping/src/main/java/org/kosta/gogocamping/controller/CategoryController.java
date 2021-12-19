package org.kosta.gogocamping.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.gogocamping.model.domain.CategoryVO;
import org.kosta.gogocamping.model.domain.ProductVO;
import org.kosta.gogocamping.model.mapper.CategoryMapper;
import org.kosta.gogocamping.model.mapper.ProductMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CategoryController {
	@Resource
	ProductMapper productMapper;
	@Resource
	CategoryMapper categoryMapper;

	/*
	 * @RequestMapping("categoryList") public String getCategoryList(Model model) {
	 * List<CategoryVO> category = categoryMapper.getCateroryList();
	 * model.addAttribute("category", category); System.out.println(category);
	 * return "/header.jsp"; }
	 */

	@RequestMapping("category")
	public String getCategoryProductList(Model model, String categoryName) {
		List<ProductVO> categoryProductList = categoryMapper.getCategoryProductList(categoryName);
		List<CategoryVO> detailCategoryList = categoryMapper.getDetailCategory(categoryName);
		model.addAttribute("categoryProduct", categoryProductList);
		model.addAttribute("detailCategory", detailCategoryList);
		return "/category-product.tiles";
	}

	@RequestMapping("detailCategoryProduct")
	public String getDetailCateroryProductList(Model model, String categoryName, String detailCategoryName) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("categoryName", categoryName);
		map.put("detailCategoryName", detailCategoryName);
		List<CategoryVO> categoryProductList = categoryMapper.getDetailCateroryProductList(map);
		List<CategoryVO> detailCategoryList = categoryMapper.getDetailCategory(categoryName);
		model.addAttribute("detailCategory", detailCategoryList);
		model.addAttribute("categoryProduct", categoryProductList);
		return "/detail-category-product.tiles";
	}
}
