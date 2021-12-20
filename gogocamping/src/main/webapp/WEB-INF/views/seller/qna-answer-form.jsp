<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<body>
		<div class="container">
			<div class="row h-100">
				<div class="col-lg-9 mx-auto text-center mt-7 mb-5">
					<div class="hero__search">
						<div class="#">
							<br><h3 style="font-weight: 700;">고객 문의 답변</h3><br><br>
							<input type="text" id="title" name="title" placeholder="  제목" readonly="readonly" style="width: 444px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;"><br><br>
							<input type="text" id="customerId" name="customerId" placeholder="  고객 ID" readonly="readonly" style="width: 100px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;">&nbsp;&nbsp;&nbsp;
							<input type="text" id="customerName" name="customerName" placeholder="  고객명" readonly="readonly" style="width: 100px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;">&nbsp;&nbsp;&nbsp;
							<input type="text" id="productName" name="productName" placeholder="  상품명" readonly="readonly" style="width: 100px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;">&nbsp;&nbsp;&nbsp;
							<input type="text" id="qnaCategory" name="qnaCategory" placeholder="  문의 종류" readonly="readonly" style="width: 100px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;"><br><br>
							<input type="text" id="qnaContent" name="qnaContent" placeholder="  문의 내용" readonly="readonly" style="width: 444px; height: 200px; border: 2.5px solid #065E93; border-radius: 10px;"><br><br>
							<input type="text" id="qnaAnswer" name="qnaAnswer" placeholder="  답변 내용" readonly="readonly" style="width: 444px; height: 200px; border: 2.5px solid #065E93; border-radius: 10px;"><br><br>							
							<button type="button" id="registerproductBtn" class="site-btn" style="width: 444px; height: 50px; background-color: #065E93; border-radius: 10px;">답변 등록</button><br><br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>