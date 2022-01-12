package org.kosta.gogocamping.model.domain;

public class ReviewVO {
	private int reviewNo;
	private int grade;
	private String reviewContent;
	private String reviewRegdate;
	private ProductVO productVO;
	private CustomerVO customerVO;
	
	public ReviewVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReviewVO(int reviewNo, int grade, String reviewContent, String reviewRegdate, CustomerVO customerVO,
			ProductVO productVO) {
		super();
		this.reviewNo = reviewNo;
		this.grade = grade;
		this.reviewContent = reviewContent;
		this.reviewRegdate = reviewRegdate;
		this.customerVO = customerVO;
		this.productVO = productVO;
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

	public CustomerVO getCustomerVO() {
		return customerVO;
	}

	public void setCustomerVO(CustomerVO customerVO) {
		this.customerVO = customerVO;
	}

	public ProductVO getProductVO() {
		return productVO;
	}

	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}

	@Override
	public String toString() {
		return "ReviewVO [reviewNo=" + reviewNo + ", grade=" + grade + ", reviewContent=" + reviewContent
				+ ", reviewRegdate=" + reviewRegdate + ", customerVO=" + customerVO + ", productVO=" + productVO + "]";
	}
	
}
