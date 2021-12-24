package org.kosta.gogocamping.model.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.gogocamping.model.domain.QnAVO;

@Mapper
public interface QnAMapper {

	ArrayList<QnAVO> getQnaListByProductId(int productId);

}
