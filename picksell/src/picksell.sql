애초에 테이블을 만들때 각각의 테이블에 중복된 컬럼값을 어느정도 적절하게 집어넣어주는것이
전체적인 개발방향에 있어서 좋은것인지 
중복을 줄인것인가 vs 복잡한 로직을 줄이고, 자유도높은 로직을 짤고, 가독성이 높은 로직을짤것인가
alter table ps_orderlist drop (deleted); 테이블 컬럼 삭제
ALTER TABLE PS_PURCHASE_LIST ADD(deleted VARCHAR2(30) DEFAULT 'NO'); 테이블 컬럼 추가
alter table PS_MEMBER add(phoneNum varchar2(40) default '""');
ALTER TABLE PS_MEMBER ADD(latestLogin1 DATE); 테이블 컬럼 추가

ALTER TABLE PS_MEMBER DROP COLUMN phoneNum;


select a.step1_date, a.order_num, a.status ,b.order_quantity, c.subject, c.price, c.first_img

from ps_order a, ps_orderlist b, ps_product c

where a.order_num = b.order_num and b.product_num = c.product_num and a.buyer_id = '2' 

order by a.step1_date desc  >> 리스트2


select c.subject, c.price, c.first_img

from ps_order a, ps_orderlist b, ps_product c

where a.order_num = b.order_num and b.product_num = c.product_num and a.buyer_id = '2' 

order by a.step1_date desc 



insert into PS_ORDERLIST(ORDERLIST_NUM,
							ORDER_NUM,
							PRODUCT_NUM,
							ORDER_QUANTITY,
							SELLER_ID) values(16,
							14,
							83,
							1,
							'2')

select a.seller_id, a.subject, a.first_img, a.price, a.category_num, b.purchase_num, b.product_num, b.order_num, b.buyer_id, b.status, b.total_price 
from(select seller_id, subject, first_img, price, category_num, product_num  from ps_product)a, ps_order b where a.product_num = b.product_num






select a.seller_id, a.subject, a.first_img, a.price, a.category_num, b.purchase_num, b.product_num, b.buyer_id, b.regdate, b.status, c.status as ps_order_status
   from(select seller_id, subject, first_img, price, category_num, product_num  from ps_product)a, ps_purchase_list b , ps_order c where a.product_num = b.product_num and a.product_num = c.product_num
order by b.regdate desc
   
ALTER TABLE PS_ORDERLIST ADD(deleted VARCHAR2(30));  SELLER_ID VARCHAR2(30)

select a.seller_id, a.subject, a.first_img, a.price, a.category_num, b.purchase_num, b.product_num, b.buyer_id, b.regdate, b.status
   from(select seller_id, subject, first_img, price, category_num, product_num  from ps_product)a, ps_purchase_list b where a.product_num = b.product_num
order by b.regdate desc

select a.seller_id, a.subject, b.product_num, b.buyer_id
   from(select seller_id, subject, product_num  from ps_product)a, ps_purchase_list b, ps_order c where a.product_num = b.product_num



<![CDATA[
select r, b.total, b.category_num, c.category_name from(

select rownum r, a.total, a.category_num from(

select count(*) as total, category_num from ps_product group by category_num order by count(*) desc

  )a order by a.total desc )b, ps_category c where b.category_num = c.category_num and r < 7
     ]]>
      
<select id="hotProduct"  resultType="hashmap">
      <![CDATA[
      select r, b.total, b.product_num, c.content, c.first_img, c.subject 
      from(
      select rownum r, a.total, a.product_num from(
      
      select count(*) as total, product_num from ps_orderlist group by product_num order by count(*) desc
      
      )a order by a.total desc )b, ps_product c where b.product_num = c.product_num and r < 4
     ]]>
   </select>
   
   select a.purchase_num, a.product_num, a.buyer_id, a.regdate, a.status, b.seller_id, b.subject, b.first_img, b.price, b.category_num
   from(select purchase_num, product_num, buyer_id, regdate, status from ps_purchase_list order by regdate desc) 
   a, ps_product b where a.product_num = b.product_num
   
	
   update ps_product set seller_id = '2' where hitcount = 1
   
