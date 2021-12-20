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

commit

--------------------------------------------------------------------------------------------
-- 판매자

insert into seller(seller_id,seller_name,seller_password,business_number,seller_email,brand,seller_tel,seller_post_number,seller_address,seller_detailed_address,register_admin)
values('snowpeak','스노우피크 판매자이름','a','스노우피크 사업자번호','snowpeak@naver.com','스노우피크(Snowpeak)','스노우피크 tel','스노우피크 주소','스노우피크 상세주소','스노우피크 우편번호',1);

insert into seller(seller_id,seller_name,seller_password,business_number,seller_email,brand,seller_tel,seller_post_number,seller_address,seller_detailed_address,register_admin)
values('montbell','몽벨 판매자이름','a','몽벨 사업자번호','montbell@naver.com','몽벨(Montbell)','몽벨 tel','몽벨 주소','몽벨 상세주소','몽벨 우편번호',1);

insert into seller(seller_id,seller_name,seller_password,business_number,seller_email,brand,seller_tel,seller_post_number,seller_address,seller_detailed_address,register_admin)
values('coleman','콜맨 판매자이름','a','콜맨 사업자번호','coleman@naver.com','콜맨(Coleman)','콜맨 tel','콜맨 주소','콜맨 상세주소','콜맨 우편번호',1);

insert into seller(seller_id,seller_name,seller_password,business_number,seller_email,brand,seller_tel,seller_post_number,seller_address,seller_detailed_address,register_admin)
values('durango','듀랑고 판매자이름','a','듀랑고 사업자번호','durango@naver.com','듀랑고(durango)','듀랑고 tel','듀랑고 주소','듀랑고 상세주소','듀랑고 우편번호',1);

insert into seller(seller_id,seller_name,seller_password,business_number,seller_email,brand,seller_tel,seller_post_number,seller_address,seller_detailed_address,register_admin)
values('minimalworks','미니멀웍스 판매자이름','a','미니멀웍스 사업자번호','minimalworks@naver.com','미니멀웍스(minimalworks)','미니멀웍스 tel','미니멀웍스 주소','미니멀웍스 상세주소','미니멀웍스 우편번호',1);

insert into seller(seller_id, seller_name, seller_password, business_number, seller_email, brand, seller_tel, seller_post_number, seller_address, seller_detailed_address, register_admin)
values('jannu', '자누 판매자이름', 'a', '자누 사업자번호', 'jannu@naver.com', '자누(JANNU)' ,'jannu tel', 'jannu 우편번호', 'jannu 주소', 'jannu 상세주소', 0);

insert into seller(seller_id, seller_name, seller_password, business_number, seller_email, brand, seller_tel, seller_post_number, seller_address, seller_detailed_address, register_admin)
values('jeep', '지프 판매자이름', 'a', '지프 사업자번호', 'jeep@naver.com', '지프(JEEP)' ,'jeep tel', 'jeep 우편번호', 'jeep 주소', 'jeep 상세주소', 0);

insert into seller(seller_id, seller_name, seller_password, business_number, seller_email, brand, seller_tel, seller_post_number, seller_address, seller_detailed_address, register_admin)
values('campis', '캠피스 판매자이름', 'a', '캠피스 사업자번호', 'campis@naver.com', '캠피스(Campis)' ,'campis tel', 'campis 우편번호', 'campis 주소', 'campis 상세주소', 0);

insert into seller(seller_id, seller_name, seller_password, business_number, seller_email, brand, seller_tel, seller_post_number, seller_address, seller_detailed_address, register_admin)
values('luettbiden', '루엣비든 판매자이름', 'a', '루엣비든 사업자번호', 'luettbiden@naver.com', '루엣비든(LuettBiden)' ,'luettbiden tel', 'luettbiden 우편번호', 'luettbiden 주소', 'luettbiden 상세주소', 0);

insert into seller(seller_id, seller_name, seller_password, business_number, seller_email, brand, seller_tel, seller_post_number, seller_address, seller_detailed_address, register_admin)
values('eztraveler', '이지트레블러 판매자이름', 'a', '이지트레블러 사업자번호', 'eztraveler@naver.com', '이지트레블러(Eztraveler)' ,'eztraveler tel', 'eztraveler 우편번호', 'eztraveler 주소', 'eztraveler 상세주소', 0);

delete from seller

commit

-- 상품 insert

insert into product(product_id,product_name,price,product_info,stock,product_img,seller_id,category_no)
values(product_seq.nextval,'아스가르드 7.1 데님 텐트',1340000,'아스가르드 7.1 데님 텐트',30,'https://www.gocamp.co.kr/shop/data/goods/1637636524219s0.jpg','jannu', 32);

insert into product(product_id,product_name,price,product_info,stock,product_img,seller_id,category_no)
values(product_seq.nextval,'태프론아웃도어 압력밥솥',72000,'태프론아웃도어 압력밥솥',15,'https://www.gocamp.co.kr/shop/data/goods/1433302188_s_0.jpg','jannu', 49);

--
insert into product(product_id,product_name,price,product_info,stock,product_img,seller_id,category_no)
values(product_seq.nextval,'히트 3M 신슐레이트 페이일 카키',94500,'히트 3M 신슐레이트 페이일 카키',50,'https://www.gocamp.co.kr/shop/data/goods/1631179595873s0.jpg','jeep', 61);

