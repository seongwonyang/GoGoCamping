<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
<div class="container"><hr><h2 style="text-align: center"><b>Review</b></h2><br>
<form action="/review/write" method="post" onsubmit="return checkOption()">
<input type="hidden" name="productId" value="${productId}">
	<div style="margin-bottom: 40px">
	  <select class="form-control" id="grade" name="grade">
	  	<option selected="selected" disabled="disabled" value="default">별점선택</option>
	    <option value="5">★★★★★</option>
	    <option value="4">★★★★</option>
	    <option value="3">★★★</option>
	    <option value="2">★★</option>
	    <option value="1">★</option>
	  </select><br>
	</div>
	<div class="form-group">
	  <textarea class="form-control" rows="7" name="reviewContent" id="reviewContent" placeholder="내용을 입력하세요." required="required"></textarea>
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
	let grade = document.getElementById("grade").value;
	if(grade == "default") {
		alert("별점을 선택하세요.");
		return false;	
	} else {
		return true;
	}
}
</script>
</body>