CREATE TABLE PS_MEMBER (
    ID VARCHAR2(30) NOT NULL PRIMARY KEY,
    PASSWORD VARCHAR2(30) NOT NULL,
    NAME VARCHAR2(30) NOT NULL,
    EMAIL VARCHAR2(50) NOT NULL,
    ADDRESS VARCHAR2(200) DEFAULT '0',
    KIND VARCHAR2(30) NOT NULL,--일반회원0 / 사업자회원1 / 관리자99
    STATUS VARCHAR2(30) DEFAULT '0',--정상0 / 게시글제한1 / 로그인제한2 /탈퇴회원44
    ACCOUNT VARCHAR2(30) DEFAULT '0',--계좌번호
    ACCOUNT_NAME VARCHAR2(30) DEFAULT '0',--예금주
    BANK VARCHAR2(30) DEFAULT '0',--은행명
    PROFILE_IMG VARCHAR2(100) DEFAULT '0', --프로필이미지(파일명)
    ALARM_CONSENT VARCHAR2(100) DEFAULT 'ON',--알람 ON / OFF//대문자
    BUSINESS_NUMBER VARCHAR2(100),--사업자등록번호
    BUSINESS_NAME VARCHAR2(100),--상호명
    phoneNum varchar2(40),
    REGDATE DATE NOT NULL--가입일
    
    
);

DROP TABLE PS_MEMBER PURGE;

CREATE TABLE PS_CATEGORY (
    CATEGORY_NUM NUMBER NOT NULL PRIMARY KEY,
    CATEGORY_NAME VARCHAR2(50) NOT NULL //notnull 
);

CREATE SEQUENCE CATEGORY_SEQ
    START WITH 1
    INCREMENT BY 1;

DROP TABLE PS_CATEGORY PURGE;

CREATE TABLE PS_PRODUCT (
    PRODUCT_NUM NUMBER NOT NULL PRIMARY KEY,
    CATEGORY_NUM NUMBER NOT NULL,
    SELLER_ID VARCHAR2(30) NOT NULL,
    HOWTOSELL VARCHAR(10) NOT NULL,
    HITCOUNT NUMBER NOT NULL DEFAULT '0',
    STOCK NUMBER NOT NULL DEFAULT '0',
    PRODUCT_REGDATE DATE NOT NULL,
    DEAL_STATUS VARCHAR2(10) NOT NULL DEFAULT '0',
    BOARD_STATUS VARCHAR2(10) NOT NULL DEFAULT '0',
    CONTENT VARCHAR2(4000) NOT NULL,
    FIRST_IMG VARCHAR2(100) DEFAULT '0',
    SUBJECT VARCHAR2(1000) NOT NULL,
    PRODUCT_STATUS VARCHAR2(10) NOT NULL,
    PRICE NUMBER NOT NULL
);
create table ITEM_DETAIL13(
ITEM_ID2 number not null,
DETAIL varchar2(200),  --상세정보
constraint ITEM_DETAIL_PK13 primary key(ITEM_ID2),
constraint ITEM_DETAIL_FK13 foreign key(ITEM_ID2) references ITEM13(ITEM_ID)  --위에서 등록된 상품의 아이디 or 번호를 ITEM_ID2칼럼에 넣겠다고 제약
);


CREATE TABLE PS_RECENT_PRODUCT (--최근본상품 테이블
RECENT_NUM NUMBER NOT NULL PRIMARY KEY,
RECENT_PRODUCT_NUM NUMBER NOT NULL,
RECENT_CATEGORY_NUM NUMBER NOT NULL,
RECENT_REGDATE DATE NOT NULL,
RECENT_ID VARCHAR2(30) NOT NULL,
constraint PRODUCT_NUM_FK foreign key(RECENT_PRODUCT_NUM) references PS_PRODUCT(PRODUCT_NUM),
constraint CATEGORY_NUM_FK foreign key(RECENT_CATEGORY_NUM) references PS_CATEGORY(CATEGORY_NUM)
);
CREATE SEQUENCE RECENT_PRODUCT_SEQ
    START WITH 1
    INCREMENT BY 1;

CREATE SEQUENCE PRODUCT_SEQ
    START WITH 1
    INCREMENT BY 1;

DROP TABLE PS_PRODUCT PURGE;

CREATE TABLE PS_PURCHASE_LIST(
    PURCHASE_NUM NUMBER NOT NULL PRIMARY KEY,
    PRODUCT_NUM NUMBER NOT NULL,
    BUYER_ID VARCHAR2(30) NOT NULL,
    REGDATE DATE NOT NULL,
    STATUS VARCHAR2(10) NOT NULL DEFAULT '0'
);

