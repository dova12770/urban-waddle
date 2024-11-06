--join 01

select *
from emp;

select *
from dept;

--조인기준  deptno 가 같은

--select empno, ename, dname, loc,B.deptno
select A.empno, A.ename, B.dname, B.loc, B.deptno
--select *
from emp A, dept B
WHERE A.deptno = B.deptno;

select A.empno, A.ename, B.dname, B.loc, B.deptno
from emp A INNER JOIN dept B
ON A.deptno = B.deptno;


--카디션 곱
select *
from emp A, dept B;
--WHERE A.deptno = B.deptno;

SELECT *
FROM student;

SELECT COUNT(*)
FROM student;

SELECT *
FROM professor;

SELECT *
FROM student s, professor p
WHERE s.profno = p.profno;

SELECT *
FROM student s INNER JOIN professor p
ON s.profno = p.profno;

--INNER JOIN vs OUTER JOIN
SELECT *
FROM student s, professor p
WHERE s.profno = p.profno(+);
--WHERE s.profno(+) = p.profno;
--WHERE p.profno = s.profno(+);

SELECT *
FROM student s LEFT OUTER JOIN professor p
--FROM student s RIGHT OUTER JOIN professor p
--FROM professor p RIGHT OUTER JOIN student s
ON s.profno = p.profno;

select *
from student;

select *
from department;

select *
from professor;

SELECT 
    s.name STU_NAME,
    d.dname DEPT_NAME,
    p.name PROF_NAME
FROM student s,department d, professor p
WHERE s.profno = p.profno and
      s.deptno1 = d.deptno;

SELECT 
    s.name STU_NAME,
    d.dname DEPT_NAME,
    p.name PROF_NAME
FROM 
    student s 
    INNER JOIN  professor p
    ON s.profno = p.profno
    INNER JOIN department d
    ON s.deptno1 = d.deptno;

SELECT 
    s.name STU_NAME,
    d.dname DEPT_NAME,
    p.name PROF_NAME
FROM student s,department d, professor p
WHERE s.profno = p.profno 
    and
      s.deptno1 = d.deptno;     --student 학과번호 = department 학과번호
      
SELECT 
    s.name STU_NAME,
    d.dname DEPT_NAME,
    p.name PROF_NAME
FROM student s,department d, professor p
WHERE s.profno = p.profno 
    and
      p.deptno = d.deptno;     --student 학과번호 = department 학과번호
      

--교수학과이름, 학생학과이름
SELECT 
    s.name, 
    s.deptno1, 
    d.dname, 
    s.profno,
    p.profno,
    p.name,
    p.deptno,
    d2.dname
FROM student s, professor p, department d, department d2
WHERE s.profno = p.profno 
    AND s.deptno1 = d.deptno
    AND p.deptno = d2.deptno;
    
select *
from customer;

SELECT * 
FROM gift;

-- 1~65000~100000

SELECT c.gname,c.point,g.gname
FROM customer c, gift g
WHERE c.point BETWEEN g.G_START AND g.G_END;

    
select *
from student s, professor p
where s.profno = p.profno;
    
select *
from student s, professor p
where s.profno = p.profno(+);

select *
from student s, professor p
where s.profno(+) = p.profno;

select *
from student;
