
SELECT s.name, s.deptno1, d.dname
FROM student s, department d
where
    s.deptno1=d.deptno
    and
    s.deptno1 =(select deptno1
                from student
                where name = 'Anthony Hopkins');

select p.name, p.hiredate,d.dname
from professor p, department d
where
    p.deptno = d.deptno
    AND
    p.hiredate>(select hiredate
                from professor
                where name = 'Meg Ryan')
order by hiredate;

select name, weight
from student
where weight > (select avg(weight)
                from student
                where deptno1=201);
