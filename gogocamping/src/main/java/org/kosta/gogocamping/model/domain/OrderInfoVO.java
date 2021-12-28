package org.kosta.gogocamping.model.domain;

public class OrderInfoVO {
	private int orderNo;
	private String orderDate;
	private String orderPostNumber;
	private String orderAddress;
	private String orderDetailedAddress;
	private String receiverName;
	private String receiverTel;
	private String payment;
	private CustomerVO customerVO;
	public OrderInfoVO() {
		super();
	}
	public OrderInfoVO(int orderNo, String orderDate, String orderPostNumber, String orderAddress,
			String orderDetailedAddress, String receiverName, String receiverTel, String payment,
			CustomerVO customerVO) {
		super();
		this.orderNo = orderNo;
		this.orderDate = orderDate;
		this.orderPostNumber = orderPostNumber;
		this.orderAddress = orderAddress;
		this.orderDetailedAddress = orderDetailedAddress;
		this.receiverName = receiverName;
		this.receiverTel = receiverTel;
		this.payment = payment;
		this.customerVO = customerVO;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
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
	public void setOrderDetailedAddress(String orderDetailedAddress) {
		this.orderDetailedAddress = orderDetailedAddress;
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
		return "OrderInfoVO [orderNo=" + orderNo + ", orderDate=" + orderDate + ", orderPostNumber=" + orderPostNumber
				+ ", orderAddress=" + orderAddress + ", orderDetailedAddress=" + orderDetailedAddress
				+ ", receiverName=" + receiverName + ", receiverTel=" + receiverTel + ", payment=" + payment
				+ ", customerVO=" + customerVO + "]";
	}
}
