package org.kosta.gogocamping.model.domain;

public class SellerVO {
	private String sellerId;
	private String sellerPassword;
	private String sellerName;
	private String sellerEmail;
	private String sellerTel;
	private String businessNumber;
	private String brand;
	private String logoImg;
	private String logoImgStored;
	private String sellerPostNumber;
	private String sellerAddress;
	private String sellerDetailedAddress;
	private int registerAdmin;
	
	public SellerVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SellerVO(String sellerId, String sellerPassword) {
		super();
		this.sellerId = sellerId;
		this.sellerPassword = sellerPassword;
	}
	public SellerVO(String sellerId, String sellerPassword, String sellerName, String sellerEmail, String sellerTel,
			String businessNumber, String brand, String logoImg, String logoImgStored, String sellerPostNumber,
			String sellerAddress, String sellerDetailedAddress, int registerAdmin) {
		super();
		this.sellerId = sellerId;
		this.sellerPassword = sellerPassword;
		this.sellerName = sellerName;
		this.sellerEmail = sellerEmail;
		this.sellerTel = sellerTel;
		this.businessNumber = businessNumber;
		this.brand = brand;
		this.logoImg = logoImg;
		this.logoImgStored = logoImgStored;
		this.sellerPostNumber = sellerPostNumber;
		this.sellerAddress = sellerAddress;
		this.sellerDetailedAddress = sellerDetailedAddress;
		this.registerAdmin = registerAdmin;
	}
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	public String getSellerPassword() {
		return sellerPassword;
	}
	public void setSellerPassword(String sellerPassword) {
		this.sellerPassword = sellerPassword;
	}
	public String getSellerName() {
		return sellerName;
	}
	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}
	public String getSellerEmail() {
		return sellerEmail;
	}
	public void setSellerEmail(String sellerEmail) {
		this.sellerEmail = sellerEmail;
	}
	public String getSellerTel() {
		return sellerTel;
	}
	public void setSellerTel(String sellerTel) {
		this.sellerTel = sellerTel;
	}
	public String getBusinessNumber() {
		return businessNumber;
	}
	public void setBusinessNumber(String businessNumber) {
		this.businessNumber = businessNumber;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getLogoImg() {
		return logoImg;
	}
	public void setLogoImg(String logoImg) {
		this.logoImg = logoImg;
	}
	public String getLogoImgStored() {
		return logoImgStored;
	}
	public void setLogoImgStored(String logoImgStored) {
		this.logoImgStored = logoImgStored;
	}
	public String getSellerPostNumber() {
		return sellerPostNumber;
	}
	public void setSellerPostNumber(String sellerPostNumber) {
		this.sellerPostNumber = sellerPostNumber;
	}
	public String getSellerAddress() {
		return sellerAddress;
	}
	public void setSellerAddress(String sellerAddress) {
		this.sellerAddress = sellerAddress;
	}
	public String getSellerDetailedAddress() {
		return sellerDetailedAddress;
	}
	public void setSellerDetailedAddress(String sellerDetailedAddress) {
		this.sellerDetailedAddress = sellerDetailedAddress;
	}
	public int getRegisterAdmin() {
		return registerAdmin;
	}
	public void setRegisterAdmin(int registerAdmin) {
		this.registerAdmin = registerAdmin;
	}
	@Override
	public String toString() {
		return "SellerVO [sellerId=" + sellerId + ", sellerPassword=" + sellerPassword + ", sellerName=" + sellerName
				+ ", sellerEmail=" + sellerEmail + ", sellerTel=" + sellerTel + ", businessNumber=" + businessNumber
				+ ", brand=" + brand + ", logoImg=" + logoImg + ", logoImgStored=" + logoImgStored
				+ ", sellerPostNumber=" + sellerPostNumber + ", sellerAddress=" + sellerAddress
				+ ", sellerDetailedAddress=" + sellerDetailedAddress + ", registerAdmin=" + registerAdmin + "]";
	}
}