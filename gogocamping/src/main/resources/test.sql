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

delete from category where category_name = '카테고리 이름';



select i.order_date, d.order_count, d.order_price, d.delivery_status, d.refund_check
from order_info i , order_detail d
where i.order_no = d.order_no

--주문개수 조회
select count(*) 
from (select TO_CHAR(o.order_date, 'yyyy/mm/dd'), o.order_count, o.order_price, o.delivery_status, o.refund_check, p.product_name, p.product_img
from (select i.order_date, i.customer_id, d.order_count, d.order_price, d.delivery_status, d.refund_check, d.product_id
from order_info i , order_detail d
where i.order_no = d.order_no) o, product p
where o.product_id = p.product_id
and o.customer_id='test2')

--주문조회
select TO_CHAR(o.order_date, 'yyyy/mm/dd'), o.order_count, o.order_price, o.delivery_status, o.refund_check, p.product_name, p.product_img
from (select i.order_date, i.customer_id, d.order_count, d.order_price, d.delivery_status, d.refund_check, d.product_id
from order_info i , order_detail d
where i.order_no = d.order_no) o, product p
where o.product_id = p.product_id
and o.customer_id='test2'

--test
select i.order_date, i.customer_id, d.order_count, d.order_price, d.delivery_status, d.refund_check, d.product_id
from order_info i , order_detail d
where i.order_no = d.order_no

--
update order_detail set refund_check = 1 where order_detail_no = 1

select * from product where product_id = 1;

-- QnA
-- 문의 유형 : 상품문의/배송문의
insert into QnA(qna_no, qna_category, title, content, regdate, product_id, customer_id)
values(qna_seq.nextval,'상품문의','상품문의2','질문내용',sysdate,1,'sehee167');
insert into QnA(qna_no, qna_category, title, content, regdate, product_id, customer_id)
values(qna_seq.nextval,'배송문의','배송문의2','질문내용',sysdate,1,'sehee167');

-- 문의 유형 별 게시물 조회
select row_number() over(order by regdate) as rnum, q.*, c.* from qna q, customer c 
where q.customer_id = c.customer_id and qna_category = '상품문의';

select count(*) from qna where product_id = 1;

-- review 
select * from review order by grade desc -- 별점 높은순
select * from review order by grade -- 별점 낮은순
select * from review order by review_regdate desc -- 최신순



insert into review(review_no,grade,review_content,review_regdate,customer_id,product_id)
values(review_seq.nextval,5,'리뷰내용1',sysdate,'sehee167',1);

insert into review(review_no,grade,review_content,review_regdate,customer_id,product_id)
values(review_seq.nextval,3,'리뷰내용2',sysdate,'sehee167',1);

