package org.kosta.gogocamping.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.gogocamping.model.domain.PagingBean;
import org.kosta.gogocamping.model.mapper.CategoryMapper;
import org.kosta.gogocamping.model.mapper.ProductMapper;
import org.kosta.gogocamping.model.mapper.SellerMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@Resource
	private ProductMapper productMapper;
	@Resource
	private SellerMapper sellerMapper;
	@Resource
	private CategoryMapper categoryMapper;

	@RequestMapping("/")
	public String home(Model model) {
		int totalCount = productMapper.getAllProductCount();
		PagingBean pagingBean = new PagingBean(totalCount);

		int startRowNumber = pagingBean.getStartRowNumber();
		int endRowNumber = pagingBean.getEndRowNumber();

		Map<String, Object> map = new HashMap<>();
		map.put("startRowNumber", startRowNumber);
		map.put("endRowNumber", endRowNumber);
		map.put("option", "");
		
		model.addAttribute("pagingBean", pagingBean);
		model.addAttribute("allProductList", productMapper.getAllProductList(map)); // 전체 상품 리스트
		model.addAttribute("allBrandList", sellerMapper.getAllBrandList()); // 전체 브랜드 리스트
		model.addAttribute("categoryList", categoryMapper.getCategoryList()); // 전체 카테고리 리스트
		
		return "home.tiles";
	}

}
