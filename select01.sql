
1. 조회 SELECT

SELECT 조회 대상 컬럼명 FROM 테이블명;

select * from dept;
* : 전체 ALL

테이블구조 확인 (Describe)
DESC 테이블명;

조회 데이터 리터럴 활용!
SELECT '문자', 3019 FROM 테이블명;

컬럼명 별도로 지정하기 (컬럼별칭)
SELECT 컬럼명 AS "컬럼별칭",
    컬럼명 "컬럼별칭"
    컬럼명 컬럼별칭
FROM 테이블명;






select * from dept; -- dept 테이블에 있는 모든 컬럼을 조회

select * from dept2; -- dept2print_table 테이블에 있는 모든 컬럼을 조회

select * from emp;

select mgr, sal from emp; -- emp테이블에서 mgr과 sal 컬럼을 조회

--가독성
SELECT *
FROM emp;

SELECT
    empno,
    ename,
    job
FROM emp;

DESC emp;   --emp 테이블의 구조를 보여달라


SELECT empno, ename, '그냥문자', 999 FROM emp;

SELECT '그냥''문자', 999, q'[요기안에다 1203'ㅁ나ㅓㅐ'ㅇㅁㄴㄹ]' FROM emp;

SELECT ename AS "이름",
        empno "사번",
        job 직업,
        '그냥문자' 중요한의미,
        sal "직원의 월급"
FROM emp;


중복값 제거
DISTINCT

select * from emp;

select DISTINCT job --job 중복제거 조회
FROM emp;

select DISTINCT deptno --deptno 부서번호 중복제거 조회
FROM emp;

select DISTINCT (deptno) --deptno 부서번호 중복제거 조회
FROM emp;

select DISTINCT deptno, job     --두개 조합 중복 제거
FROM emp;

|| 연결연산자 

SELECT '나는' || '배가고프다' FROM dept;

SELECT DEPTNO || DNAME AS "부서번호이름",
        DEPTNO || DNAME "부서번호이름",
        DEPTNO || DNAME 부서번호이름
FROM dept;

SELECT deptno+10,
        deptno+20,
        depton+30
FROM dept;

SELECT deptno+deptno+deptno
FROM dept;

SELECT NAME || '''s ID : '|| id || ',WEIGHT is '|| weight || 'Kg' AS "ID AND WEIGHT"
FROM STUDENT;


SELECT ENAME||'('|| job ||'), '|| Ename ||''''||job||'''' AS "NAME AND JOB"
from emp;

SELECT ename||'''s sal is $'|| sal AS "Name and Sal"
FROM emp;

----------------------------------
WHERE 조건
찾고 싶은 조건 (결과 필터링)

SELECT ....
FROM...
WHERE...

select * 
from emp;       --comm 성과급

select *
from emp
where comm is null; --성과급을 받지 않는 사람들만

select *
from emp
where comm is not null; --성과급을 지급 대상인 사람들만

select DISTINCT deptno from emp;

--부서번호 20번 부서에 속한 사람들의 이름과 급여 보기
select ename, sal
from emp
where deptno =20;

--emp 테이블 급여 2000 보다 적게 받는 사람들 목록
select *
from emp
where sal < 2000;

--emp 테이블 직업이 CLERK 인 사람들만 취합
select *
from emp
where job = 'CLERK';

--emp 테이블 직업이 CLERK 이 아닌 사람들만 취합
select *
from emp
where job <> 'CLERK';
--where job != 'CLERK';


--EMP 테이블 급여가 2000~3000인 사람들만 조회
SELECT *
from emp
--where sal>=2000 and sal<=3000;
where sal between 2000 and 3000;

--student 테이블에서 1학년과 3학년만 조회 (1학년이거나 3학년이거나)
select *
from student
--WHERE grade = 1 OR grade =3;
WHERE grade IN (1,3);

--student 테이블에서 1학년과 3학년만 제외하고 조회
select *
from student
--WHERE grade IN (2,4);
WHERE grade NOT IN (1,3);
--WHERE grade<> 1 AND grade <> 3;

----------------------
LIKE 패턴 검색
    LIKE
        % _
        %: 아무거나 아무갯수 0~n개
        _: 그 위치에 한개
        
select * 
from emp
WHERE ename LIKE '%MI%';  --MIND MOM MOUSE MOUNTAIN
--where ename = 'WARD';

