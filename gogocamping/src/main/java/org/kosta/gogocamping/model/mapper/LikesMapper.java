package org.kosta.gogocamping.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.gogocamping.model.domain.LikesVO;

@Mapper
public interface LikesMapper {

	void likesAndEmptyLikes(Map<String, Object> map);
	
	void insertProductLikes(Map<String, Object> map);

	int checkSameProductInLikes(Map<String, Object> map);

	void deletProductLikes(Map<String, Object> map);

	List<LikesVO> getLikesList(String customerId);



}
