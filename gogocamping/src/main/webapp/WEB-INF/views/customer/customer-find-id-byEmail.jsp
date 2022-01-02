<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<body>
	 <div class="container">
         <div class="row h-100">
            <div class="col-lg-9 mx-auto text-center mt-7 mb-5">
               <div class="hero__search">
                        <div class="#">
                           <br><h3 style="font-weight: 700;">아이디 찾기</h3><br><br>
                           <form action="/customer/getCustomerIdByEmail" method="get">
                      		 	<input type="text" id="customerName" name="customerName" placeholder="  이름"  style="width: 444px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;"><br><br>
                        		<input type="text" id="customerEmail" name="customerEmail" placeholder="  이메일"  style="width: 444px; height: 50px; border: 2.5px solid #245207; border-radius: 10px;"><br><br>
                       			<button type="submit" class="site-btn" style="width: 444px; height: 50px; background-color: #245207; border-radius: 10px;">아이디 찾기</button><br><br>
                           </form>
                  </div>
               </div>
            </div>
         </div>
      </div>
</body>