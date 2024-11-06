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

SELECT grade, AVG(height) height
FROM student
WHERE grade IN (1,2,3)
GROUP BY grade  --본래의 컬럼명을 쓸것(권장)
ORDER BY height;
--order by grade desc;

SELECT...
FROM...
WHERE...
GROUP BY
HAVING
ORDER BY


SELECT deptno,AVG(SAL)
FROM emp
--WHERE AVG(SAL) >=2000
GROUP BY deptno
HAVING AVG(sal) >=2000;

1) 급여가 1500 이상니 직원들만 대상으로, 부서별 평균 급여

SELECT deptno, AVG(sal)
FROM emp
WHERE sal>= 1500
GROUP BY deptno
;

2) 부서별 평균급여가 1500 이상인 경우만, 부서별 평균 급여 보여주기

SELECT deptno, AVG(sal)
FROM emp
GROUP BY deptno
HAVING AVG(sal) >= 1500
;

--
student 각 학년별 평균 몸무게
평균 몸무게 65키로 이상인 경우만 확인

SELECT grade,AVG(weight)
FROM student
GROUP BY grade
HAVING AVG(weight)>=65;

--
student 4학년을 제외하고
각 학년별 평균 몸무게
평균 몸무게 65키로 이상인 경우만 확인

SELECT grade,AVG(weight)
FROM student
WHERE grade <> 4
GROUP BY grade
HAVING AVG(weight)>=65;

--------
--ROLLUP

SELECT deptno, job, ROUND(AVG(sal),1)
FROM emp
GROUP BY DEPTNO, JOB;

SELECT deptno, job, ROUND(AVG(sal),1)
FROM emp
GROUP BY ROLLUP(DEPTNO, JOB);

select *
from emp
where job ='SALESMAN' and deptno =30;

GROUP BY ROLLUP(DEPTNO, JOB);
1)DEPTNO, JOB, 그룹화
2)DEPTNO 그룹화 계
3) () 그룹화 계

GROUP BY ROLLUP((DEPTNO, JOB));
1)(DEPTNO, JOB) 그룹화
2) () 그룹화 계

SELECT deptno, job, ROUND(AVG(sal),1)
FROM emp
GROUP BY ROLLUP((DEPTNO, JOB));

GROUP BY ROLLUP(DEPTNO, JOB, MGR);
1)DEPTNO, JOB, MGR 그룹화
2)DEPTNO, JOB  계
3)DEPTNO 그룹화 계
4) () 그룹화 계

GROUP BY ROLLUP(DEPTNO,(JOB, MGR) );
1)DEPTNO, JOB, MGR 그룹
2)DEPTNO 그룹화 계
3) () 그룹화 계

SELECT deptno, job, mgr, ROUND(AVG(sal),1)
FROM emp
GROUP BY ROLLUP(DEPTNO, JOB, MGR);

SELECT deptno, job, mgr, ROUND(AVG(sal),1)
FROM emp
GROUP BY ROLLUP(DEPTNO,(JOB, MGR) );


--RACK DENSE RANK

순위 RANK() OVER (ORDER BY 정렬기준)
그룹단위 순위 RANK() OVER (PARTITION BY 기준 ORDER BY 정렬기준)
            --              GROUP BY
SELECT 
    ename, 
    sal,
    RANK() OVER(ORDER BY sal desc),     --사람수 우선
    DENSE_RANK() OVER(ORDER BY sal desc)--순위 우선
FROM emp;

SELECT 
    name,
    height,
    RANK() OVER(ORDER BY height DESC) 순위1,
    DENSE_RANK() OVER(ORDER BY height DESC) 순위2,
    grade,
    RANK() OVER(PARTITION BY grade ORDER BY height DESC) 순위3,
    DENSE_RANK() OVER(PARTITION BY grade ORDER BY height DESC) 순위4
FROM student
ORDER BY grade, height DESC;

