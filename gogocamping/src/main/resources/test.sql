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
-- 장바구니 추가
insert into cart(cart_no,product_count,customer_id,product_id)
values(cart_seq.nextval,1,'customer',1);

-- 장바구니에 같은 상품이 있을 경우
update cart set product_count = product_count+1 where customer_id = 'customer' and product_id = 1

-- 장바구니 확인 (최신순)
select c.*, p.* from cart c, product p 
where c.product_id = p.product_id
and c.customer_id = 'customer' and p.product_id = 1
order by c.cart_no desc

-- 장바구니 상품 수량 변경
update cart set product_count = 5 where customer_id = 'customer' and product_id = 1

-- 장바구니에서 상품 삭제
delete from cart where customer_id = 'customer' and product_id = 1


-- 좋아요 하기
insert into likes(likes_no,customer_id,product_id)
values(likes_seq.nextval,'java',1);

select * from likes

-- 좋아요 취소
delete from likes where customer_id = 'customer' and product_id = 1

-- 좋아요 확인 (최신순)
select l.likes_no, l.customer_id, p.product_id,p.product_name,p.price,p.product_img
from likes l, product p 
where l.product_id=p.product_id 
and l.customer_id = 'customer'
order by l.likes_no desc

select l.likes_no, l.customer_id, p.product_id,p.product_name,p.price,p.product_img
	from likes l, product p 
	where l.product_id=p.product_id 
	and l.customer_id = 'customer'
	order by l.likes_no desc
-- 주문 

-- 주문내역 확인

-- 주문 취소


















