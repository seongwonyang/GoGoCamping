package org.kosta.gogocamping.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.gogocamping.model.domain.CartVO;

@Mapper
public interface CartMapper {

	int checkSameProductInCart(Map<String, Object> map);

	void insertProductInCart(Map<String, Object> map);

	void UpdateProductInCart(Map<String, Object> map);

	List<CartVO> getProductListInCart(String customerId);
	
	void deleteProductInCart(int cartNo);

	int getTotalCountInCart(String customerId);

	int getCheckedProductPrice(int cartNo);

	int getCheckedProductCount(int cartNo);

	void plusProductCountInCart(int cartNo);

	void minusProductCountInCart(int cartNo);

	CartVO getCheckedProductListInCart(int cartNo);

}