insert into product(product_id,product_name,price,product_info,stock,product_img,seller_id,category_no)
values(product_seq.nextval,'그래니트 듀오 160 테이블',72000,'그래니트 듀오 160 테이블',40,'https://www.gocamp.co.kr/shop/data/goods/1433302188_s_0.jpg','jeep', 2);

--
insert into product(product_id,product_name,price,product_info,stock,product_img,seller_id,category_no)
values(product_seq.nextval,'ORO 스토퍼',8000,'ORO 스토퍼',50,'https://www.gocamp.co.kr/shop/data/goods/1630044312821s0.jpg','campis', 39);

insert into product(product_id,product_name,price,product_info,stock,product_img,seller_id,category_no)
values(product_seq.nextval,'코드슬링 B 2mm',14000,'코드슬링 B 2mm',40,'https://www.gocamp.co.kr/shop/data/goods/1629943531549s0.jpg','campis', 39);

--
insert into product(product_id,product_name,price,product_info,stock,product_img,seller_id,category_no)
values(product_seq.nextval,'캠핑용 캠프 애나멜웨어 세트',81000,'캠핑용 캠프 애나멜웨어 세트',100,'https://www.gocamp.co.kr/shop/data/goods/1630727152791s0.jpg','luettbiden', 51);

insert into product(product_id,product_name,price,product_info,stock,product_img,seller_id,category_no)
values(product_seq.nextval,'우드 플레잍 W1',31400,'우드 플레잍 W1',150,'https://www.gocamp.co.kr/shop/data/goods/1623466811717s0.jpg','luettbiden', 51);

--
insert into product(product_id,product_name,price,product_info,stock,product_img,seller_id,category_no)
values(product_seq.nextval,'쿠킹 테이블',144000,'쿠킹 테이블',80,'https://www.gocamp.co.kr/shop/data/goods/1592312381357s0.jpg','eztraveler', 7);

insert into product(product_id,product_name,price,product_info,stock,product_img,seller_id,category_no)
values(product_seq.nextval,'비스트로 DLX 실버',12700,'비스트로 DLX 실버',90,'https://www.gocamp.co.kr/shop/data/goods/14494594397s0.jpg','eztraveler', 7);

--
insert into product(product_id,product_name,price,product_info,stock,product_img,seller_id,category_no)
values(product_seq.nextval,'캠핑용 접이식 스모커 훈연기',372000,'캠핑용 접이식 스모커 훈연기',120,'https://www.gocamp.co.kr/shop/data/goods/1600422699281s0.jpg','snowpeak', 23);

insert into product(product_id,product_name,price,product_info,stock,product_img,seller_id,category_no)
values(product_seq.nextval,'엔틱 그릴 세트 M',48000,'엔틱 그릴 세트 M',150,'https://www.gocamp.co.kr/shop/data/goods/1528094209626s0.jpg','snowpeak', 23);

--
insert into product(product_id,product_name,price,product_info,stock,product_img,seller_id,category_no)
values(product_seq.nextval,'핵사 아이언 화로대 S',129000,'핵사 아이언 화로대 S',120,'https://www.gocamp.co.kr/shop/data/goods/163342369839s0.jpg','montbell', 21);

insert into product(product_id,product_name,price,product_info,stock,product_img,seller_id,category_no)
values(product_seq.nextval,'화로대 그릴 세트',83000,'화로대 그릴 세트',150,'https://www.gocamp.co.kr/shop/data/goods/1589349514272s0.jpg','montbell', 21);

--
insert into product(product_id,product_name,price,product_info,stock,product_img,seller_id,category_no)
values(product_seq.nextval,'큐브 UL8 블랙 V2',111350,'큐브 UL8 블랙 V2',50,'https://www.gocamp.co.kr/shop/data/goods/1637297080399s0.jpg','coleman', 33);

insert into product(product_id,product_name,price,product_info,stock,product_img,seller_id,category_no)
values(product_seq.nextval,'에어로베이스 4 에어쉘터',735250,'에어로베이스 4 에어쉘터',200,'https://www.gocamp.co.kr/shop/data/goods/1603515745243s0.jpg','coleman', 33);

--
insert into product(product_id,product_name,price,product_info,stock,product_img,seller_id,category_no)
values(product_seq.nextval,'더블네스트 해먹 프린트',112000,'더블네스트 해먹 프린트',200,'https://www.gocamp.co.kr/shop/data/goods/1615539079297s0.jpg','durango', 66);

insert into product(product_id,product_name,price,product_info,stock,product_img,seller_id,category_no)
values(product_seq.nextval,'정글 네트 해먹 세트',146250,'정글 네트 해먹 세트',180,'https://www.gocamp.co.kr/shop/data/goods/1587094609796s0.jpg','durango', 66);

--
insert into product(product_id,product_name,price,product_info,stock,product_img,seller_id,category_no)
values(product_seq.nextval,'투스카니 420 카페트',142800,'투스카니 420 카페트',200,'https://www.gocamp.co.kr/shop/data/goods/1618823490837s0.jpg','minimalworks', 42);

insert into product(product_id,product_name,price,product_info,stock,product_img,seller_id,category_no)
values(product_seq.nextval,'발렌시아 650 XL',150450,'발렌시아 650 XL',180,'https://www.gocamp.co.kr/shop/data/goods/1593488169980s0.jpg','minimalworks', 42);



