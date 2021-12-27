package org.kosta.gogocamping;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.jupiter.api.Test;
import org.kosta.gogocamping.model.mapper.LikesMapper;
import org.kosta.gogocamping.model.mapper.ReviewMapper;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class test {
	@Resource
	LikesMapper likesMapper;
	@Resource
	ReviewMapper reviewMapper;
	
	// 좋아요 추가, 삭제 메서드
	@Test
	void likesAndEmptyLikes() {
		String customerId = "customer";
		int productId = 1;

		Map<String, Object> map = new HashMap<>();
		map.put("customerId", customerId);
		map.put("productId", productId);

		// 좋아요 목록에 없는 상품인 경우 좋아요 목록에 추가
		if (likesMapper.checkSameProductInLikes(map) == 0) {
			likesMapper.insertProductLikes(map);
			System.out.println("좋아요 추가 : " + map);
		} else { // 좋아요가 되어 있는 상품인 경우 좋아요 목록에서 삭제
			likesMapper.deletProductLikes(map);
			System.out.println("좋아요 삭제 : " + map);
		}
	}

	// 좋아요 리스트 출력 메서드
	/*
	 * @Test void getLikesList() { String customerId = "customer"; int productId =
	 * 1;
	 * 
	 * Map<String, Object> map = new HashMap<>(); map.put("customerId", customerId);
	 * map.put("productId", productId);
	 * 
	 * List<ProductVO> list=likesMapper.getLikesList(map); for(ProductVO pvo:list) {
	 * System.out.println(pvo); } }
	 */
	
	// 브랜드별 구매 후기 리스트 출력 메서드
	@Test
	void getReviewListByBrand() {
		String sellerId="campis";
		System.out.println(reviewMapper.getReviewListByBrand(sellerId));
	}
}
