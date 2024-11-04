단일행 함수

임시로 사용하는 테이블 dual

--INITCAP 첫글자 대문자 변환
SELECT ename, INITCAP('ABCDE'), INITCAP(ENAME)
FROM emp ;

--LOWER 모든글씨 소문자화, UPPER 모든글씨 대문자화
SELECT LOWER(name), UPPER(name)
FROM student;

--LENGTH 컬럼 또는 문자열, LENGTHB  컬럼 또는 문자열
SELECT LENGTH('asdfcafdf'),LENGTHB('asdfcafdf'), 
    LENGTH('점심'),LENGTHB('점심')
FROM dual;

SELECT *
FROM emp --이름 다섯글자 이상인 사람들
WHERE LENGTH(ename)>= 5;

SELECT '아침' || '점심' ||'저녁', CONCAT(CONCAT('아침','점심'),'저녁')--매개변수 2개일때만
FROM dual;

-- SUBSTR(대상, 시작지점, 자리수)
SELECT 
SUBSTR('abcdefg', 1,3),
SUBSTR('abcdefg', 3,5),
SUBSTR('abcdefg', -5,2)
FROM dual;

SELECT name,
    SUBSTR(jumin,3,4) Birthday,
    SUBSTR(jumin,3,4) - 1 "Birthday - 1"
FROM student
WHERE deptno1=101;

--INSTR(대상, 찾는. 시작. 몇번째[1]) 대상이 몇번째에 있는지 확인하는 함수
SELECT 
    INSTR('2024/11/04 10/45/45','/',1),
    INSTR('2024/11/04 10/45/45','/',6),
    INSTR('2024/11/04 10/45/45','/',1,4),
    INSTR('2024/11/04 10/45/45','/',6,2),
    INSTR('2024/11/04 10/45/45','/',1,5),
    INSTR('2024/11/04 10/45/45','/',16,2)
FROM dual;

SELECT name,tel, INSTR(tel,')')
FROM student
WHERE deptno1 =201;

--연습
SELECT name 이름,
substr(birthday,1,2)년도,
substr(birthday,4,2)월,
substr(birthday,7,2)일
FROM student;

SELECT name,tel, INSTR(tel,')')괄호위치
FROM student
WHERE deptno1 =201;

SELECT name,tel,INSTR(tel,'3')괄호위치
FROM student
WHERE deptno1 = 101;

SELECT name,tel,SUBSTR(tel,1,INSTR(tel,')')-1)지역번호
FROM student
WHERE deptno1 = 201;
--------------------------------------------------------

SELECT * 
FROM student;

--정렬
SELECT 
    LPAD('문자', 10, '*'),
    LPAD(123, 5, 0),
    LPAD(33, 3, 0)
FROM dual;

SELECT 
    LPAD(id,10,'*'),
    RPAD(id,10,'*')
FROM student;

SELECT LPAD(ename,9 , 123456789) 
FROM emp;

--공백제거용
--TRIM -> 불필요한요소 제거
SELECT LTRIM('abcd','a'),
    RTRIM('abcd','d'),
    RTRIM('abcd','b'),
    LTRIM('abcd','d'),
    LTRIM(' abcd'),
    RTRIM(' abcd'),
    TRIM(' abcd'),
     TRIM(' a b c d')
FROM dual;

SELECT
    REPLACE('abcde', 'c','*'),
    REPLACE('2024-11-04', '-','/')
FROM dual;




---------------------------
SELECT  
    ROUND(1.66,1)반올림,
    TRUNC(1.4567,2)버림,
    TRUNC(1.4567,1),
    TRUNC(1.4567,0),
    TRUNC(123.4567,-1),
    MOD(14,4)나누기 후 나머지,
    CEIL(123.133)가까운큰수,
    FLOOR(123.133)가까운작은수,
    POWER(3,5)제곱
FROM dual;

SELECT 
    rownum, --행번호
    CEIL(rownum/3),
    CEIL(rownum/4),
    empno,
    ename
FROM emp;
--WHERE deptno = 30;

SELECT 
    null,
    SYSDATE,--현재날짜시간
    SYSTIMESTAMP,
    MONTHS_BETWEEN('2024-10-26','2024-11-04')월환산,
    MONTHS_BETWEEN('2024-03-05','2024-01-05')월환산,
    ADD_MONTHS(SYSDATE,3),
    LAST_DAY(SYSDATE),--그달의 마지막날
    NEXT_DAY(SYSDATE,'수'),
    NEXT_DAY(SYSDATE,'토')
FROM dual;

SELECT 
    ROUND(SYSDATE),
    TRUNC(SYSDATE),
    TRUNC(123.113,1),
    TRUNC(SYSDATE,'MM'), --Year Month Day
    TRUNC(SYSDATE,'YY'),
    ADD_MONTHS(SYSDATE,1),
    SYSDATE+3,
    SYSDATE-3,
    SYSDATE+7,
    --다음날의 첫날
    TRUNC(ADD_MONTHS(SYSDATE,1),'MM'),
    LAST_DAY(SYSDATE)+1,
    --전월의 마지막날
    TRUNC(SYSDATE,'MM')-1,
    LAST_DAY(ADD_MONTHS(SYSDATE,-1))
FROM dual;

SELECT 2+'2'    --자동형변환
FROM dual;

SELECT '2'||'123A'
FROM dual;

SELECT 
    TO_CHAR(123),
    TO_CHAR(590493.238),
    TO_CHAR(502.23),
    SYSDATE,
    TO_CHAR(SYSDATE),--날짜 -> 문자
    TO_CHAR(SYSDATE,'YYYY'),
    TO_CHAR(SYSDATE,'MM'),
    TO_CHAR(SYSDATE,'DD'),
    TO_CHAR(SYSDATE,'YYYYMMDD'),
    TO_CHAR(SYSDATE,'YYYY/MM/DD'),
    TO_CHAR(SYSDATE,'YYYY-MM-DD'),
    TO_CHAR(SYSDATE,'YYYY/MM-DD')
FROM dual;

SELECT 
    SYSDATE,
    TO_CHAR(SYSDATE,'YYYY/MM-DD HH24:MI:SS'),
    TO_CHAR(SYSDATE,'HH24-MI-SS'),
    TO_CHAR(ROUND(SYSDATE),'YYYY/MM-DD HH24:MI:SS')
FROM dual;



SELECT 
    studno,
    name,
    TO_CHAR(birthday,'YYYY-MM-DD')BIRTHDAY
FROM student
where TO_CHAR(birthday,'MM')='01';

SELECT 
    empno,
    ename,
    hiredate
FROM emp
where TO_CHAR(HIREDATE,'MM')IN(1,2,3);
    


















