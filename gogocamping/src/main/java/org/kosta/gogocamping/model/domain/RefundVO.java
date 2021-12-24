package org.kosta.gogocamping.model.domain;

public class RefundVO {
	private int refundNo;
	private String refundCategory;
	private String refundReason;
	private String refundReasonImg;
	private String refundRejectReason;
	private OrderDetailVO orderDetailVO;
	
	public RefundVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public RefundVO(String refundCategory, String refundReason, String refundReasonImg, String refundRejectReason,
			OrderDetailVO orderDetailVO) {
		super();
		this.refundCategory = refundCategory;
		this.refundReason = refundReason;
		this.refundReasonImg = refundReasonImg;
		this.refundRejectReason = refundRejectReason;
		this.orderDetailVO = orderDetailVO;
	}

	public RefundVO(int refundNo, String refundCategory, String refundReason, String refundReasonImg,
			String refundRejectReason, OrderDetailVO orderDetailVO) {
		super();
		this.refundNo = refundNo;
		this.refundCategory = refundCategory;
		this.refundReason = refundReason;
		this.refundReasonImg = refundReasonImg;
		this.refundRejectReason = refundRejectReason;
		this.orderDetailVO = orderDetailVO;
	}

	public int getRefundNo() {
		return refundNo;
	}

	public void setRefundNo(int refundNo) {
		this.refundNo = refundNo;
	}

	public String getRefundCategory() {
		return refundCategory;
	}

	public void setRefundCategory(String refundCategory) {
		this.refundCategory = refundCategory;
	}

	public String getRefundReason() {
		return refundReason;
	}

	public void setRefundReason(String refundReason) {
		this.refundReason = refundReason;
	}

	public String getRefundReasonImg() {
		return refundReasonImg;
	}

	public void setRefundReasonImg(String refundReasonImg) {
		this.refundReasonImg = refundReasonImg;
	}

	public String getRefundRejectReason() {
		return refundRejectReason;
	}

	public void setRefundRejectReason(String refundRejectReason) {
		this.refundRejectReason = refundRejectReason;
	}

	public OrderDetailVO getOrderDetailVO() {
		return orderDetailVO;
	}

	public void setOrderDetailVO(OrderDetailVO orderDetailVO) {
		this.orderDetailVO = orderDetailVO;
	}

	@Override
	public String toString() {
		return "RefundVO [refundNo=" + refundNo + ", refundCategory=" + refundCategory + ", refundReason="
				+ refundReason + ", refundReasonImg=" + refundReasonImg + ", refundRejectReason=" + refundRejectReason
				+ ", orderDetailVO=" + orderDetailVO + "]";
	}
	
}
