
select customer_id, customer_name, customer_email, customer_tel, customer_post_number, customer_address, customer_detailed_address, customer_birth
from customer
where customer_id='customer'
and customer_password='a'
select*from customer where customer_id='customer';
select count(*) from customer

select product_name, price, product_img, category_no
from product
where category_no=31

select * from product


-- 카테고리별 상품 조회 selectProductByCategory 

-- 메인, 전체 상품 리스트 페이징
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
   select p.*, row_number() over(order by product_name asc) as rnum, c.category_name, c.detail_category_name
   from product p, category c where p.category_no=c.category_no and c.category_name='텐트/타프'
) p
where rnum between (2-1*12) and (2*12)

-- 대분류/소분류
select product_name, price, product_img, c.category_name, c.detail_category_name
from product p, category c
where p.category_no = c.category_no
and c.category_name = '텐트/타프'
and c.detail_category_name = '텐트'

select *
from category
where category_name='텐트/타프'

	select *
	from product p, category c
	where p.category_no=c.category_no
	and c.category_name='텐트/타프'

select * from category
-- 페이징
select rnum, p.product_name, p.price, p.product_img, p.category_name, p.detail_category_name
from (
   select p.*, row_number() over(order by product_name asc) as rnum, c.category_name, c.detail_category_name
   from product p, category c where p.category_no=c.category_no and c.category_name='텐트/타프' and c.detail_category_name = '텐트'
) p
where rnum between 1 and 12

-- 브랜드별 상품 리스트 조회
select rnum, b.brand, p.product_name, p.price, p.product_img, p.category_name, p.detail_category_name
from (
   select p.*, row_number() over(order by product_name asc) as rnum, c.category_name, c.detail_category_name
   from product p, category c, seller s where s.seller_id=p.seller.id and p.category_no=c.category_no and c.category_name='텐트/타프'
) p
where rnum between 1 and 12

-- 검색
select rnum, p.product_name, p.price, p.product_img, p.category_name, p.detail_category_name
from (
   select p.*, row_number() over(order by product_name asc) as rnum, c.category_name, c.detail_category_name
   from product p, category c where p.category_no=c.category_no and REPLACE(p.product_name, ' ', '') like '%루텐트%'
) p
where rnum between 1 and 12




-- 메인, 전체 상품 리스트 페이징
-- 2페이지, 1페이지당 12개씩
-- 따라서 페이징 처리를 하기 위해서는 페이지 번호와 몇개씩 보여줄건지 처리해야함
-- => Criteria Class (DTO)

-- 인덱스 생성 후 인덱스명으로 힌트 사용해서 정렬
CREATE INDEX p_ix01 ON product(price)
 
select * from 
(
select /*+ INDEX(product p_ix01) */ rownum rn, product_name, price, product_img
from product
where rownum > 0 and rownum <= (1*12)
)
where rn > (1-1)*12
   






