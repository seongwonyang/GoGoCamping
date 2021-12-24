-- 전체 상품 리스트 조회 페이징(main)
select rnum, product_name, price, product_img
from (select p.*, row_number() over(order by product_name) as rnum from product p)
where rnum between 1 and 12

-- 대분류
select product_name, price, product_img, c.category_no, c.category_name
from product p, category c
where p.category_no = c.category_no
and c.category_name = '텐트/타프'
-- 페이징
select rnum, p.product_name, p.price, p.product_img, p.category_name, p.detail_category_name
from (
   select p.*, row_number() over(order by product_name) as rnum, c.category_name, c.detail_category_name
   from product p, category c where p.category_no=c.category_no and c.category_name='텐트/타프'
) p
where rnum between (2-1*12) and (2*12)

-- 대분류/소분류
select product_name, price, product_img, c.category_name, c.detail_category_name
from product p, category c
where p.category_no = c.category_no
and c.category_name = '텐트/타프'
and c.detail_category_name = '텐트'
-- 페이징
select rnum, p.product_name, p.price, p.product_img, p.category_name, p.detail_category_name
from (
   select p.*, row_number() over(order by product_name) as rnum, c.category_name, c.detail_category_name
   from product p, category c where p.category_no=c.category_no and c.category_name='텐트/타프' and c.detail_category_name = '텐트'
) p
where rnum between 1 and 12

-- 검색 페이징
select rnum, p.product_id p.product_name, p.price, p.product_img
from (
   select p.*, row_number() over(order by product_name) as rnum, c.category_name, c.detail_category_name
   from product p, category c where p.category_no=c.category_no and REPLACE(p.product_name, ' ', '') like '%루텐트%'
) p
where rnum between 1 and 12
-- 검색된 상품수
select count(*) from product
where REPLACE(product_name, ' ', '') like '%루텐트%'

-- 검색된 상품 정렬(높은가격순)
select rnum, p.product_name, p.price, p.product_img
from (
   select p.*, row_number() over(order by price desc) as rnum, c.category_name, c.detail_category_name
   from product p, category c where p.category_no=c.category_no and REPLACE(p.product_name, ' ', '') like '%텐트%'
) p

select * from seller;

-- 브랜드 리스트
select seller_id, brand from seller;
-- 브랜드별 상품수
select count(*) from seller where brand = '지프 JEEP'

-- 브랜드별 상품리스트 조회(높은 가격순)
select p.*, s.seller_id, s.seller_email, s.brand, s.seller_tel, c.*
from product p, seller s, category c
where p.seller_id = s.seller_id and p.category_no = c.category_no
and s.brand = '지프(JEEP)'
order by price desc

-- 브랜드별 카테고리 조회 (중복 제거)
select distinct c.category_name, s.brand
from product p, seller s, category c
where p.seller_id = s.seller_id and p.category_no = c.category_no
and s.brand = '지프(JEEP)'
order by c.category_name desc

-- 브랜드별 카테고리별 상품 조회
select s.brand, p.*, c.*
from product p, seller s, category c
where p.seller_id = s.seller_id and p.category_no = c.category_no
and s.brand = '지프(JEEP)' and c.category_name = '침낭/매트/해먹'
order by p.price

-- 브랜드별 카테고리별 상품수
select count(*)
from product p, seller s, category c
where p.seller_id = s.seller_id and p.category_no = c.category_no
and s.brand = '지프(JEEP)' and c.category_name = '침낭/매트/해먹'


-- 1220
-- 카테고리 조회 (헤더)
select category_no, category_name, detail_category_name from category

-- 카테고리 조회 (헤더 클릭 후 나타나는 소분류)
select *
from category
where category_name = '텐트/타프'

-- 카테고리별(대분류) 상품 리스트 조회 (페이징 포함)
select rnum, pc.category_no, pc.product_id, pc.product_name, pc.price, pc.product_img, pc.category_name, pc.detail_category_name
from (
   select p.*, c.category_name, c.detail_category_name, row_number() over(order by product_name) as rnum
   from product p, category c where p.category_no=c.category_no and c.category_name='침낭/매트/해먹'
) pc
where rnum between 1 and 12

-- 카테고리별(대분류) 상품수
select count(*)
from product p, seller s, category c
where p.seller_id = s.seller_id and p.category_no = c.category_no
and c.category_name = '침낭/매트/해먹'

