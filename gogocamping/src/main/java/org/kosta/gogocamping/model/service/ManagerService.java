package org.kosta.gogocamping.model.service;

import java.util.ArrayList;

import org.kosta.gogocamping.model.domain.SellerVO;

public interface ManagerService {

	ArrayList<SellerVO> getSellerNotAdmin();

	ArrayList<SellerVO> getSellerAdmin();

}
