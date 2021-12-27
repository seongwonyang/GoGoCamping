package org.kosta.gogocamping.model.mapper;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.gogocamping.model.domain.ReviewVO;


@Mapper
public interface ReviewMapper {

	ArrayList<ReviewVO> getReviewListByProductId(Map<String, Object> sortMap);

	int getReviewCountByProductId(int productId);

	int getAvgReview(int productId);

	void writeReview(ReviewVO reviewVO);

}
