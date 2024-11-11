--DDL
--생성
CREATE TABLE new_table
(
    no NUMBER(3),
    name VARCHAR2(10),
    birth DATE
);

SELECT * FROM new_table;

desc new_table;

select SYSDATE from dual;

CREATE TABLE tt02
(
    no NUMBER(3,1) DEFAULT 0,
    name VARCHAR2(10) DEFAULT 'NO Name',
    hiredate DATE DEFAULT SYSDATE
);

SELECT *
FROM tt02;


--테이블 복사
create table dept3
as
select * from dept2;        --구조 + 데이터 전체 복사

select * from dept3;

create table dept4
as
select dcode, area from dept2;  -- 컬럼 2개 + 데이터 복사

select * from dept4;

create table dept5  -- 컬럼구조만 복사(데이터 x)
as
select *
from dept2
where 1=2;  --거짓조건

select * from dept5;

--테이블 변경

--컬럼 추가
alter table dept4
add(location VARCHAR2(10));

alter table dept4
add(location VARCHAR2(10) default 'Cheonan');

INSERT INTO dept4
VALUES(2000, 'Cheonan Office');

--임시부서 여부를 체크 컬럼명 temp_code 'Y' 임시부서, 'N' 정식부서
alter table dept4
add(temp_code VARCHAR2(2) default 'N');

select * from dept4;

--컬럼 삭제

alter table dept4
drop column location;



select * from dept5;

create table dept6
as
select * from dept4;

select * from dept5;
select * from dept6;

--테이블 삭제
drop table dept5;   --완전히 사라짐 롤백 불가 / 자동커밋

truncate table dept6;   -- 내용물만 사라짐 롤백 불가 / 자동커밋
rollback;










