create database myshop1;
commit;

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







