--모닝

SELECT --내가한것
    deptno 부서번호, 
    AVG(sal) 평균급여
FROM emp
group by deptno
having AVG(sal)>=2000;

SELECT 
    deptno 부서번호, 
    ROUND(AVG(sal),2) 평균급여
FROM emp
GROUP BY deptno
HAVING AVG(sal)>=2000;


SELECT --내가한것
    p_date 판매일자,
    sum(p_qty) 판매수량,
    sum(p_total) 판매금액
FROM panmae
GROUP BY p_date
order by p_date;

SELECT 
    p_date 판매일자,
    SUM(p_qty) 판매수량,
    SUM(p_total) 판매금액
FROM panmae
GROUP BY p_date
ORDER BY p_date;