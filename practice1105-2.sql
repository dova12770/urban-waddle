SELECT *
FROM emp;

1.
SELECT AVG(sal) 전체급여평균
FROM emp;

2.
SELECT AVG(sal) "30번부서평균급여"
FROM emp
WHERE deptno = 30;

3.
SELECT deptno 부서, AVG(sal) 평균급여
FROM emp
GROUP BY deptno
ORDER BY deptno;

4.
SELECT deptno,count(deptno) 부서인원, AVG(sal) 평균급여
FROM emp
GROUP BY deptno
ORDER BY deptno;

5.
SELECT job 직업, AVG(sal) 평균급여
FROM emp
GROUP BY job;

6.
SELECT job 직업, MAX(sal) 가장높은급여
FROM emp
GROUP BY job;

7.
SELECT deptno 부서, MAX(sal) 가장높은급여
FROM emp
GROUP BY deptno;