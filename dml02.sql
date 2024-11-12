--dml02 merge


--신발가게 날짜별 매출
CREATE TABLE SHOE_M
(
    w_date DATE,
    s_code NUMBER(3), --매장고유코드
    sales NUMBER(10)
);


-- 옷가게 날짜별 매출
CREATE TABLE CLOT_M
(
    w_date DATE,
    s_code NUMBER(3), --매장고유코드
    sales NUMBER(10)
);


--본사 전체 매출
CREATE TABLE COMP_M
(
    w_date DATE,
    s_code NUMBER(3), --매장고유코드
    sales NUMBER(10)
);

CREATE TABLE COMP_M
(
    w_date DATE,
    s_code NUMBER(3), --매장고유코드
    sales NUMBER(10),
    type VARCHAR2(2) --가게 구분 코드 'C' 옷가게, 'S' 신발가게
);
--하나의 가게
--날짜별 여러가게
--날짜구분 코드

INSERT ALL
INTO SHOE_M VALUES (TO_DATE('2024-11-01'), 1, 5000)
INTO SHOE_M VALUES (TO_DATE('2024-11-02'), 1, 10000)
INTO SHOE_M VALUES (TO_DATE('2024-11-03'), 1, 20000)
SELECT * FROM DUAL;

UPDATE SHOE_M
SET SALES =9000
WHERE W_DATE ='2024-11-02';

INSERT ALL
INTO CLOT_M VALUES (TO_DATE('2024-11-04'), 50, 9000)
INTO CLOT_M VALUES (TO_DATE('2024-11-05'), 50, 13000)
INTO CLOT_M VALUES (TO_DATE('2024-11-06'), 50, 95000)
SELECT * FROM DUAL;

UPDATE CLOT_M
SET SALES =94000
WHERE W_DATE ='2024-11-06';

DROP TABLE COMP_M;

SELECT * FROM SHOE_M;

SELECT * FROM CLOT_M;

SELECT * FROM COMP_M;

--DELETE 

--DELETE FROM COMP_M;

INSERT INTO COMP_M
SELECT * FROM SHOE_M;

INSERT INTO COMP_M
SELECT * FROM CLOT_M;

SELECT w_date, SUM(SALES)
FROM COMP_M
GROUP BY w_date
order by w_date;

SELECT SUM(SALES)
FROM COMP_M
WHERE TO_CHAR(W_DATE,'MM')=11;


--하나의 가게 + 날짜 중복 X
MERGE INTO COMP_M m
USING SHOE_M s
ON (m.w_date =s.w_date)
WHEN MATCHED THEN   --조건이 일치하면
    UPDATE SET m.sales = s.sales
WHEN NOT MATCHED THEN   --조건에 일치하는게 없으면
    INSERT VALUES (s.w_date, s.s_code, s.sales);
    
MERGE INTO COMP_M m
USING CLOT_M s
ON (m.w_date =s.w_date)
WHEN MATCHED THEN   --조건이 일치하면
    UPDATE SET m.sales = s.sales
WHEN NOT MATCHED THEN   --조건에 일치하는게 없으면
    INSERT VALUES (s.w_date, s.s_code, s.sales);

SELECT * FROM COMP_M;

--날짜별 여러가게
MERGE INTO COMP_M m
USING SHOE_M s
ON (m.w_date =s.w_date AND m.s_code = s.s_code)
WHEN MATCHED THEN   --조건이 일치하면
    UPDATE SET m.sales = s.sales
WHEN NOT MATCHED THEN   --조건에 일치하는게 없으면
    INSERT VALUES (s.w_date, s.s_code, s.sales);
    
MERGE INTO COMP_M m
USING CLOT_M s
ON (m.w_date =s.w_date AND m.s_code = s.s_code)
WHEN MATCHED THEN   --조건이 일치하면
    UPDATE SET m.sales = s.sales
WHEN NOT MATCHED THEN   --조건에 일치하는게 없으면
    INSERT VALUES (s.w_date, s.s_code, s.sales);

--날짜별 데이터 추가
INSERT ALL
INTO SHOE_M VALUES (TO_DATE('2024-11-01'), 2, 15000)
INTO SHOE_M VALUES (TO_DATE('2024-11-02'), 2, 20000)
INTO SHOE_M VALUES (TO_DATE('2024-11-03'), 2, 80000)
SELECT * FROM DUAL;

INSERT ALL
INTO CLOT_M VALUES (TO_DATE('2024-11-04'), 60, 19000)
INTO CLOT_M VALUES (TO_DATE('2024-11-05'), 60, 33000)
INTO CLOT_M VALUES (TO_DATE('2024-11-06'), 60, 62000)
SELECT * FROM DUAL;

SELECT * FROM SHOE_M;

SELECT * FROM CLOT_M;

SELECT * FROM COMP_M;


--가게구분 코드

select *
from comp_m
ORDER BY W_DATE,S_CODE;        --신발가게 매출만 & 옷가게 매출

MERGE INTO COMP_M m
USING SHOE_M s
ON (m.w_date =s.w_date AND m.s_code = s.s_code)
WHEN MATCHED THEN   --조건이 일치하면
    UPDATE SET m.sales = s.sales
WHEN NOT MATCHED THEN   --조건에 일치하는게 없으면
    INSERT VALUES (s.w_date, s.s_code, s.sales, 'S');
    
MERGE INTO COMP_M m
USING CLOT_M s
ON (m.w_date =s.w_date AND m.s_code = s.s_code)
WHEN MATCHED THEN   --조건이 일치하면
    UPDATE SET m.sales = s.sales
WHEN NOT MATCHED THEN   --조건에 일치하는게 없으면
    INSERT VALUES (s.w_date, s.s_code, s.sales, 'C');

SELECT TYPE,S_CODE, SUM(SALES)
FROM COMP_M
GROUP BY TYPE, S_CODE;

