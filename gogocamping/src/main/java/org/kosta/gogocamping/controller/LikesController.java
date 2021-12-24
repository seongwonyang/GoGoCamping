package org.kosta.gogocamping.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.gogocamping.model.domain.LikesVO;
import org.kosta.gogocamping.model.mapper.CategoryMapper;
import org.kosta.gogocamping.model.mapper.LikesMapper;
import org.kosta.gogocamping.model.mapper.SellerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LikesController {
	@Resource
	LikesMapper likesMapper;

	@Resource
	SellerMapper sellerMapper;

	@Resource
	CategoryMapper categoryMapper;

	@Autowired
	public LikesController(LikesMapper likesMapper) {
		super();
		this.likesMapper = likesMapper;
	}

	// 좋아요&좋아요 취소
	@RequestMapping("likesAndEmptyLikes")
	@ResponseBody
	public int likesAndEmptyLikes(String customerId, int productId) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerId", customerId);
		map.put("productId", productId);
//		System.out.println("아이디:" + customerId + " " + "상품아이디:" + productId);
		 // 좋아요 목록에 없는상품인 경우 좋아요 목록에 추가
		if (likesMapper.checkSameProductInLikes(map) == 0) {
			likesMapper.insertProductLikes(map);
//			System.out.println("좋아요 추가 : " + map);
			return likesMapper.checkSameProductInLikes(map);
		} else { // 좋아요가 되어 있는 상품인 경우 좋아요 목록에서 삭제
			likesMapper.deletProductLikes(map);
//			System.out.println("좋아요 삭제 : " + map);
			return likesMapper.checkSameProductInLikes(map);
		}
	}

	// 좋아요(찜)한 상품 리스트 출력
	@RequestMapping("getLikesList")
	public String getLikesList(String customerId, Model model) {
		List<LikesVO> likesList = likesMapper.getLikesList(customerId);
		model.addAttribute("allBrandList", sellerMapper.getAllBrandList());
		model.addAttribute("categoryList", categoryMapper.getCategoryList()); // 전체 카테고리 리스트
		model.addAttribute("likesList", likesList);
		return "customer/likes.tiles";
	}

}