-- 카테고리별(소분류) 상품 리스트 조회
select c.detail_category_name
from product p, category c
where p.category_no = c.category_no
and c.category_name = '텐트/타프'
and c.detail_category_name = '텐트'
order by price desc

-- 2차구현
-- 장바구니 담기
insert into cart(cart_no,product_count,customer_id,product_id)
values(cart_seq.nextval,2,'sehee167',1);

commit

select * from cart where customer_id = 'sehee167'

delete from cart where customer_id = 'customer' and product_id = 1

-- 장바구니에 같은 상품이 있는지 확인
select count(*) from cart where customer_id = 'customer' and product_id = 2

-- 장바구니에 같은 상품이 있을 경우
update cart set product_count = product_count+1 where customer_id = 'sehee167' and product_id = 1

select * from product

-- 장바구니 확인 (최신순)
select c.*, p.* from cart c, product p 
where c.product_id = p.product_id
and c.customer_id = 'sehee167'
order by c.cart_no desc

-- 장바구니에 담긴 상품 하나 가격
select p.price from cart c, product p 
where c.product_id = p.product_id
and cart_no = 23

-- 장바구니에 담긴 한 상품의 개수 
select product_count from cart
where cart_no = 23

-- 장바구니 상품 수량 변경
update cart set product_count = 5 where customer_id = 'customer' and product_id = 2

-- 장바구니에서 상품 삭제
delete from cart where customer_id = 'sehee167' and product_id = 1

-- 좋아요 하기
insert into likes(likes_no,customer_id,product_id)
values(likes_seq.nextval,'customer',1);

-- 좋아요 취소
delete from likes where customer_id = 'customer' and product_id = 1

-- 좋아요 확인 (최신순)
select l.*, p.* from likes l, product p 
where l.product_id=p.product_id 
and l.customer_id = 'customer' and p.product_id = 1
order by l.likes_no desc

-- 주문
select * from order_info


-- 주문 정보
insert into order_info(order_no,order_date,order_post_number,order_address,order_detailed_address,receiver_name,receiver_tel,payment,customer_id)
values(order_info_seq.nextval,sysdate,'00000','주문자 주소','주문자 상세주소','받는사람 이름','받는사람 번호','지불방법','customer');

-- 주문 상세 정보(상품)
insert into order_detail(order_detail_no, order_count, order_price, delivery_status, delivery_compldate, refund_check, order_no, product_id)
values(order_detail_seq.nextval,2,1500,'배송상태','배송완료날짜','0',1,1);

-- 상품 주문 시 재고량 변경 (주문한 상품 개수가 4개일 때)
update product set stock = stock - 4 where product_id = 2 and stock > 4

select * from product

select * from customer where customer_id = 'a'

delete from customer where customer_id = 'sehee167'

delete from order_info
delete from order_detail
delete from refund

-- 주문
-- 1. 재고량 비교 (select)
-- 2. order_info 에 주문 정보 삽입 (insert)
-- 3. order_detail 에 주문 상품 상세 정보 삽입 (insert)
-- 4. 재고량 감소 (update)
-- 5. 장바구니에서 주문한 상품 삭제 (delete)

select * from product where product_id = 1;
select * from cart where customer_id = 'customer'

-- 1. 재고량 비교 (select)
select stock from product where product_id = 1
-- 2. order_info 에 주문 정보 삽입 (insert)
insert into order_info(order_no,order_date,order_comment,order_post_number,order_address,order_detailed_address,receiver_name,receiver_tel,payment,customer_id)
values(order_info_seq.nextval,sysdate,'배송메시지','00000','주문자 주소','주문자 상세주소','받는사람 이름','받는사람 번호','지불방법','customer');
-- 3. order_detail 에 주문 상품 상세 정보 삽입 (insert)
insert into order_detail(order_detail_no, order_count, order_price, delivery_status, delivery_compldate, refund_check, order_no, product_id)
values(order_detail_seq.nextval,2,1500,'배송상태','배송완료날짜',0,1,1);
-- 4. 재고량 감소 (update)
update product set stock = stock - 1 where product_id = 1
-- 5. 장바구니에서 주문한 상품 삭제 (delete)
delete from cart where cart_no = 1 and cart_no = 2

alter table order_detail modify(delivery_compldate date)

delete from order_detail

