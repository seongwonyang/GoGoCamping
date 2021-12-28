package org.kosta.gogocamping.model.domain;

public class QnAVO {
	private int qnaNo;
	private String qnaCategory;
	private String title;
	private String content;
	private String answer;
	private String regdate;
	private ProductVO productVO;
	private CustomerVO customerVO;
	
	public QnAVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public QnAVO(int qnaNo, String qnaCategory, String title, String content, String answer, String regdate,
			ProductVO productVO, CustomerVO customerVO) {
		super();
		this.qnaNo = qnaNo;
		this.qnaCategory = qnaCategory;
		this.title = title;
		this.content = content;
		this.answer = answer;
		this.regdate = regdate;
		this.productVO = productVO;
		this.customerVO = customerVO;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getQnaCategory() {
		return qnaCategory;
	}

	public void setQnaCategory(String qnaCategory) {
		this.qnaCategory = qnaCategory;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
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
		return "QnAVO [qnaNo=" + qnaNo + ", qnaCategory=" + qnaCategory + ", title=" + title + ", content=" + content
				+ ", answer=" + answer + ", regdate=" + regdate + ", productVO=" + productVO + ", customerVO="
				+ customerVO + "]";
	}
	
	
}
