--DDL02 제약조건

CREATE TABLE tt01
(
    no NUMBER(3) UNIQUE,
    name VARCHAR2(10) NOT NULL,
    hiredate DATE 
);

SELECT * FROM tt01;

INSERT INTO tt01
VALUES (1, '이름1', SYSDATE);

INSERT INTO tt01
VALUES (2, '이름2', SYSDATE);

INSERT INTO tt01
VALUES (3, NULL, SYSDATE);

CREATE TABLE tt03
(
    no NUMBER(3)
        CONSTRAINT tt03_no_uk UNIQUE,
    name VARCHAR2(10)
        CONSTRAINT tt03_name_nn NOT NULL,
        --score NUMBER(3) CHECK (score BETWEEN 0 AND 100)
    score NUMBER(3)
        CONSTRAINT tt03_score_ck CHECK (score BETWEEN 0 AND 100),
    pass VARCHAR2(2)
        CONSTRAINT tt03_pass_ch CHECK (pass IN ('Y','N'))
);

--Oracle DB 숫자/문자/날짜    boolean X   True/False

1:true 0:false
Y:true N:false
T:true F: false
True: true False: false

INSERT INTO tt03
VALUES (1,'이름1', 50, 'Y');

SELECT * FROM tt03;

INSERT INTO tt03
VALUES (1,'이름1', 50, 'Y'); --중복 UNIQUE

INSERT INTO tt03
VALUES (2,NULL, 50, 'Y');   --이름 not null

INSERT INTO tt03
VALUES (2,'이름2', 500, 'Y'); --score 범위 0~100

INSERT INTO tt03
VALUES (2,'이름1', 50, 'T'); -- pass 'Y','N'

PRIMARY KEY --기본키 PK
FOREIGN KEY -- 외래키 FK 제약이 생겨 함부러 지울 수 없게 됨, 쓸 수 있는 값이 참조한 값으로 제한됨

SELECT * FROM emp;
select * from dept;




