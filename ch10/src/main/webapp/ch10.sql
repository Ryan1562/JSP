create table member2(
	 id varchar2(12) primary key,
	 password varchar2(12) not null,
	 name varchar2(20) not null,
	 address varchar2(50),
	 tel varchar2(20) not null,
	 reg_date date
);
insert into member2 values('k1','1','로제','강남','010-1111-1111',sysdate);