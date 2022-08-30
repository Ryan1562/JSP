create table pds_item (
 	id number primary key,
 	fileName VARCHAR2(100) NOT NULL,
 	fileSize NUMBER,
 	description VARCHAR2(255)
);

-- pk에 중복되지 않는 숫자를 넣기 위해서 사용
create sequence pds_seq;
select * from pds_item;