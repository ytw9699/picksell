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
    ALARM_TARGET VARCHAR2(30) NOT NULL,
    ALARM_WRITER VARCHAR2(30) NOT NULL,
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
    ALARM_CHECK VARCHAR2(10) NOT NULL,
    ALARM_TARGET VARCHAR2(30) NOT NULL,
    ALARM_WRITER VARCHAR2(30) NOT NULL,
    ALARM_BOARD_NUM NUMBER NOT NULL,
    ALARM_KIND VARCHAR2(10) NOT NULL
);

CREATE SEQUENCE ALARM_SEQ
    START WITH 1
    INCREMENT BY 1;