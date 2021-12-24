package org.kosta.gogocamping.model.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.gogocamping.model.domain.ReviewVO;


@Mapper
public interface ReviewMapper {

	ArrayList<ReviewVO> getReviewListByProductId(int productId);

	int getReviewCountByProductId(int productId);

	int getAvgReview(int productId);

}
