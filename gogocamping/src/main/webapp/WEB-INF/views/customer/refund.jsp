<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- <fmt:formatNumber value="${price}" pattern="#,###" /> -->
<body>
	<div class="container">
		<div class="row h-100">
			<div class="col-lg-9 mx-auto text-center mt-7 mb-5">
				<div class="hero__search">				
					<form method="post" action="/refund/write" enctype="multipart/form-data" onsubmit="return checkOption()">
					   <input type="hidden" name="orderDetailNo" id="orderDetailNo" value="${refundProduct.orderDetailNo }">
					   <div style="margin-bottom: 40px" >
					   	 <h4><b>${refundProduct.productVO.productName }</b></h4><br>
					   	 <h5>주문 금액 : <fmt:formatNumber value="${refundProduct.productVO.price }" pattern="#,###" />원</h5><br>
					     <select class="form-control" id="refundCategory" name="refundCategory">
					        <option selected="selected" disabled="disabled" value="default">환불사유</option>
					        <option value="상품문의">제품불량</option>
					        <option value="배송문의">단순변심</option>
					     </select><br>
					   </div>
					   <div class="form-group">
					     <textarea class="form-control" rows="8" name="refundReason" id="refundReason" placeholder="환뷸 사유를 자세하게 기입해주세요." required="required"></textarea>
					   </div>
					   <div style="text-align: right;">
					      <button type="submit" class="btn btn-light">등록</button>
					      <button type="button" class="btn btn-light" onclick="window.history.back()">취소</button><br><br>
					   </div>
					</form>
				</div>
			</div>
		</div>
	</div>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function checkOption(){
		var option = document.getElementById("refundCategory").value;
		if(option=='default') {
			alert('환불 사유를 선택해주세요.');
			return false;
		}else{
			return true;
		}
	}
</script>
</body>


