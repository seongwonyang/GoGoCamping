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
							<form action="/seller/QnAAnswer" method="post">
							<c:forEach items="${getQnAListByNo}" var="qna">
								<input type="hidden" id="qnaNo" name="qnaNo" value="${qna.qnaNo}">
								<input type="text" id="title" name="title" value="${qna.title}" readonly="readonly" style="width: 444px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;"><br><br>
								<input type="text" id="customerId" name="customerId" value="${qna.customerVO.customerId}" readonly="readonly" style="width: 214px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;">&nbsp;&nbsp;&nbsp;
								<input type="text" id="customerName" name="customerName" value="${qna.customerVO.customerName}" readonly="readonly" style="width: 214px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;"><br><br>
								<input type="text" id="productName" name="productName" value="${qna.productVO.productName}" readonly="readonly" style="width: 214px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;">&nbsp;&nbsp;&nbsp;
								<input type="text" id="qnaCategory" name="qnaCategory" value="${qna.qnaCategory}" readonly="readonly" style="width: 214px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;"><br><br>
								<input type="text" id="content" name="content" value="${qna.content}" readonly="readonly" style="width: 444px; height: 200px; border: 2.5px solid #065E93; border-radius: 10px;"><br><br>
								<input type="text" id="answer" name="answer" value="${qna.answer}" placeholder="  답변" required="required" style="width: 444px; height: 200px; border: 2.5px solid #065E93; border-radius: 10px;"><br><br>							
								<button type="submit" id="answerQnABtn" class="site-btn" style="width: 444px; height: 50px; background-color: #065E93; border-radius: 10px;">답변 등록</button><br><br>
							</c:forEach>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>