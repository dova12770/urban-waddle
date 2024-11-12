

CREATE TABLE T_MENU_12
(
    menu_id NUMBER(5) PRIMARY KEY,
    menu_name VARCHAR2(128) NOT NULL,
    price NUMBER(10),
    item VARCHAR2(64),
    menu_date date
);

INSERT INTO T_MENU_12 
VALUES (1,'싸이버거',6000,'완전식품',SYSDATE);

INSERT INTO T_MENU_12 
VALUES (2,'콩나물비빔밥',7000,'탄수화물',SYSDATE);

INSERT INTO T_MENU_12 
VALUES (3,'닭가슴살',3000,'단백질',SYSDATE);

INSERT INTO T_MENU_12 
VALUES (4,'베트남쌀국수',8000,'탄수화물',SYSDATE);

INSERT INTO T_MENU_12 
VALUES (5,'라면',2000,'밀가루',SYSDATE);

select * from T_MENU_12;

UPDATE T_MENU_12
SET price=8500
WHERE menu_id =4;

SELECT *
--DELETE  
FROM T_MENU_12
WHERE menu_id = 5;

commit;