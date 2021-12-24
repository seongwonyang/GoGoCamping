package org.kosta.gogocamping.model.domain;

public class OrderDetailVO {
	private int orderDetailNo;
	private int orderCount;
	private int orderPrice;
	private String deliveryStatus;
	private String deliveryCompldate;
	private int refundCheck;
	private OrderInfoVO orderInfoVO;
	private ProductVO productVO;
	
	public OrderDetailVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public OrderDetailVO(int orderCount, int orderPrice, String deliveryStatus, String deliveryCompldate,
			int refundCheck, OrderInfoVO orderInfoVO, ProductVO productVO) {
		super();
		this.orderCount = orderCount;
		this.orderPrice = orderPrice;
		this.deliveryStatus = deliveryStatus;
		this.deliveryCompldate = deliveryCompldate;
		this.refundCheck = refundCheck;
		this.orderInfoVO = orderInfoVO;
		this.productVO = productVO;
	}

	public OrderDetailVO(int orderDetailNo, int orderCount, int orderPrice, String deliveryStatus,
			String deliveryCompldate, int refundCheck, OrderInfoVO orderInfoVO, ProductVO productVO) {
		super();
		this.orderDetailNo = orderDetailNo;
		this.orderCount = orderCount;
		this.orderPrice = orderPrice;
		this.deliveryStatus = deliveryStatus;
		this.deliveryCompldate = deliveryCompldate;
		this.refundCheck = refundCheck;
		this.orderInfoVO = orderInfoVO;
		this.productVO = productVO;
	}

	public int getOrderDetailNo() {
		return orderDetailNo;
	}

	public void setOrderDetailNo(int orderDetailNo) {
		this.orderDetailNo = orderDetailNo;
	}

	public int getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}

	public int getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}

	public String getDeliveryStatus() {
		return deliveryStatus;
	}

	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}

	public String getDeliveryCompldate() {
		return deliveryCompldate;
	}

	public void setDeliveryCompldate(String deliveryCompldate) {
		this.deliveryCompldate = deliveryCompldate;
	}

	public int getRefundCheck() {
		return refundCheck;
	}

	public void setRefundCheck(int refundCheck) {
		this.refundCheck = refundCheck;
	}

	public OrderInfoVO getOrderInfoVO() {
		return orderInfoVO;
	}

	public void setOrderInfoVO(OrderInfoVO orderInfoVO) {
		this.orderInfoVO = orderInfoVO;
	}

	public ProductVO getProductVO() {
		return productVO;
	}

	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}

	@Override
	public String toString() {
		return "OrderDetailVO [orderDetailNo=" + orderDetailNo + ", orderCount=" + orderCount + ", orderPrice="
				+ orderPrice + ", deliveryStatus=" + deliveryStatus + ", deliveryCompldate=" + deliveryCompldate
				+ ", refundCheck=" + refundCheck + ", orderInfoVO=" + orderInfoVO + ", productVO=" + productVO + "]";
	}
	
}