select * 
from emp
where ename LIKE '%MI%';  --MI~  ~MI    ~MI~
--where ename LIKE 'MI%';  --MIND  MOM  Mountain  M
--where ename = 'WARD';

select * 
from emp
where ename LIKE '_MI';  -- 3글자 2~3번째가 MI
where ename LIKE '_MI__';  -- 5글자 2~3번째가 MI
where ename LIKE '_MI%';  -- n개~글자수 2~3번째가 MI

--< <= > >=

select *
from emp
WHERE hiredate < '1981-05-01';
--WHERE hiredate = '81/05/01';

select *
from student;

-----------------
정렬 ORDER BY
*정렬을 사용하지 않으면 순서보장X
ORDER BY 정렬할 기준이되는 컬럼명 [ASC|DESC] [오름차순|내림차순]

SELECT ...
FROM ...
WHERE ...
ORDER BY ...

SELECT ...
FROM ...
ORDER BY ...
;

select * 
from student
ORDER BY name; --name 기준 오름차순 정렬

select * 
from student
ORDER BY name DESC; --name 기준 내림차순 정렬



select * 
from student
ORDER BY grade DESC; --학년기준 내림차순

select *
from student
ORDER BY birthday;  --생일 기준 오름차순


select *
from student
ORDER BY birthday DESC;  --생일 기준 내림차순 (큰 수 -> 작은 수 방향)
                 --날짜에서 큰 수는? 더 최근/미래   작은수? 더 과거
                 
SELECT *
FROM student
WHERE grade IN (1,2,3)  --학년 1,2,3 년만 조회
ORDER BY grade, height DESC;  --학년 오름차순 정렬, 키는 내림차순 정렬



----------
집합연산자
UNION  합집합 (중복제거)
UNION ALL 합집합 (중복제거X)
INTERSECT  교집합
MINUS   차집합

    조건(제약)
        1. 컬럼 갯수 동일
        2. 컬럼 데이터형 동일
        3. 컬럼명은 상관없음

--학생들 중에 101번학과 학생들과 102번 학과 학생들 조회
select *
from student
WHERE deptno1 IN (101, 102);

select *
from student
WHERE deptno1 = 101
UNION ALL
select *
from student
WHERE deptno1 = 102;

-- 각 테이블 조회 결과 갯수/타입이 일치하는 형태로 만들어서 결합
select studno, name, deptno1  --숫자 / 문자 / 숫자   3개
from student
WHERE deptno1 = 101
UNION ALL
select profno, name, deptno  --숫자 / 문자 / 숫자   3개
from professor
WHERE deptno = 101;

select studno, name, deptno1  --숫자 / 문자 / 숫자   3개
from student
WHERE deptno1 = 101
UNION ALL
select profno, name, 0  --숫자 / 문자 / 숫자(인위적으로 숫자형태 갯수 맞추기)   3개
from professor
WHERE deptno = 101;


select 
    studno idno, 
    name, 
    deptno1 "deptno", 
    null AS "email"  --숫자 / 문자 / 숫자   3개
from student
WHERE deptno1 = 101
UNION ALL
select 
    profno, 
    name, 
    deptno, 
    email  --숫자 문자 숫자 문자 4개
from professor
WHERE deptno = 101;

select studno, name, deptno1, 1 divtype  --숫자 / 문자 / 숫자   3개
from student
WHERE deptno1 = 101
UNION ALL
select profno, name, deptno, 2 --숫자 / 문자 / 숫자   3개
from professor
WHERE deptno = 101;

select studno, name, deptno1, 'STD' divtype  --숫자 / 문자 / 숫자   3개
from student
WHERE deptno1 = 101
UNION ALL
select profno, name, deptno, 'PRF' --숫자 / 문자 / 숫자   3개
from professor
WHERE deptno = 101;

select studno, name, deptno1, '학생' divtype  --숫자 / 문자 / 숫자   3개
from student
WHERE deptno1 = 101
UNION ALL
select profno, name, deptno, '교수' --숫자 / 문자 / 숫자   3개
from professor
WHERE deptno = 101;


select *
from student
where deptno1 = 101
INTERSECT
select *
from student
where deptno2 = 201;

select *
from student
where deptno1 = 101 AND deptno2 = 201;


select *
from emp
WHERE job = 'SALESMAN' AND comm > 400
MINUS  --차집합
select *
from emp  --그동안 포상을 받은 직원 목록   emp_cele
WHERE hiredate < '1982-01-01';

