package org.kosta.gogocamping.model.domain;

public class CustomerVO {
	private String customerId;
	private String customerName;
	private String customerPassword;
	private String customerEmail;
	private String customerTel;
	private String customerPostNumber;
	private String customerAddress;
	private String customerDetailedAddress;
	private String customerBirth;
	private String customerRegdate;
	public CustomerVO(String customerId, String customerName, String customerPassword, String customerEmail,
			String customerTel, String customerPostNumber, String customerAddress, String customerDetailedAddres,
			String customerBirth, String customerRegdate) {
		super();
		this.customerId = customerId;
		this.customerName = customerName;
		this.customerPassword = customerPassword;
		this.customerEmail = customerEmail;
		this.customerTel = customerTel;
		this.customerPostNumber = customerPostNumber;
		this.customerAddress = customerAddress;
		this.customerDetailedAddress = customerDetailedAddres;
		this.customerBirth = customerBirth;
		this.customerRegdate = customerRegdate;
	}
	
	public CustomerVO(String customerId, String customerName, String customerEmail, String customerTel,
			String customerPostNumber, String customerAddress, String customerDetailedAddres, String customerBirth) {
		super();
		this.customerId = customerId;
		this.customerName = customerName;
		this.customerEmail = customerEmail;
		this.customerTel = customerTel;
		this.customerPostNumber = customerPostNumber;
		this.customerAddress = customerAddress;
		this.customerDetailedAddress = customerDetailedAddres;
		this.customerBirth = customerBirth;
	}

	public CustomerVO() {
		super();
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
	public String getCustomerPassword() {
		return customerPassword;
	}
	public void setCustomerPassword(String customerPassword) {
		this.customerPassword = customerPassword;
	}
	public String getCustomerEmail() {
		return customerEmail;
	}
	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}
	public String getCustomerTel() {
		return customerTel;
	}
	public void setCustomerTel(String customerTel) {
		this.customerTel = customerTel;
	}
	public String getCustomerPostNumber() {
		return customerPostNumber;
	}
	public void setCustomerPostNumber(String customerPostNumber) {
		this.customerPostNumber = customerPostNumber;
	}
	public String getCustomerAddress() {
		return customerAddress;
	}
	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}
	public String getCustomerDetailedAddres() {
		return customerDetailedAddress;
	}
	public void setCustomerDetailedAddres(String customerDetailedAddres) {
		this.customerDetailedAddress = customerDetailedAddres;
	}
	public String getCustomerBirth() {
		return customerBirth;
	}
	public void setCustomerBirth(String customerBirth) {
		this.customerBirth = customerBirth;
	}
	public String getCustomerRegdate() {
		return customerRegdate;
	}
	public void setCustomerRegdate(String customerRegdate) {
		this.customerRegdate = customerRegdate;
	}
	@Override
	public String toString() {
		return "CustomerVO [customerId=" + customerId + ", customerName=" + customerName + ", customerPassword="
				+ customerPassword + ", customerEmail=" + customerEmail + ", customerTel=" + customerTel
				+ ", customerPostNumber=" + customerPostNumber + ", customerAddress=" + customerAddress
				+ ", customerDetailedAddres=" + customerDetailedAddress + ", customerBirth=" + customerBirth
				+ ", customerRegdate=" + customerRegdate + "]";
	}
}
