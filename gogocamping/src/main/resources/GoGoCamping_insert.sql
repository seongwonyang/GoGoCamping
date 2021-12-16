-- 관리자
insert into manager(manager_id,manager_name,manager_password)
values('manager','매니저','a');

-- 판매자
insert into seller(seller_id,seller_name,seller_password,business_number,seller_email,brand,seller_tel,seller_post_number,seller_address,seller_detailed_address,register_admin)
values('seller','판매자','a',1,'seller@naver.com','캠핑브랜드','010-0000-0000','00000','판매자 주소','판매자 상세주소',0)

-- 소비자
insert into customer(customer_id,customer_name,customer_password,customer_email,customer_tel,customer_post_number,customer_address,customer_detailed_address,customer_birth,customer_regdate)
values('customer','소비자','a','customer@naver.com','010-0000-0000','00000','소비자 주소','소비자 상세주소','1998-11-08',to_char(sysdate,'YYYY-MM-DD HH24:MI:SS'))

-- 카테고리
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'카테고리 이름','카테고리 상세 이름')

-- 상품
insert into product(product_id,product_name,price,product_info,stock,product_img,seller_id,category_no)
values(product_seq.nextval,'상품명',1500,'상품 설명~',10,'상품 이미지','seller',1)

-- 장바구니
insert into cart(cart_no,customer_id,product_id)
values(cart_seq.nextval,'customer',1)

-- 좋아요
insert into likes(likes_no,customer_id,product_id)
values(likes_seq.nextval,'customer',1)

-- 리뷰
insert into review(review_no,grade,review_content,review_regdate,customer_id,product_id)
values(review_seq.nextval,5,'리뷰내용',sysdate,'customer',1)

-- 주문 정보
insert into order_info(order_no,order_date,order_post_number,order_address,order_detailed_address,receiver_name,receiver_tel,payment,customer_id)
values(order_info_seq.nextval,to_date(sysdate,'YYYY-MM-DD HH24:MI:SS'),'00000','주문자 주소','주문자 상세주소','받는사람 이름','받는사람 번호','지불방법','customer')

-- 주문 상세 정보(상품)
insert into order_detail(order_detail_no, order_count, order_price, delivery_status, delivery_compldate, refund_check, order_no, product_id)
values(order_detail_seq.nextval,2,1500,'배송상태','배송완료날짜','0',1,1)

-- 환불
insert into refund(refund_no, refund_category, refund_reason, refund_reject_reason, refund_reason_img, order_detail_no)
values(refund_seq.nextval,'환불카테고리','환불이유','환불사진','환불거절사유',1)

-- QnA
insert into QnA(qna_no, qna_category, title, content, regdate, product_id, customer_id)
values(qna_seq.nextval,'질문카테고리','질문제목','질문내용',to_date(sysdate,'YYYY-MM-DD HH24:MI:SS'),1,'customer')


