package org.kosta.gogocamping.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.gogocamping.model.domain.CustomerVO;
import org.kosta.gogocamping.model.domain.PagingBean;
import org.kosta.gogocamping.model.domain.ProductVO;
import org.kosta.gogocamping.model.domain.QnAVO;
import org.kosta.gogocamping.model.domain.ReviewVO;
import org.kosta.gogocamping.model.domain.SellerVO;
import org.kosta.gogocamping.model.mapper.CategoryMapper;
import org.kosta.gogocamping.model.mapper.LikesMapper;
import org.kosta.gogocamping.model.mapper.ProductMapper;
import org.kosta.gogocamping.model.mapper.QnAMapper;
import org.kosta.gogocamping.model.mapper.ReviewMapper;
import org.kosta.gogocamping.model.mapper.SellerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Resource
	private ProductMapper productMapper;
	@Resource
	private CategoryMapper categoryMapper;
	@Resource
	private SellerMapper sellerMapper;
	@Resource
	private ReviewMapper reviewMapper;
	@Resource
	private QnAMapper qnaMapper;
	@Resource
	private LikesMapper likesMapper;

	@Autowired
	public ProductController(ProductMapper productMapper, CategoryMapper categoryMapper, SellerMapper sellerMapper) {
		super();
		this.productMapper = productMapper;
		this.categoryMapper = categoryMapper;
		this.sellerMapper = sellerMapper;
	}
	
	@RequestMapping("/getAllProductList") // 메인페이지(전체 상품 리스트 조회)
	public String getAllProductList(int pageNo, String option, Model model) {
		int totalCount = productMapper.getAllProductCount();

		PagingBean pagingBean = new PagingBean(totalCount);

		if (pageNo == 0) {
			pagingBean = new PagingBean(totalCount);
		} else {
			pagingBean = new PagingBean(totalCount, pageNo);
		}

		Map<String, Object> map = new HashMap<>();
		map.put("startRowNumber", pagingBean.getStartRowNumber());
		map.put("endRowNumber", pagingBean.getEndRowNumber());
		map.put("option", option);
		
		if(option.equals("popular")) { // 인기순 정렬 상품 리스트
			model.addAttribute("allProductList", productMapper.getAllProductListByPopular(map));
		} else { // 인기순 정렬 외(가격순) 정렬 상품 리스트
			model.addAttribute("allProductList", productMapper.getAllProductList(map));
		}
		model.addAttribute("pagingBean", pagingBean);
		model.addAttribute("option", option);
		model.addAttribute("allBrandList", sellerMapper.getAllBrandList()); // 전체 브랜드 리스트
		model.addAttribute("categoryList", categoryMapper.getCategoryList()); // 전체 카테고리 리스트

		return "home.tiles";
	}
	
	@RequestMapping("/search") // 검색된 상품 조회
	public String searchProductList(String keyword, String option, Model model) {
		int totalCount = productMapper.getSearchProductCount(keyword);
		
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("option", option);
		
		if(option.equals("popular")) { // 인기순 정렬 상품 리스트
			model.addAttribute("searchProductList", productMapper.getSearchProductListByPopular(map));
		} else { // 인기순 정렬 외(가격순) 정렬 상품 리스트
			model.addAttribute("searchProductList", productMapper.getSearchProductList(map));
		}
		model.addAttribute("keyword", keyword);
		model.addAttribute("option", option);
		model.addAttribute("searchTotalProductCount", totalCount);
		model.addAttribute("allBrandList", sellerMapper.getAllBrandList()); // 전체 브랜드 리스트
		model.addAttribute("categoryList", categoryMapper.getCategoryList()); // 전체 카테고리 리스트

		return "product/search-product.tiles";
	}
	
	@RequestMapping("/getProductListByBrand") // 브랜드별 상품 조회
	public String getProductListByBrand(String brand, String category, String option, Model model) {
		Map<String, String> map = new HashMap<>();
		map.put("brand", brand);
		map.put("category", category);
		map.put("option", option);
		
		model.addAttribute("brand", brand);
		model.addAttribute("category", category);
		model.addAttribute("option", option);
		model.addAttribute("brandCategoryList", productMapper.getBrandCategroyList(map)); 
		model.addAttribute("allBrandList", sellerMapper.getAllBrandList()); // 전체 브랜드 리스트
		model.addAttribute("categoryList", categoryMapper.getCategoryList()); // 전체 카테고리 리스트

		if(category != "") {
			if(option.equals("popular")) {
				model.addAttribute("productListByBrand", productMapper.getProductListByBrandAndCategoryByPopular(map));
				System.out.println(option + " getProductListByBrandAndCategoryByPopular");
			}
			model.addAttribute("productListByBrand", productMapper.getProductListByBrandAndCategory(map));
		} else {
			if(option.equals("popular")) {
				model.addAttribute("productListByBrand", productMapper.getProductListByBrandByPopular(map));
				System.out.println(option + " getProductListByBrandByPopular");
			}
			model.addAttribute("productListByBrand", productMapper.getProductListByBrand(map));
		}
		
		return "product/brand.tiles"; 
	}

	@RequestMapping("/getProductDetailInfo") // 상품 상세보기
	public String getProductDetailInfo(int productId, String sortOption, Model model, HttpServletRequest request) {
		ProductVO productVO = productMapper.getProductDetailInfo(productId);
		SellerVO sellerVO = sellerMapper.getSellerInfoByProduct(productVO.getSellerVO().getSellerId());
		String categoryName = categoryMapper.getCategoryNameByProductId(productId);
		
		ArrayList<ProductVO> relatedProductList = productMapper.getRelatedProductList(categoryName); //관련 상품 리스트
		
		Map<String, Object> sortMap = new HashMap<>();
		sortMap.put("productId", productId);
		sortMap.put("option", sortOption);
		List<QnAVO> qnaList = qnaMapper.getQnAListByProductId(sortMap); // 상품에 달린 QnA 리스트
		int qnaCount = qnaMapper.getQnACountByProductId(productId); // QnA 개수
		
		ArrayList<ReviewVO> reviewList = reviewMapper.getReviewListByProductId(sortMap); // 상품에 달린 리뷰 리스트	
		int reviewCount = reviewMapper.getReviewCountByProductId(productId);
		int avgReview = 0;
		
		if(reviewCount!=0) {
			avgReview = reviewMapper.getAvgReview(productId);
		}
			
		HttpSession session = request.getSession(false);
		CustomerVO customerVO = (CustomerVO) session.getAttribute("loginVO");
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(customerVO!=null) {
			map.put("productId", productId);
			map.put("customerId", customerVO.getCustomerId());
			model.addAttribute("checkSameProductInLikes", likesMapper.checkSameProductInLikes(map));
		} else {
			model.addAttribute("checkSameProductInLikes", 0);
		}
		
		model.addAttribute("allBrandList", sellerMapper.getAllBrandList()); // 전체 브랜드 리스트
		model.addAttribute("categoryList", categoryMapper.getCategoryList()); // 전체 카테고리 리스트
		model.addAttribute("productVO", productVO);
		model.addAttribute("sellerVO", sellerVO);
		model.addAttribute("relatedProductList", relatedProductList);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("avgReview", avgReview);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("qnaCount", qnaCount);
		model.addAttribute("option", sortOption);
		
		return "product/detail.tiles";
	}
	 
}
