select name,position,pay
from emp2
where pay > any (select pay
            from emp2
            where position='Section head');


select *
from emp2
order by deptno;

select name,grade,weight
from student
where weight < any(select min(weight)
                    from student
                    where grade = 2 );
                    
SELECT  name,grade,weight
FROM student
WHERE weight <all (SELECT weight
                    FROM student
                    WHERE grade = 2 )
ORDER BY weight DESC;

select weight
from student
where grade = 2;

select *
from dept2;

select 
    d.dname,
    e.name,
    to_char(pay,'$99,999,999') SALARY
from emp2 e, dept2 d
where 
    e.deptno = d.dcode
    and
    e.pay < ALL(select AVG(pay)
                from emp2
                group by deptno);

select deptno,AVG(pay)
from emp2
group by deptno
;

1.
SELECT 
    name,
    position,
    TO_CHAR(pay,'$999,999,999') SALARY
FROM emp2
WHERE pay > any (SELECT pay
            FROM emp2
            WHERE position='Section head');
            
2.
SELECT  name,grade,weight
FROM student
WHERE weight < (SELECT min(weight)
                FROM student
                WHERE grade = 2 )
ORDER BY weight DESC;

3.
SELECT 
    d.dname,
    e.name,
    to_char(pay,'$99,999,999') SALARY
FROM emp2 e, dept2 d
WHERE 
    e.deptno = d.dcode
    AND
    e.pay < ALL(SELECT AVG(pay)
                FROM emp2
                GROUP BY deptno)
ORDER BY pay;
