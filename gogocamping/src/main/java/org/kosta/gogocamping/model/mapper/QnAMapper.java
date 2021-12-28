package org.kosta.gogocamping.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.gogocamping.model.domain.QnAVO;

@Mapper
public interface QnAMapper {

	List<QnAVO> getQnAList(String sellerId);

	void answerQnA(QnAVO qnaVO);

	List<QnAVO> getQnAListByNo(int qnaNo);

}
