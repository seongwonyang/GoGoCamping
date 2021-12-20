<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<body>
		<div class="container">
			<div class="row h-100">
				<div class="col-lg-9 mx-auto text-center mt-7 mb-5">
					<div class="hero__search">
						<div class="#">
							<br><h3 style="font-weight: 700;">상품 등록</h3> 
							<img style="width: 444px; height: 120px;" src="/static/image/seller_logo/${sessionScope.loginVO.logoImgStored}">
							<br>
							<input type="text" id="productName" name="productName" placeholder="  상품명" required="required" style="width: 444px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;"><br><br>
							<input type="number" id="price" name="price" placeholder="  가격" required="required" style="width: 444px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;"><br><br>
							<h5 style="font-weight: 700;">상품 사진 첨부</h5><br>
							<input type="file" id="productImg" name="productImg" placeholder="  상품 사진" required="required" style="font-weight: 700; width: 445px; padding: 10px 20px 10px; border: 2.5px solid #065E93; border-radius: 10px;" onchange="checkExt()"><br><br>
							<input type="text" id="productInfo" name="productInfo" placeholder="  상품 상세 정보" required="required" style="width: 444px; height: 200px; border: 2.5px solid #065E93; border-radius: 10px;"><br><br>
							<input type="number" id="stock" name="stock" placeholder="  재고량" required="required" style="width: 444px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;"><br><br>
							<button type="button" id="registerproductBtn" class="site-btn" style="width: 444px; height: 50px; background-color: #065E93; border-radius: 10px;">등록</button><br><br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>