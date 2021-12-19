-- 관리자
insert into manager(manager_id,manager_name,manager_password)
values('manager','매니저','a');

-- 판매자
insert into seller(seller_id,seller_name,seller_password,business_number,seller_email,brand,seller_tel,seller_post_number,seller_address,seller_detailed_address,register_admin)
values('seller','판매자','a',1,'seller@naver.com','캠핑브랜드','010-0000-0000','00000','판매자 주소','판매자 상세주소',0);

-- 소비자
insert into customer(customer_id,customer_name,customer_password,customer_email,customer_tel,customer_post_number,customer_address,customer_detailed_address,customer_birth,customer_regdate)

values('customer','소비자','a','customer@naver.com','010-0000-0000','00000','소비자 주소','소비자 상세주소','1998-11-08',to_date(sysdate,'YYYY-MM-DD HH24:MI:SS'));

-- 카테고리
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'카테고리 이름','카테고리 상세 이름');

-- 상품
insert into product(product_id,product_name,price,product_info,stock,product_img,seller_id,category_no)
values(product_seq.nextval,'상품명',1500,'상품 설명~',10,'상품 이미지','seller',1);

-- 장바구니
insert into cart(cart_no,customer_id,product_id)
values(cart_seq.nextval,'customer',1);

-- 좋아요
insert into likes(likes_no,customer_id,product_id)
values(likes_seq.nextval,'customer',1);

-- 리뷰
insert into review(review_no,grade,review_content,review_regdate,customer_id,product_id)
values(review_seq.nextval,5,'리뷰내용',sysdate,'customer',1);

-- 주문 정보
insert into order_info(order_no,order_date,order_post_number,order_address,order_detailed_address,receiver_name,receiver_tel,payment,customer_id)
values(order_info_seq.nextval,to_date(sysdate,'YYYY-MM-DD HH24:MI:SS'),'00000','주문자 주소','주문자 상세주소','받는사람 이름','받는사람 번호','지불방법','customer');

-- 주문 상세 정보(상품)
insert into order_detail(order_detail_no, order_count, order_price, delivery_status, delivery_compldate, refund_check, order_no, product_id)
values(order_detail_seq.nextval,2,1500,'배송상태','배송완료날짜','0',1,1);

-- 환불
insert into refund(refund_no, refund_category, refund_reason, refund_reject_reason, refund_reason_img, order_detail_no)
values(refund_seq.nextval,'환불카테고리','환불이유','환불사진','환불거절사유',1);

-- QnA
insert into QnA(qna_no, qna_category, title, content, regdate, product_id, customer_id)
values(qna_seq.nextval,'질문카테고리','질문제목','질문내용',to_date(sysdate,'YYYY-MM-DD HH24:MI:SS'),1,'customer');



------------------------------------------------

-- 카테고리 데이터

-- 의자/테이블/침대

insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'의자/테이블/침대','캠핑테이블');

insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'의자/테이블/침대','롤테이블');

insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'의자/테이블/침대','캠핑테이블(로우)');

insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'의자/테이블/침대','경량테이블');

insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'의자/테이블/침대','화로테이블');

insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'의자/테이블/침대','키친테이블');

insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'의자/테이블/침대','캠핑미니테이블');

insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'의자/테이블/침대','테이블과 의자세트');

insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'의자/테이블/침대','캐비넷/캠핑박스');

insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'의자/테이블/침대','시스템 테이블');

insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'의자/테이블/침대','의자');

insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'의자/테이블/침대','야전침대');

insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'의자/테이블/침대','스탠드/거치대');

insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'의자/테이블/침대','퍼니쳐 주변기기');

insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'의자/테이블/침대','퍼니쳐 수납가방');



---------------------------------------

--랜턴/화로/연료
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'랜턴/화로/연료','캠핑랜턴');

insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'랜턴/화로/연료','헤드랜턴');

insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'랜턴/화로/연료','후레쉬(손전등)');

insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'랜턴/화로/연료','랜턴스탠드 및 액세서리');

insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'랜턴/화로/연료','화로대');

insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'랜턴/화로/연료','미니화로대');

insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'랜턴/화로/연료','바베큐/그릴');

insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'랜턴/화로/연료','바베큐용품');

insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'랜턴/화로/연료','더치오븐');

insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'랜턴/화로/연료','화로대/BBQ_주변기기');

insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'랜턴/화로/연료','연료');

insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'랜턴/화로/연료','토치');

insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'랜턴/화로/연료','헤드랜턴 액세서리');

insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'랜턴/화로/연료','기어케이스');

insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'랜턴/화로/연료','전기용품/배터리');

--------------------------------------------------------------

--텐트/타프

insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'텐트/타프','텐트');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'텐트/타프','쉘터/어닝/리빙쉘');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'텐트/타프','타프');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'텐트/타프','타프스크린/바람막이');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'텐트/타프','TPU창/도어');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'텐트/타프','폴대/지퍼손잡이');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'텐트/타프','텐트펙(단조펙)');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'텐트/타프','스토퍼(비너),로프');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'텐트/타프','공구(망치/도끼/삽/톱/기타)');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'텐트/타프','그라운드시트/방수포');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'텐트/타프','텐트 카페트');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'텐트/타프','데이지체인/탄성끈');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'텐트/타프','폴대/펙/툴 케이스');

---------------------------------------------------------------------------

--버너/코펠/주방용품

insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'버너/코펠/주방용품','버너');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'버너/코펠/주방용품','버너+코펠 세트');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'버너/코펠/주방용품','코펠');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'버너/코펠/주방용품','주전자,드리퍼');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'버너/코펠/주방용품','압력밥솥');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'버너/코펠/주방용품','후라이팬/철판/토스트기');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'버너/코펠/주방용품','주방용품');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'버너/코펠/주방용품','컵/숟가락/포크/젓가락');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'버너/코펠/주방용품','아이스박스(쿨러)');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'버너/코펠/주방용품','보온보냉백');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'버너/코펠/주방용품','버너거치대/바람막이/소품');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'버너/코펠/주방용품','방열시트');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'버너/코펠/주방용품','물통/보온병/정수기');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'버너/코펠/주방용품','도시락');

insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'침낭/매트/해먹','침낭');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'침낭/매트/해먹','매트');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'침낭/매트/해먹','침낭+매트 세트상품');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'침낭/매트/해먹','베개/쿠션');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'침낭/매트/해먹','침낭라이너');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'침낭/매트/해먹','방석');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'침낭/매트/해먹','담요');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'침낭/매트/해먹','해먹(그물침대)');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'침낭/매트/해먹','해먹관련용품');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'침낭/매트/해먹','야외돗자리(카페트)');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'침낭/매트/해먹','목베개');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'침낭/매트/해먹','에어펌프');
insert into category(category_no,category_name,detail_category_name)
values(category_seq.nextval,'침낭/매트/해먹','침낭/매트/베개 커버');


--------------------------------------------------------------------------------------------
select * from category;
-- product
insert into product(product_id,product_name,price,product_info,stock,product_img,seller_id,category_no)
values(product_seq.nextval,'데님텐트',1500000,'상품 설명~',12,'상품 이미지','seller',31);
insert into product(product_id,product_name,price,product_info,stock,product_img,seller_id,category_no)
values(product_seq.nextval,'모로칸 블루 텐트',175100,'상품 설명~',10,'상품 이미지','seller',31);
insert into product(product_id,product_name,price,product_info,stock,product_img,seller_id,category_no)
values(product_seq.nextval,'캠핑 여행용 코펠',211650,'상품 설명~',20,'상품 이미지','seller',46);
insert into product(product_id,product_name,price,product_info,stock,product_img,seller_id,category_no)
values(product_seq.nextval,'[트라우마] 알파인 1300D',500000,'상품 설명~',10,'상품 이미지','seller',58);
insert into product(product_id,product_name,price,product_info,stock,product_img,seller_id,category_no)
values(product_seq.nextval,'화로대 그릴 세트 M',83000,'상품 설명~',10,'상품 이미지','seller',20);
insert into product(product_id,product_name,price,product_info,stock,product_img,seller_id,category_no)
values(product_seq.nextval,'파이어 캐슬 옵션 그릴',86000,'상품 설명~',10,'상품 이미지','seller',20);






















