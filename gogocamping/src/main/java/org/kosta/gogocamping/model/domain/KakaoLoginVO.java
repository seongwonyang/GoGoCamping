package org.kosta.gogocamping.model.domain;

public class KakaoLoginVO {
	private String customerId;
	private String customerName;
	private String kakaoEmail;
	
	public KakaoLoginVO() {
		super();
	}

	public KakaoLoginVO(String customerId, String customerName, String kakaoEmail) {
		super();
		this.customerId = customerId;
		this.customerName = customerName;
		this.kakaoEmail = kakaoEmail;
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

	public String getKakaoEmail() {
		return kakaoEmail;
	}

	public void setKakaoEmail(String kakaoEmail) {
		this.kakaoEmail = kakaoEmail;
	}

	@Override
	public String toString() {
		return "KakaoLoginVO [customerId=" + customerId + ", customerName=" + customerName + ", kakaoEmail="
				+ kakaoEmail + "]";
	}
	
}