CREATE SEQUENCE PL_SEQ
    START WITH 1
    INCREMENT BY 1;

DROP TABLE PS_PURCHASE_LIST PURGE;

CREATE TABLE PS_ORDER(
    ORDER_NUM NUMBER NOT NULL PRIMARY KEY,
    BUYER_ID VARCHAR2(30) NOT NULL,
    STATUS VARCHAR2(10) NOT NULL DEFAULT '0',
    TOTAL_PRICE NUMBER NOT NULL,
    DESTINATION VARCHAR2(100) NOT NULL,
    ACCOUNT VARCHAR2(100) NOT NULL,
    ACCOUNT_NAME VARCHAR2(100) NOT NULL,
    BANK VARCHAR2(100) NOT NULL,
    PURCHASE_NUM NUMBER NOT NULL,
    DELIVERY_COMPANY VARCHAR2(100) DEFAULT '0',
    INVOICE_NUM VARCHAR2(100) DEFAULT '0'
);

CREATE SEQUENCE ORDER_SEQ
    START WITH 1
    INCREMENT BY 1;

DROP TABLE PS_ORDER PURGE;

CREATE TABLE PS_ORDERLIST (
    ORDERLIST_NUM NUMBER NOT NULL PRIMARY KEY,
    ORDER_NUM NUMBER NOT NULL,
    PRODUCT_NUM NUMBER NOT NULL,
    ORDER_QUANTITY NUMBER NOT NULL,
    SELLER_ID VARCHAR2(30) NOT NULL
);

CREATE SEQUENCE OL_SEQ
    START WITH 1
    INCREMENT BY 1;

DROP TABLE PS_ORDERLIST PURGE;

CREATE TABLE PS_SELLER_HISTORY(
    SH_NUM NUMBER NOT NULL PRIMARY KEY,
    ORDERLIST_NUM NUMBER NOT NULL
);

CREATE SEQUENCE SH_SEQ
    START WITH 1
    INCREMENT BY 1;
    
DROP TABLE PS_SELLER_HISTORY;

CREATE TABLE PS_BUYER_HISTORY(
    BH_NUM NUMBER NOT NULL PRIMARY KEY,
    ORDER_NUM NUMBER NOT NULL
);

CREATE SEQUENCE BH_SEQ
    START WITH 1
    INCREMENT BY 1;
    
DROP TABLE PS_BUYER_HISTORY PURGE;

CREATE TABLE PS_BASKET (
    BASKET_NUM NUMBER NOT NULL PRIMARY KEY,
    PRODUCT_NUM NUMBER NOT NULL,
    BASKET_ID VARCHAR2(30) NOT NULL,
    BASKET_REGDATE DAT NOT NULL,
    PRODUCT_QUANTITY NUMBER NOT NULL
);

CREATE SEQUENCE BASKET_SEQ 
    START WITH 1 
    INCREMENT BY 1;
    
DROP TABLE PS_BASKET PURGE;

CREATE TABLE PS_PRO_COMMENT (
    COMMENT_NUM NUMBER NOT NULL PRIMARY KEY,
    PRODUCT_NUM NUMBER NOT NULL,
    COMMENT_WRITER VARCHAR2(30) NOT NULL,
    GROUP_NUM NUMBER NOT NULL,
    STEP_NUM NUMBER NOT NULL,
    COMMENT_REGDATE DATE NOT NULL,
    COMMENT_CONTENT VARCHAR2(2000) NOT NULL
);

CREATE SEQUENCE COMMENT_SEQ
    START WITH 1 
    INCREMENT BY 1;
    
DROP TABLE PS_PRO_COMMENT PURGE;

CREATE TABLE PS_REVIEW (
    REVIEW_NUM NUMBER NOT NULL PRIMARY KEY,
    PRODUCT_NUM NUMBER NOT NULL,
    REVIEWER VARCHAR2(30) NOT NULL,
    REVIEWEE VARCHAR2(30) NOT NULL,
    REVIEW_STAR NUMBER NOT NULL,
    REVIEW_CONTENT VARCHAR2(2000) NOT NULL,
    REVIEW_REGDATE DATE NOT NULL
);

CREATE SEQUENCE REVIEW_SEQ 
    START WITH 1
    INCREMENT BY 1;
    
