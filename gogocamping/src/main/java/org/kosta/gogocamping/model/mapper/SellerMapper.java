package org.kosta.gogocamping.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.gogocamping.model.domain.SellerVO;

@Mapper
public interface SellerMapper {

	List<SellerVO> getAllBrandList();

}
