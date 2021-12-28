<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
    <!-- Page Preloder -->
   <!--  <div id="preloder">
        <div class="loader"></div>
    </div> -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/camp.png">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Go Go Camping for ${sessionScope.loginVO.brand}</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-7">
                    <div class="product__discount">
                        <div class="section-title product__discount__title">
                            <h2>고객 문의 관리</h2>
                        </div>
                        <div class="row">
                    <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>제목</th>
                                    <th>고객 ID</th>
                                    <th>고객명</th>
                                    <th>상품명</th>
                                    <th>문의 종류</th>
                                    <th>답변 상태</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${getQnAList}" var="qna">
                                <tr>
                                    <td>
                                        ${qna.qnaNo}
                                        <form id="QnAAnswerForm2" action ="QnAAnswerForm" method="get">
                                        <input type="hidden" id="qnaNo" name="qnaNo" value="${qna.qnaNo}">
                                        </form>
                                    </td>
                                    <td>
                                        ${qna.title}
                                    </td>
                                    <td>
                                        ${qna.customerVO.customerId}
                                    </td>
                                    <td>
                                        ${qna.customerVO.customerName}
                                    </td>
                                    <td>
                                        ${qna.productVO.productName}
                                    </td>
                                    <td>
                                        ${qna.qnaCategory}
                                    </td>
                                    	
                                    <c:choose>
                                    <c:when test="${qna.answer == null}">
                                    	<td><a class="QnAAnswerbtn" data-qnano="${qna.qnaNo}"><button type="button" class="site-btn" style="background-color: #065E93; border-radius: 10px;">답변하기</button></a></td>
                                    </c:when>
                                    <c:otherwise>
                                    	<td><a class="QnAAnswerbtn" data-qnano="${qna.qnaNo}"><button type="button" class="site-btn" style="background-color: #065E93; border-radius: 10px;">답변수정</button></a></td>                                    
                                    </c:otherwise>
                                    </c:choose>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
                </div>
            </div>
        </div>
        </div>
    </section>
    <!-- Product Section End -->
  	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">
		$(function(){
			$(".QnAAnswerbtn").click(function(){
				var d = $("#qnaNo").val($(this).data('qnano'));
				$("#QnAAnswerForm2").submit();
			});
		});
	</script>
</body>
