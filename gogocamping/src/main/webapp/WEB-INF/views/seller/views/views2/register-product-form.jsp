<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<body>
		<div class="container">
			<div class="row h-100">
				<div class="col-lg-9 mx-auto text-center mt-7 mb-5">
					<div class="hero__search">
						<form method="post" action="/seller/registerProduct" enctype="multipart/form-data">
							<br><h3 style="font-weight: 700;">상품 등록</h3><br><br>
							<div class="filter__sort">
	                            <select id="categorySelect">
	                               <c:forEach items="${categoryList }" var="category">
	                                  <option value="${category.categoryName }">${category.categoryName }</option>
	                                 </c:forEach>
	                            </select>
	                            <select id = "categorySelectDetail" name="categorySelectDetail" style="border: 2.5px solid #065E93; border-radius: 10px;">
	                            </select>
	                        </div>
							<img style="width: 444px; height: 120px;" src="/static/image/seller_logo/${sessionScope.sellerVO.logoImgStored}">
							<br><br>
							<input type="text" id="productName" name="productName" placeholder="  상품명" required="required" style="width: 444px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;"><br><br>
							<input type="number" id="price" name="price" placeholder="  가격" required="required" style="width: 444px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;"><br><br>
							<h5 style="font-weight: 700;">상품 사진 첨부</h5><br>
							<input type="file" id="productImg" name="productImg" placeholder="  상품 사진" required="required" style="font-weight: 700; width: 445px; padding: 10px 20px 10px; border: 2.5px solid #065E93; border-radius: 10px;" onchange="readURL(this)"><br>
							<span>이미지 미리보기</span><br>
							<img id="imgPreview" style="width: 444px; height: 400px; border: 2.5px solid #065E93; border-radius: 10px;"><br><br>
							<input type="text" id="productInfo" name="productInfo" placeholder="  상품 상세 정보" required="required" style="width: 444px; height: 200px; border: 2.5px solid #065E93; border-radius: 10px;"><br><br>
							<input type="number" id="stock" name="stock" placeholder="  재고량" required="required" style="width: 444px; height: 50px; border: 2.5px solid #065E93; border-radius: 10px;"><br><br>
							<button type="submit" id="registerproductBtn" class="site-btn" style="width: 444px; height: 50px; background-color: #065E93; border-radius: 10px;">등록</button><br><br>
						</form>
					</div>
				</div>
			</div>
		</div>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script type="text/javascript">
		$(function(){
				$("#categorySelect").change(function(){
			    	var category = $("#categorySelect").val();
			    	$("#categorySelectDetail").empty();
			    	$.ajax({
			        type:"get",
			        url:"/category/getDetailCategoryList",
			        dataType:"json",
			        data: "category="+category,
			        success : function(detailCategoryList){
			           var option = "";
			           $.each(detailCategoryList, function(idx, val){
			              option += "<option value=\'"+val+"\'>"+val+"</option>";
			           });
			           $("#categorySelectDetail").append(option);
			           $("#categorySelectDetail").show();
		      		} // success
				}); // ajax
			}); // change
		}); // ready
		function readURL(input) {
			if (input.files && input.files[0]) {
			    var reader = new FileReader();
			    reader.onload = function(e) {
			      document.getElementById('imgPreview').src = e.target.result;
			    };
			    reader.readAsDataURL(input.files[0]);
			  } else {
			    document.getElementById('imgPreview').src = "";
			}
		}
		</script>
	</body>
</html>


