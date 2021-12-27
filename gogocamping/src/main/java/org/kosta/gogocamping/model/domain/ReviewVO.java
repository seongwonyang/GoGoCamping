package org.kosta.gogocamping.model.domain;

public class ReviewVO {
	private int reviewNo;
	private int grade;
	private String reviewImg;
	private String reviewContent;
	private String reviewRegdate;
	private String customerId;
	private int productId;
	private ProductVO productVO;
	private SellerVO sellerVO;
	public ReviewVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ReviewVO(int reviewNo, int grade, String reviewImg, String reviewContent, String reviewRegdate,
			String customerId, int productId, ProductVO productVO, SellerVO sellerVO) {
		super();
		this.reviewNo = reviewNo;
		this.grade = grade;
		this.reviewImg = reviewImg;
		this.reviewContent = reviewContent;
		this.reviewRegdate = reviewRegdate;
		this.customerId = customerId;
		this.productId = productId;
		this.productVO = productVO;
		this.sellerVO = sellerVO;
	}

	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getReviewImg() {
		return reviewImg;
	}
	public void setReviewImg(String reviewImg) {
		this.reviewImg = reviewImg;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getReviewRegdate() {
		return reviewRegdate;
	}
	public void setReviewRegdate(String reviewRegdate) {
		this.reviewRegdate = reviewRegdate;
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
	
	public SellerVO getSellerVO() {
		return sellerVO;
	}
	public void setSellerVO(SellerVO sellerVO) {
		this.sellerVO = sellerVO;
	}
	@Override
	public String toString() {
		return "ReviewVO [reviewNo=" + reviewNo + ", grade=" + grade + ", reviewImg=" + reviewImg + ", reviewContent="
				+ reviewContent + ", reviewRegdate=" + reviewRegdate + ", customerId=" + customerId + ", productId="
				+ productId + ", productVO=" + productVO + ", sellerVO=" + sellerVO + "]";
	}
	
}
