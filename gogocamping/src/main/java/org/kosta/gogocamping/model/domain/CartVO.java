package org.kosta.gogocamping.model.domain;

public class CartVO {
	private int cartNo;
	private int productCount;
	private String customerId;
	private ProductVO productVO;
	public CartVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CartVO(int productCount, String customerId, ProductVO productVO) {
		super();
		this.productCount = productCount;
		this.customerId = customerId;
		this.productVO = productVO;
	}
	public CartVO(int cartNo, int productCount, String customerId, ProductVO productVO) {
		super();
		this.cartNo = cartNo;
		this.productCount = productCount;
		this.customerId = customerId;
		this.productVO = productVO;
	}
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public int getProductCount() {
		return productCount;
	}
	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public ProductVO getProductVO() {
		return productVO;
	}
	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}
	@Override
	public String toString() {
		return "CartVO [cartNo=" + cartNo + ", productCount=" + productCount + ", customerId=" + customerId
				+ ", productVO=" + productVO + "]";
	}
	
}
