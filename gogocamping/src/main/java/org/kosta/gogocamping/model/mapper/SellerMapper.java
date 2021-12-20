package org.kosta.gogocamping.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.gogocamping.model.domain.SellerVO;

@Mapper
public interface SellerMapper {

	void registerSeller(SellerVO sellerVO);

	SellerVO loginSeller(SellerVO sellerVO);

	SellerVO findSellerById(String sellerId);

	String findSellerIdByBusinessNo(SellerVO sellerVO);

	SellerVO findSellerPwByBusinessNo(SellerVO sellerVO);

	void updatePassword(SellerVO sellerVO);
}