DROP TABLE PS_REVIEW PURGE;

CREATE TABLE PS_SINGO (
    SINGO_NUM NUMBER NOT NULL PRIMARY KEY,
    PRODUCT_NUM NUMBER NOT NULL,
    SINGOEE VARCHAR2(30) NOT NULL,
    SINGO_WRITER VARCHAR2(30) NOT NULL,
    SINGO_REGDATE DATE NOT NULL,
    SINGO_CONTENT VARCHAR2(4000) NOT NULL
);

CREATE SEQUENCE SINGO_SEQ
    START WITH 1
    INCREMENT BY 1;
    
DROP TABLE PS_SINGO PURGE;

CREATE PS_FREE_BOARD(
    FB_NUM NUMBER NOT NULL PRIMARY KEY,
    FB_SUBJECT VARCHAR2(1000) NOT NULL,
    FB_WRITER VARCHAR2(30) NOT NULL,
    FB_REGDATE DATE NOT NULL,
    FB_CONTENT VARCHAR2(4000) NOT NULL,
    FB_HITCOUNT NUMBER NOT NULL DEFAULT '0'
);

CREATE SEQUENCE FB_SEQ
    START WITH 1
    INCREMENT BY 1;
    
DROP TABLE PS_FREE_BOARD PURGE;

CREATE TABLE PS_FREE_COMMENT (
    FC_NUM NUMBER NOT NULL PRIMARY KEY,
    FB_NUM NUMBER NOT NULL,
    FC_WRITER VARCHAR2(30) NOT NULL,
    FC_CONTENT VARCHAR2(2000) NOT NULL,
    FC_REGDATE DATE NOT NULL,
    FC_GROUP_NUM NUMBER NOT NULL,
    FC_STEP_NUM NUMBER NOT NULL
);

CREATE SEQUENCE FC_SEQ
    START WITH 1
    INCREMENT BY 1;
    
DROP TABLE PS_FREE_COMMENT PURGE;

CREATE TABLE PS_ALARM( 
    ALARM_NUM NUMBER NOT NULL PRIMARY KEY,
    ALARM_CHECK VARCHAR2(10) NOT NULL,
    ALARM_TARGET VARCHAR2(100) NOT NULL,
    ALARM_WRITER VARCHAR2(100) NOT NULL,
    ALARM_BOARD_NUM NUMBER NOT NULL,
    ALARM_KIND VARCHAR2(10) NOT NULL
);

CREATE SEQUENCE ALARM_SEQ
    START WITH 1
    INCREMENT BY 1;

DROP TABLE PS_ALARM PURGE;

DROP TABLE PS_MEMBER PURGE;

CREATE TABLE PS_MEMBER (
    ID VARCHAR2(30) NOT NULL PRIMARY KEY,
    PASSWORD VARCHAR2(30) NOT NULL,
    NAME VARCHAR2(30) NOT NULL,
    EMAIL VARCHAR2(50) NOT NULL,
    ADDRESS VARCHAR2(200) DEFAULT '0',
    KIND VARCHAR2(30) NOT NULL,
    STATUS VARCHAR2(30) DEFAULT '0',
    ACCOUNT VARCHAR2(30) DEFAULT '0',
    ACCOUNT_NAME VARCHAR2(30) DEFAULT '0',
    BANK VARCHAR2(30) DEFAULT '0',
    PROFILE_IMG VARCHAR2(100) DEFAULT '0', 
    ALARM_CONSENT VARCHAR2(100) DEFAULT 'ON',
    BUSINESS_NUMBER VARCHAR2(100),
    BUSINESS_NAME VARCHAR2(100),
    REGDATE DATE NOT NULL
);


DROP TABLE PS_CATEGORY PURGE;

CREATE TABLE PS_CATEGORY (
    CATEGORY_NUM NUMBER NOT NULL PRIMARY KEY,
    CATEGORY_NAME VARCHAR2(50) NOT NULL 
);

CREATE SEQUENCE CATEGORY_SEQ
    START WITH 1
    INCREMENT BY 1;

DROP TABLE PS_PRODUCT PURGE;

