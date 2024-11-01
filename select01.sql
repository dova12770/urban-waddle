
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
FROM STUDENT


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



