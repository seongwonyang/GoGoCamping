package org.kosta.gogocamping.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.gogocamping.model.domain.ReviewVO;

@Mapper
public interface ReviewMapper {

	List<ReviewVO> getReviewListByBrand(String sellerId);

	void deleteReview(int reviewNo);

	ReviewVO getDetailReview(String reviewNo);

	List<ReviewVO> getAllReviewList();
	
}
