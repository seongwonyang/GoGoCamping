package org.kosta.gogocamping.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.gogocamping.model.domain.QnAVO;

@Mapper
public interface QnAMapper {

	List<QnAVO> getQnAListByProductId(Map<String, Object> map);

	int getQnACountByProductId(int productId);
	
	void writeQuestion(QnAVO qnaVO);

}