CREATE TABLE PS_PRODUCT (
    PRODUCT_NUM NUMBER NOT NULL PRIMARY KEY,
    CATEGORY_NUM NUMBER NOT NULL,
    SELLER_ID VARCHAR2(30) NOT NULL,
    HOWTOSELL VARCHAR(10) NOT NULL,
    HITCOUNT NUMBER  DEFAULT '0', 
    STOCK NUMBER  DEFAULT '0',
    PRODUCT_REGDATE DATE NOT NULL,
    DEAL_STATUS VARCHAR2(10)  DEFAULT '0',
    BOARD_STATUS VARCHAR2(10)  DEFAULT '0',
    CONTENT VARCHAR2(4000) NOT NULL,
    FIRST_IMG VARCHAR2(100) DEFAULT '0',
    SUBJECT VARCHAR2(1000) NOT NULL,
    PRODUCT_STATUS VARCHAR2(10) NOT NULL
);
CREATE SEQUENCE PRODUCT_SEQ
    START WITH 1
    INCREMENT BY 1;

DROP TABLE PS_PURCHASE_LIST PURGE;

CREATE TABLE PS_PURCHASE_LIST(
    PURCHASE_NUM NUMBER NOT NULL PRIMARY KEY,
    PRODUCT_NUM NUMBER NOT NULL,
    BUYER_ID VARCHAR2(30) NOT NULL,
    REGDATE DATE NOT NULL,
    STATUS VARCHAR2(10) DEFAULT '0'
);

CREATE SEQUENCE PL_SEQ
    START WITH 1
    INCREMENT BY 1;

DROP TABLE PS_ORDER PURGE;

CREATE TABLE PS_ORDER(
    ORDER_NUM NUMBER NOT NULL PRIMARY KEY,
    BUYER_ID VARCHAR2(30) NOT NULL,
    STATUS VARCHAR2(10)  DEFAULT '0',
    TOTAL_PRICE NUMBER NOT NULL,
    DESTINATION VARCHAR2(100) NOT NULL,
    ACCOUNT VARCHAR2(100) NOT NULL,
    ACCOUNT_NAME VARCHAR2(100) NOT NULL,
    BANK VARCHAR2(100) NOT NULL,
    PURCHASE_NUM NUMBER NOT NULL,
    DELIVERY_COMPANY VARCHAR2(100) DEFAULT '0',
    INVOICE_NUM VARCHAR2(100) DEFAULT '0'
);

CREATE SEQUENCE ORDER_SEQ
    START WITH 1
    INCREMENT BY 1;

DROP TABLE PS_ORDERLIST PURGE;

CREATE TABLE PS_ORDERLIST (
    ORDERLIST_NUM NUMBER NOT NULL PRIMARY KEY,
    ORDER_NUM NUMBER NOT NULL,
    PRODUCT_NUM NUMBER NOT NULL,
    ORDER_QUANTITY NUMBER NOT NULL,
    SELLER_ID VARCHAR2(30) NOT NULL
);

CREATE SEQUENCE OL_SEQ
    START WITH 1
    INCREMENT BY 1;

DROP TABLE PS_SELLER_HISTORY PURGE;

CREATE TABLE PS_SELLER_HISTORY(
    SH_NUM NUMBER NOT NULL PRIMARY KEY,
    ORDERLIST_NUM NUMBER NOT NULL
);

CREATE SEQUENCE SH_SEQ
    START WITH 1
    INCREMENT BY 1;

DROP TABLE PS_BUYER_HISTORY PURGE;

CREATE TABLE PS_BUYER_HISTORY(
    BH_NUM NUMBER NOT NULL PRIMARY KEY,
    ORDER_NUM NUMBER NOT NULL
);

CREATE SEQUENCE BH_SEQ
    START WITH 1
    INCREMENT BY 1;
    
DROP TABLE PS_BASKET PURGE;

CREATE TABLE PS_BASKET (
    BASKET_NUM NUMBER NOT NULL PRIMARY KEY,
    PRODUCT_NUM NUMBER NOT NULL,
    BASKET_ID VARCHAR2(30) NOT NULL,
    BASKET_REGDATE DAT NOT NULL,
    PRODUCT_QUANTITY NUMBER NOT NULL
);

CREATE SEQUENCE BASKET_SEQ 
    START WITH 1 
    INCREMENT BY 1;
    
DROP TABLE PS_PRO_COMMENT PURGE;

