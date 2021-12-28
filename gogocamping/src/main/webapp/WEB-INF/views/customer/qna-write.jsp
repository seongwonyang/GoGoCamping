<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
<div class="container"><hr><h2 style="text-align: center"><b>QnA</b></h2><br>
<form action="writeQuestion" method="post" onsubmit="return checkOption()">
<input type="hidden" name="productId" value="${productId}">
	<div style="margin-bottom: 40px">
	  <select class="form-control" id="qnaOption" name="qnaCategory">
	  	<option selected="selected" disabled="disabled" value="default">문의유형</option>
	    <option value="상품문의">상품문의</option>
	    <option value="배송문의">배송문의</option>
	  </select><br>
	</div>
	<div class="form-group">
	  <input style="f outline-style: none; outline: none;" type="text" class="form-control" name="title" id="qnaTitle" placeholder="제목을 입력하세요." required="required">
	</div>
	<div class="form-group">
	  <textarea class="form-control" rows="8" name="content" id="qnaContent" placeholder="이곳은 상품 및 배송 문의를 위한 게시판입니다.&#13;&#10;배송 전 취소는 주문 조회 페이지를 통해 요청해주세요!" required="required"></textarea>
	</div>
	<div style="text-align: right;">
		<button type="submit" class="btn btn-light">등록</button>
		<button type="button" class="btn btn-light" onclick="window.history.back()">취소</button><br><br>
	</div>
</form>
</div>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
function checkOption(){
	let qnaOption = document.getElementById("qnaOption").value;
	if(qnaOption == "default") {
		alert("문의 유형을 선택하세요.");
		return false;	
	} else {
		return true;
	}
}
</script>
</body>

