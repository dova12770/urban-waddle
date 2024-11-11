--DML

--데이터 저장  INSERT
--데이터 수정 UPDATE
--데이터 삭제 DELETE
--데이터 병합 MERGE

INSERT INTO 테이블명 (컬렁명...)
VALUES (데이터 값 ...);

INSERT INTO  new_table (no,name,birth)
VALUES(1,'이름1', SYSDATE);

INSERT INTO  new_table (name,birth,no)
VALUES('이름2', SYSDATE, 2);

INSERT INTO  new_table (name,birth,no)
VALUES('이름3', '2002-02-15', 3);

INSERT INTO  new_table (name,birth,no)
VALUES('이름4',TO_DATE('2001-10-25'), 4);

--컬럼명 생략
--전체 컬럼에 저장하는 경우 + 순서
INSERT INTO new_table
VALUES(5,'이름5', SYSDATE);

INSERT INTO new_table(no, name)
VALUES(6,'이름6');

INSERT INTO new_table
VALUES(7,'이름7', null);

--------------------------

INSERT INTO tt02 (no)
VALUES (1);

INSERT INTO tt02 (no, name, hiredate)
VALUES (2, null,null);



--데이터 수정

update 테이블명
set 컬럼명 = 값
where 조건;


select * from dept4;

update dept4
set temp_code = 'N';

update dept4
set temp_code = 'Y'
where dcode =2000;

select *
from dept4
where temp_code = 'Y';


create table professor2
as
select * from professor;


select *
from professor2
where position = 'assistant professor';

update professor2
--set bonus = 200 --200으로 저장
set bonus = bonus + 200  --200을 인상
where position = 'assistant professor';

update professor2
set pay = pay *1.15
where position = (select position
                    from professor2
                    where name ='Sharon Stone')
        and
        pay <250;

commit;
rollback;

select * 
from dept4
where dcode =2000;

update dept4
set location ='Asan'
where dcode =2000;

insert into dept4
values (2001, 'Asan Office', 'Asan','Y');


--데이터 삭제 delete rollback 가능 / 자동커밋 안함
select * from dept4;

delete from dept4;

SELECT *
--DELETE
FROM dept4
WHERE temp_code ='Y';

select * from dept2;