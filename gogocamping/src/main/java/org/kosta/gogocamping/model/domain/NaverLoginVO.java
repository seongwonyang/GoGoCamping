package org.kosta.gogocamping.model.domain;

public class NaverLoginVO {
	private String customerId;
	private String customerName;
	private String naverEmail;
	public NaverLoginVO() {
		super();
	}
	public NaverLoginVO(String customerId, String customerName, String naverEmail) {
		super();
		this.customerId = customerId;
		this.customerName = customerName;
		this.naverEmail = naverEmail;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getNaverEmail() {
		return naverEmail;
	}
	public void setNaverEmail(String naverEmail) {
		this.naverEmail = naverEmail;
	}
	@Override
	public String toString() {
		return "NaverLoginVO [customerId=" + customerId + ", customerName=" + customerName + ", naverEmail="
				+ naverEmail + "]";
	}
	
}