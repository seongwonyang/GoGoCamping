package org.kosta.gogocamping.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.kosta.gogocamping.model.domain.SellerVO;
import org.kosta.gogocamping.model.mapper.ManagerMapper;
import org.kosta.gogocamping.model.mapper.SellerMapper;
import org.springframework.stereotype.Service;

@Service
public class ManagerServiceImpl implements ManagerService {
	@Resource
	private ManagerMapper managerMapper;
	
	@Resource
	private SellerMapper sellerMapper;
	
	@Override
	public ArrayList<SellerVO> getSellerNotAdmin() {
		return sellerMapper.getSellerNotAdmin();
	}

	@Override
	public ArrayList<SellerVO> getSellerAdmin() {
		return sellerMapper.getSellerAdmin();
	}

}
