package org.kosta.gogocamping.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.gogocamping.model.domain.RefundVO;

@Mapper
public interface RefundMapper {

	void insertRefund(RefundVO refundVO);

}
