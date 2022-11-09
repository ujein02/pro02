-- 데이터베이스 생성
create database myshop1;
commit;

-- 데이터베이스 선택
use myshop1;
create table custom (cusId varchar(13) primary key, cusPw varchar(200), 
cusName varchar(50) not null, address varchar(500), tel varchar(14), regDate datetime default now(),
point int default 0, level int default 0, visited int default 0
);

create table notice(notiNo int primary key auto_increment, title varchar(200) not null,
	content varchar(1000) not null, author varchar(20) not null, resDate datetime default now()
    );

insert into notice(title, content, author) values ("테스트 제목 1", "테스트1 내용입니다.", "admin");
insert into notice(title, content, author) values ("테스트 제목 2", "테스트2 내용입니다.", "admin");
insert into notice(title, content, author) values ("테스트 제목 3", "테스트3 내용입니다.", "admin");
insert into notice(title, content, author) values ("테스트 제목 4", "테스트4 내용입니다.", "admin");

commit;

select * from notice order by notiNo desc;

select * from custom;
update custom set level=9 where cusid="admin";

create table category(
	cateNo int primary key auto_increment,
	cateName varchar(50)
);

create table product(
	proNo int primary key auto_increment,
	cateNo int not null,
	proName varchar(40) not null,
	proSpec varchar(500),
	oriPrice int not null,
	discountRate double not null,
	proPic varchar(200),
	proPic2 varchar(200)
);

insert into category(cateName) values ("SHOES");
insert into category(cateName) values ("GEAR");
insert into category(cateName) values ("WEAR");

alter table notice add visited int default 0;

select * from notice;

-- 입고 테이블 생성
create table wearing(proNo int primary key, amount int);

select * from product;

desc product;

create table sales(
	saleNo int primary key auto_increment,
    cusId varchar(13) not null,
    proNo int not null,
    amount int not null,
    saleDate datetime default now(),
    parselNo int,
    salePayNo int
);

create table parsel(
	parselNo int primary key auto_increment,
    parselAddr varchar(500),
    cusTel varchar(14),
    parselCompany varchar(50),
    parselTel varchar(14),
    parselState int default 0
);    

-- 결제 테이블 생성
create table payment(
	salePayNo int primary key auto_increment,
    payMethod varchar(20),
    payCom varchar(50),
    cardNum varchar(40),
    payAmount int
);

commit;
select * from parsel order by parselstate asc, parselno asc;
select * from parsel;
select * from parsel order by parselstate asc, parselno asc ;

alter table parsel add column baleCode varchar(24);

create table cart(
	cartNo int primary key auto_increment,
    proNo int,
    cusId varchar(13)
);
create table qnaa(
    no int primary key auto_increment,
    title varchar(100) not null,
    content varchar(1000) not null,
    author varchar(20) not null,
    resdate datetime default now(),
    lev int default 0,            -- 깊이
    parno int not null,          -- 부모글 번호
    sec char(1)                     -- 비밀글 여부
    
);