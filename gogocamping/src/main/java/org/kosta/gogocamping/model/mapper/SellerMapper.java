package org.kosta.gogocamping.model.mapper;

import java.util.List;
import java.util.Map;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.gogocamping.model.domain.OrderDetailVO;
import org.kosta.gogocamping.model.domain.SellerVO;

@Mapper
public interface SellerMapper {

	List<SellerVO> getAllBrandList();

	ArrayList<SellerVO> getSellerNotAdmin();

	ArrayList<SellerVO> getSellerAdmin();

	void adminSeller(String sellerId);

	void registerSeller(SellerVO sellerVO);

	SellerVO loginSeller(SellerVO sellerVO);

	SellerVO findSellerById(String sellerId);

	String findSellerIdByBusinessNo(SellerVO sellerVO);

	SellerVO findSellerPwByBusinessNo(SellerVO sellerVO);

	void updatePassword(SellerVO sellerVO);

	List<OrderDetailVO> getTotalSoldList(String sellerId);

	List<OrderDetailVO> getTotalSoldOrderListByDate(Map<String, Object> map);

}
