package org.kosta.gogocamping.model.domain;

public class OrderInfoVO {
	private String orderNo;
	private String orderDate;
	private String orderComment;
	private String orderPostNumber;
	private String orderAddress;
	private String orderDetailedAddress;
	private String receiverName;
	private String receiverTel;
	private String payment;
	private CustomerVO customerVO;
	
	public OrderInfoVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderInfoVO(String orderNo, String orderDate, String orderComment, String orderPostNumber,
			String orderAddress, String orderDetailedAddress, String receiverName, String receiverTel, String payment,
			CustomerVO customerVO) {
		super();
		this.orderNo = orderNo;
		this.orderDate = orderDate;
		this.orderComment = orderComment;
		this.orderPostNumber = orderPostNumber;
		this.orderAddress = orderAddress;
		this.orderDetailedAddress = orderDetailedAddress;
		this.receiverName = receiverName;
		this.receiverTel = receiverTel;
		this.payment = payment;
		this.customerVO = customerVO;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderComment() {
		return orderComment;
	}

	public void setOrderComment(String orderComment) {
		this.orderComment = orderComment;
	}

	public String getOrderPostNumber() {
		return orderPostNumber;
	}

	public void setOrderPostNumber(String orderPostNumber) {
		this.orderPostNumber = orderPostNumber;
	}

	public String getOrderAddress() {
		return orderAddress;
	}

	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}

	public String getOrderDetailedAddress() {
		return orderDetailedAddress;
	}

	public void setOrderDetailedAddress(String orderDetailAddress) {
		this.orderDetailedAddress = orderDetailAddress;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	public String getReceiverTel() {
		return receiverTel;
	}

	public void setReceiverTel(String receiverTel) {
		this.receiverTel = receiverTel;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public CustomerVO getCustomerVO() {
		return customerVO;
	}

	public void setCustomerVO(CustomerVO customerVO) {
		this.customerVO = customerVO;
	}

	@Override
	public String toString() {
		return "OrderInfoVO [orderNo=" + orderNo + ", orderDate=" + orderDate + ", orderComment=" + orderComment
				+ ", orderPostNumber=" + orderPostNumber + ", orderAddress=" + orderAddress + ", orderDetailedAddress="
				+ orderDetailedAddress + ", receiverName=" + receiverName + ", receiverTel=" + receiverTel + ", payment="
				+ payment + ", customerVO=" + customerVO + "]";
	}

}
