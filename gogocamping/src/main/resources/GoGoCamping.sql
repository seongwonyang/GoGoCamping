-- 1.회원 테이블 생성
-- 1-1.관리자(manager)
create table manager(
	manager_id varchar2(100) primary key,
	manager_name varchar2(100) not null,
	manager_password varchar2(100) not null
);
-- 1-2.판매자(seller)
create table seller(
	seller_id varchar2(100) primary key,
	seller_name varchar2(100) not null,
	seller_password varchar2(100) not null,
	business_number varchar2(100) not null, -- 사업자 번호
	seller_email varchar2(100) not null,
	brand varchar2(100) not null,
	seller_tel varchar2(100) not null,
	seller_post_number varchar2(100) not null,
	seller_address varchar2(500) not null,
	seller_detailed_address varchar2(500) not null,
	register_admin number not null -- 가입 승인 여부 (0 or 1)
);
select * from SELLER;
alter table seller add logo_img varchar2(500) null;
alter table seller add logo_img_stored varchar2(500) null;

select seller_id, seller_name, seller_email 
from seller 
where seller_id='helinox' and seller_name='김근영' and business_number='0123456789';

-- 1-3.소비자(customer)
create table customer(
	customer_id varchar2(100) primary key,
	customer_name varchar2(100) not null,
	customer_password varchar2(100) not null,
	customer_email varchar2(100) not null,
	customer_tel varchar2(100) not null,
	customer_post_number varchar2(100) not null,
	customer_address varchar2(500) not null,
	customer_detailed_address varchar2(500) not null,
	customer_birth date not null,
	customer_regdate date not null
);

drop table manager;
drop table seller;
drop table customer;

-- 2.상품 관련 테이블 생성
-- 2-1 카테고리(category)
create table category(
	category_no number primary key,
	category_name varchar2(100) not null,
	detail_category_name varchar2(100) not null
);
create sequence category_seq;   
select * from category

-- 2-2.상품(product)
create table product(
	product_id number primary key,
	product_name varchar2(100) not null,
	price number not null,
	product_info clob not null,
	stock number not null, -- 재고량
	product_img varchar2(100) not null,
	seller_id varchar2(100) not null,
	category_no number not null,
	constraint fk_seller_id foreign key(seller_id) references seller(seller_id) on delete cascade,
	constraint fk_category_no foreign key(category_no) references category(category_no)
);
create sequence product_seq;
select * from product

-- 2-3.장바구니(cart)
create table cart(
	cart_no number primary key,
	customer_id varchar2(100) not null,
	product_id number not null,
	constraint fk_c_product_id foreign key(product_id) references product(product_id) on delete cascade
);
create sequence cart_seq;

-- 2-4.좋아요(likes)
create table likes( 
	likes_no number primary key,
	customer_id varchar2(100) not null,
	product_id number not null,
	constraint fk_l_product_id foreign key(product_id) references product(product_id) on delete cascade
);
create sequence likes_seq;

-- 2-5.사용후기(review)
create table review(
	review_no number primary key,
	grade number not null,
	review_content clob not null,
	review_regdate date not null,
	customer_id varchar2(100) not null,
	product_id number not null,
	constraint fk_r_product_id foreign key(product_id) references product(product_id)
);
create sequence review_seq;

drop table category;
drop table product;
drop table cart;
drop table likes;
drop table review;

drop sequence category_seq;
drop sequence review_seq;
drop sequence product_seq;
drop sequence likes_seq;
drop sequence cart_seq;


-- 3.주문, 환불 관련 테이블 생성
-- 3-1.주문정보(order_info)
create table order_info(
	order_no number primary key,
	order_date date not null,
	order_post_number varchar2(100) not null,
	order_address varchar2(500) not null,
	order_detailed_address varchar2(500) not null,
	receiver_name varchar2(100) not null,
	receiver_tel varchar2(100) not null,
	payment varchar2(100) not null,
	customer_id varchar2(100) not null,
	constraint fk_o_customer_id foreign key(customer_id) references customer(customer_id)
);
create sequence order_info_seq;

-- 3-2.주문 상세 정보(order detail)
create table order_detail(
	order_detail_no number primary key,
	order_count number not null,
	order_price number not null,
	delivery_status varchar2(100) not null,
	delivery_compldate date,
	refund_check varchar2(100) not null, -- 0 or 1
	order_no number not null,
	product_id number not null,
	constraint fk_order_no foreign key(order_no) references order_info(order_no),
	constraint fk_o_product_id foreign key(product_id) references product(product_id)
);
create sequence order_detail_seq;

-- 3-3.환불(refund)
create table refund(
	refund_no number primary key,
	refund_category varchar2(100) not null,
	refund_reason clob not null,
	refund_reason_img varchar2(100),
	refund_reject_reason clob,
	order_detail_no number not null,
    constraint fk_order_detail_no foreign key(order_detail_no) references order_detail(order_detail_no)
);
create sequence refund_seq;

-- 3-4.QnA
create table QnA( 
	qna_no number primary key,
	qna_category varchar2(100) not null,
	title varchar2(100) not null,
	content clob not null,
	regdate date not null,
	product_id number not null,
	customer_id varchar2(100) not null,
	constraint fk_qna_product_id foreign key(product_id) references product(product_id),
	constraint fk_qna_customer_id foreign key(customer_id) references customer(customer_id)
);
create sequence QnA_seq;

drop table order_info;
drop table order_detail;
drop table refund;
drop table QnA;

drop sequence order_info_seq;
drop sequence order_detail_seq;
drop sequence refund_seq;
drop sequence QnA_seq;

delete from product




