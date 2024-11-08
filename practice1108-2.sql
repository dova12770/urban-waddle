select *
from department;

select *
from professor;

SELECT hiredate
FROM professor
group by deptno;

SELECT  
    p1.profno,
    p1.name,
    p1.hiredate,
    d.dname
FROM professor p1, department d
where
    p1.deptno = d.deptno
    and
    (p1.deptno,p1.hiredate) in(SELECT deptno,min(hiredate)
                    FROM professor
                    group by deptno);
            
            
            
select name,position,to_char(pay,'$999,999,999') pay
from emp2
where
(position,pay) in(select position,max(pay)
                from emp2
                group by position)
order by pay;
