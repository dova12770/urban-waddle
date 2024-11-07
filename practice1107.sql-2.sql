
select s.name STUD_NAME, s.deptno1 DEPT_NO, d.dname DEPT_NAME
from student s, department d
where s.deptno1 =d.deptno
    and
    s.deptno1 =(select deptno1
from student
where name = 'Anthony Hopkins');
    
select deptno1
from student
where name = 'Anthony Hopkins';

select 
    p.name NAME, 
    p.hiredate HIREDATE,
    d.dname DNAME
FROM professor p, department d
WHERE 
    p.hiredate>(select hiredate
                from professor
                where name ='Meg Ryan')
    and p.deptno =d.deptno;


select * from department;
select * from student;

select name, weight
from student
where 
    weight > (SELECT AVG(weight) 
                FROM student 
                where deptno1=201);

SELECT AVG(weight) FROM student where deptno1=201 ;