CREATE TABLE PS_PRO_COMMENT (
    COMMENT_NUM NUMBER NOT NULL PRIMARY KEY,
    PRODUCT_NUM NUMBER NOT NULL,
    COMMENT_WRITER VARCHAR2(30) NOT NULL,
    GROUP_NUM NUMBER NOT NULL,
    STEP_NUM NUMBER NOT NULL,
    COMMENT_REGDATE DATE NOT NULL,
    COMMENT_CONTENT VARCHAR2(2000) NOT NULL
);

CREATE SEQUENCE COMMENT_SEQ
    START WITH 1 
    INCREMENT BY 1;
    
DROP TABLE PS_REVIEW PURGE;

CREATE TABLE PS_REVIEW (
    REVIEW_NUM NUMBER NOT NULL PRIMARY KEY,
    PRODUCT_NUM NUMBER NOT NULL,
    REVIEWER VARCHAR2(30) NOT NULL,
    REVIEWEE VARCHAR2(30) NOT NULL,
    REVIEW_STAR NUMBER NOT NULL,
    REVIEW_CONTENT VARCHAR2(2000) NOT NULL,
    REVIEW_REGDATE DATE NOT NULL
);

CREATE SEQUENCE REVIEW_SEQ 
    START WITH 1
    INCREMENT BY 1;
    
DROP TABLE PS_SINGO PURGE;

CREATE TABLE PS_SINGO (
    SINGO_NUM NUMBER NOT NULL PRIMARY KEY,
    PRODUCT_NUM NUMBER NOT NULL,
    SINGOEE VARCHAR2(30) NOT NULL,
    SINGO_WRITER VARCHAR2(30) NOT NULL,
    SINGO_REGDATE DATE NOT NULL,
    SINGO_CONTENT VARCHAR2(4000) NOT NULL
);

CREATE SEQUENCE SINGO_SEQ
    START WITH 1
    INCREMENT BY 1;
    
DROP TABLE PS_FREE_BOARD PURGE;

CREATE TABLE PS_FREE_BOARD(
    FB_NUM NUMBER NOT NULL PRIMARY KEY,
    FB_SUBJECT VARCHAR2(1000) NOT NULL,
    FB_WRITER VARCHAR2(30) NOT NULL,
    FB_REGDATE DATE NOT NULL,
    FB_CONTENT VARCHAR2(4000) NOT NULL,
    FB_HITCOUNT NUMBER DEFAULT '0'
);

CREATE SEQUENCE FB_SEQ
    START WITH 1
    INCREMENT BY 1;
    
DROP TABLE PS_FREE_COMMENT PURGE;

CREATE TABLE PS_FREE_COMMENT (
    FC_NUM NUMBER NOT NULL PRIMARY KEY,
    FB_NUM NUMBER NOT NULL,
    FC_WRITER VARCHAR2(30) NOT NULL,
    FC_CONTENT VARCHAR2(2000) NOT NULL,
    FC_REGDATE DATE NOT NULL,
    FC_GROUP_NUM NUMBER NOT NULL,
    FC_STEP_NUM NUMBER NOT NULL
);

CREATE SEQUENCE FC_SEQ
    START WITH 1
    INCREMENT BY 1;
    

DROP TABLE PS_ALARM PURGE;

CREATE TABLE PS_ALARM( 
    ALARM_NUM NUMBER NOT NULL PRIMARY KEY,
    ALARM_CHECK VARCHAR2(10) DEFAULT 'NO',
    ALARM_TARGET VARCHAR2(50) NOT NULL,
    ALARM_WRITER VARCHAR2(50) NOT NULL,
    ALARM_VARIABLE1 VARCHAR2(100) NOT NULL,
    ALARM_VARIABLE2 VARCHAR2(100) NOT NULL,
    ALARM_KIND VARCHAR2(10) NOT NULL,
    ALARM_REGDATE DATE NOT NULL
);

CREATE TABLE PS_ALARM( 
    ALARM_NUM NUMBER NOT NULL PRIMARY KEY,
    ALARM_CHECK VARCHAR2(10) DEFAULT 'NO',
    ALARM_TARGET VARCHAR2(30) NOT NULL,
    ALARM_WRITER VARCHAR2(30) NOT NULL,
    ALARM_BOARD_NUM NUMBER NOT NULL,
    ALARM_KIND VARCHAR2(10) NOT NULL,
    ALARM_REGDATE DATE NOT NULL
);

CREATE SEQUENCE ALARM_SEQ
    START WITH 1
    INCREMENT BY 1;