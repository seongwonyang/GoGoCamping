insert into seller(seller_id, seller_name, seller_password, business_number, seller_email, brand, seller_tel, seller_post_number, seller_address, seller_detailed_address, register_admin)
values('jannu', '자누 판매자이름', 'a', '1', 'jannu@naver.com', 'JANNU' ,'jannu tel', 'jannu 우편번호', 'jannu 주소', 'jannu 상세주소', 0);

insert into seller(seller_id, seller_name, seller_password, business_number, seller_email, brand, seller_tel, seller_post_number, seller_address, seller_detailed_address, register_admin)
values('jeep', '지프 판매자이름', 'a', '1', 'jeep@naver.com', 'JEEP' ,'jeep tel', 'jeep 우편번호', 'jeep 주소', 'jeep 상세주소', 0);

insert into seller(seller_id, seller_name, seller_password, business_number, seller_email, brand, seller_tel, seller_post_number, seller_address, seller_detailed_address, register_admin)
values('campis', '캠피스 판매자이름', 'a', '1', 'campis@naver.com', 'Campis' ,'campis tel', 'campis 우편번호', 'campis 주소', 'campis 상세주소', 0);

insert into seller(seller_id, seller_name, seller_password, business_number, seller_email, brand, seller_tel, seller_post_number, seller_address, seller_detailed_address, register_admin)
values('luettbiden', '루엣비든 판매자이름', 'a', '1', 'luettbiden@naver.com', 'LuettBiden' ,'luettbiden tel', 'luettbiden 우편번호', 'luettbiden 주소', 'luettbiden 상세주소', 0);

insert into seller(seller_id, seller_name, seller_password, business_number, seller_email, brand, seller_tel, seller_post_number, seller_address, seller_detailed_address, register_admin)
values('eztraveler', '이지트레블러 판매자이름', 'a', '1', 'eztraveler@naver.com', 'Eztraveler' ,'eztraveler tel', 'eztraveler 우편번호', 'eztraveler 주소', 'eztraveler 상세주소', 0);

insert into seller(seller_id,seller_name,seller_password,business_number,seller_email,brand,seller_tel,seller_post_number,seller_address,seller_detailed_address,register_admin)
values('snowpeak','스노우피크 판매자이름','a','스노우피크 사업자번호','snowpeak@naver.com','스노우피크 Snowpeak','스노우피크 tel','스노우피크 주소','스노우피크 상세주소','스노우피크 우편번호',1);

insert into seller(seller_id,seller_name,seller_password,business_number,seller_email,brand,seller_tel,seller_post_number,seller_address,seller_detailed_address,register_admin)
values('montbell','몽벨 판매자이름','a','몽벨 사업자번호','montbell@naver.com','몽벨 Montbell','몽벨 tel','몽벨 주소','몽벨 상세주소','몽벨 우편번호',1);

insert into seller(seller_id,seller_name,seller_password,business_number,seller_email,brand,seller_tel,seller_post_number,seller_address,seller_detailed_address,register_admin)
values('coleman','콜맨 판매자이름','a','콜맨 사업자번호','coleman@naver.com','콜맨 Coleman','콜맨 tel','콜맨 주소','콜맨 상세주소','콜맨 우편번호',1);

insert into seller(seller_id,seller_name,seller_password,business_number,seller_email,brand,seller_tel,seller_post_number,seller_address,seller_detailed_address,register_admin)
values('durango','듀랑고 판매자이름','a','듀랑고 사업자번호','durango@naver.com','듀랑고 durango','듀랑고 tel','듀랑고 주소','듀랑고 상세주소','듀랑고 우편번호',1);

insert into seller(seller_id,seller_name,seller_password,business_number,seller_email,brand,seller_tel,seller_post_number,seller_address,seller_detailed_address,register_admin)
values('minimalworks','미니멀웍스 판매자이름','a','미니멀웍스 사업자번호','minimalworks@naver.com','미니멀웍스 minimalworks','미니멀웍스 tel','미니멀웍스 주소','미니멀웍스 상세주소','미니멀웍스 우편번호',1);


commit

delete from product;
delete from QnA;

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






