package org.kosta.gogocamping.model.domain;

public class LikesVO {
	private int likeNo;
	private String customerId;
	private int productId;
	private ProductVO productVO;
	private CustomerVO customerVO;
	public LikesVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LikesVO(int likeNo, String customerId, int productId, ProductVO productVO, CustomerVO customerVO) {
		super();
		this.likeNo = likeNo;
		this.customerId = customerId;
		this.productId = productId;
		this.productVO = productVO;
		this.customerVO = customerVO;
	}
	
	public int getLikeNo() {
		return likeNo;
	}
	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public ProductVO getProductVO() {
		return productVO;
	}
	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}
	public CustomerVO getCustomerVO() {
		return customerVO;
	}
	public void setCustomerVO(CustomerVO customerVO) {
		this.customerVO = customerVO;
	}
	@Override
	public String toString() {
		return "LikesVO [likeNo=" + likeNo + ", customerId=" + customerId + ", productId=" + productId + ", productVO="
				+ productVO + ", customerVO=" + customerVO + "]";
	}
	
}
