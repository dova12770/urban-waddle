SELECT * 
FROM emp2;

SELECT * 
FROM p_grade;

1.
SELECT s.name, s.deptno1, d.dname
FROM student s, department d
WHERE s.deptno1 =d.deptno
ORDER BY s.deptno1;


2.
SELECT 
    e.name,
    e.position,
    to_char(e.pay,'999,999,999') "PAY",
    to_char(p.s_pay,'999,999,999') "LOW PAY", 
    to_char(p.e_pay,'999,999,999') "HIGH PAY" 
FROM emp2 e, p_grade p
WHERE
    e.position = p.position(+)
    AND
    e.position is not null
ORDER BY e.pay;

3.
SELECT 
    e.name,
    TRUNC(MONTHS_BETWEEN('2010-05-30',e.birthday)/12)+1 나이,
    e.position 현재포지션,
    p.position 지금나이에맞는포지션
FROM emp2 e, p_grade p
WHERE 
  TRUNC(MONTHS_BETWEEN('2010-05-30',e.birthday)/12)+1 BETWEEN s_age AND e_age
order by TRUNC(MONTHS_BETWEEN('2010-05-30',e.birthday)/12)+1;

SELECT
    name,
    TO_CHAR(TO_DATE('2010-0530'),'YYYY')-TO_CHAR(birthday,'YYYY') + 1 한국나이,
    e.position,
    p.position
FROM emp2 e, p_grade p
WHERE
    TO_CHAR(TO_DATE('2010-0530'),'YYYY')-TO_CHAR(birthday,'YYYY') + 1 BETWEEN s_age AND e_age
ORDER BY TO_CHAR(TO_DATE('2010-0530'),'YYYY')-TO_CHAR(birthday,'YYYY') + 1;

SELECT c.gname,c.point, g.gname
FROM customer c, gift g
WHERE 
    c.point >= g.g_start
    AND
    g.gname = 'Notebook'
order by c.point DESC
;

SELECT * FROM professor;

SELECT 
    profno, 
    name, 
    hiredate,
    rank() over (order by hiredate) -1 count
FROM professor;

select
    p.profno,p.name,p.hiredate,count(p1.profno) COUNT
from professor p, professor p1
where p.hiredate > p1.hiredate(+)
group by p.profno,p.name,p.hiredate
order by p.hiredate;

SELECT empno,ename,hiredate,rank() over(order by hiredate)-1
FROM emp;

select e1.empno,e1.ename,e1.hiredate, count(e2.empno) count
from emp e1, emp e2
where e1.hiredate > e2.hiredate(+)
group by e1.empno,e1.ename,e1.hiredate
order by e1.hiredate;


