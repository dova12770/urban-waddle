--복수행 함수

COUNT(대상) 갯수

SELECT count(*)
FROM emp;

select count(empno), count(*)
from emp;

select count(job),count(mgr),count(hiredate),count(comm)
--select *
from emp;

select count(*)
form emp
where comm is not null;

select sum(sal),count(*)
from emp;

--10,20번 부수 다니는 애들 총 몇명? 총 급여 얼마?
select count(*),sum(sal)
from emp
where deptno in (10,20);


SELECT 
    AVG(height), 
    MAX(height), 
    MIN(height), 
    STDDEV(height), 
    VARIANCE(height)
    /*
    height,
    NVL(height,130)*/
FROM student;


--student 평균 키!
--전체평균키 X, 각 학년별 평균 키!

SELECT 
    '1학년' 학년,
    AVG(height)
FROM student
WHERE grade=1
UNION ALL
SELECT 
    '2학년',
    AVG(height)
FROM student
WHERE grade=2
UNION ALL
SELECT 
    '3학년',
    AVG(height)
FROM student
WHERE grade=3
UNION ALL
SELECT 
    '4학년',
    AVG(height)
FROM student
WHERE grade=4;

SELECT...
FROM...
WHERE...
GROUP BY
ORDER BY

--GROUP BY 특정컬럼을 기준으로 그룹지어서 계산
--GROUP BY 에 명시된 컬럼은 같이 조회 가능
SELECT grade, AVG(height)
FROM student
GROUP BY grade;

SELECT studno, AVG(height) 
FROM student
GROUP BY studno;




