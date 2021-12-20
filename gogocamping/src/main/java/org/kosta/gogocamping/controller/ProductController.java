package org.kosta.gogocamping.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.gogocamping.model.domain.PagingBean;
import org.kosta.gogocamping.model.domain.ProductVO;
import org.kosta.gogocamping.model.mapper.CategoryMapper;
import org.kosta.gogocamping.model.mapper.ProductMapper;
import org.kosta.gogocamping.model.mapper.SellerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {
	@Resource
	private ProductMapper productMapper;
	@Resource
	private CategoryMapper categoryMapper;
	@Resource
	private SellerMapper sellerMapper;
	
	@Autowired
	public ProductController(ProductMapper productMapper, CategoryMapper categoryMapper, SellerMapper sellerMapper) {
		super();
		this.productMapper = productMapper;
		this.categoryMapper = categoryMapper;
		this.sellerMapper = sellerMapper;
	}
	
	@RequestMapping("getAllProductList")
	public String getAllProductList(int pageNo, String option, Model model) {
		int totalCount = productMapper.getAllProductCount();

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
		map.put("option", option);
		
		model.addAttribute("pagingBean", pagingBean);
		model.addAttribute("allProductList", productMapper.getAllProductList(map));
		model.addAttribute("option", option);
		model.addAttribute("allBrandList", sellerMapper.getAllBrandList());
		model.addAttribute("categoryList", categoryMapper.getCategoryList()); // 전체 카테고리 리스트

		return "home.tiles";
	}
	
	@RequestMapping("searchProductList")
	public String searchProductList(String keyword, String option, Model model) {
		int totalCount = productMapper.getSearchProductCount(keyword);
		
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("option", option);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("option", option);
		model.addAttribute("searchTotalProductCount", totalCount);
		model.addAttribute("allBrandList", sellerMapper.getAllBrandList());
		model.addAttribute("searchProductList", productMapper.getSearchProductList(map));
		model.addAttribute("allBrandList", sellerMapper.getAllBrandList());
		model.addAttribute("categoryList", categoryMapper.getCategoryList()); // 전체 카테고리 리스트

		return "product/search-product.tiles";
	}
	
	@RequestMapping("getProductListByBrand") 
	public String getProductListByBrand(String brand, String category, String option, Model model) {
		Map<String, String> map = new HashMap<>();
		map.put("brand", brand);
		map.put("category", category);
		map.put("option", option);
		
		model.addAttribute("brand", brand);
		model.addAttribute("categroy", category);
		model.addAttribute("option", option);
		
		model.addAttribute("allBrandList", sellerMapper.getAllBrandList());
		model.addAttribute("brandCategoryList", productMapper.getBrandCategroyList(map));
		model.addAttribute("categoryList", categoryMapper.getCategoryList()); // 전체 카테고리 리스트

		if(category != "") {
			model.addAttribute("productListByBrand", productMapper.getProductListByBrandAndCategory(map));
		} else {
			model.addAttribute("productListByBrand", productMapper.getProductListByBrand(map));
		}
		
		return "product/brand.tiles"; 
	}
	
	@RequestMapping("getProductDetailInfo")
	public String getProductDetailInfo(int productId, Model model) {
		ProductVO productVO = productMapper.getProductDetailInfo(productId);
		
		model.addAttribute("allBrandList", sellerMapper.getAllBrandList());
		model.addAttribute("categoryList", categoryMapper.getCategoryList()); // 전체 카테고리 리스트
		model.addAttribute("productVO", productVO);
		System.out.println(productMapper.getProductDetailInfo(productId));
		
		return "product/detail.tiles";
	}
	 
}
