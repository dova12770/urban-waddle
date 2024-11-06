--1106모닝퀴즈

SELECT * 
FROM emp2;

SELECT 
    empno 사번,
    name 이름,
    birthday 생년월일,
    hobby 취미,
    pay 급여,
    TO_CHAR(pay*1.5) 성과액,
    SUBSTR(EMP_TYPE,1,INSTR(EMP_TYPE,' ')-1)||' family' 직원분류,
    TEL,
    CASE
        WHEN PAY BETWEEN 35000001 AND 45000000 THEN '하'
        WHEN PAY BETWEEN 45000001 AND 60000000 THEN '중'
        WHEN PAY > 60000000 THEN '상'
        ELSE '화이팅'
    END "급여수준"
FROM emp2
where 
    substr(birthday,1,2) between 70 and 79 and
    SUBSTR(tel,1,INSTR(tel,')')-1) in(02,031);
    
SELECT 
    empno 사번,
    name 이름,
    birthday 생년월일,
    hobby 취미,
    pay 급여,
    TO_CHAR(pay*1.5) 성과급,
    REPLACE(emp_type,'employee','family') 직원분류,
    TEL,
    CASE
        WHEN PAY BETWEEN 35000001 AND 45000000 THEN '하'
        WHEN PAY BETWEEN 45000001 AND 60000000 THEN '중'
        WHEN PAY > 60000000 THEN '상'
        ELSE '화이팅'
    END "급여수준"
FROM emp2
where 
    to_char(birthday,'YY') between 70 and 79 and
    substr(tel,1,instr(tel,')')-1) in(02,031);