
select 
    e.empno,
    e.name,
    e.deptno,
    d.dname,
    d.area,
    e.pay
from emp2 e, dept2 d,(select deptno,avg(pay) avg_pay
                        from emp2 e , dept2 d
                        where d.dcode = (SELECT deptno
                                            FROM emp2
                                            where 
                                            name='AL Pacino')
                        group by deptno) e1
where
    e.pay >= e1.avg_pay
    and
    e1.deptno = e.deptno
    and
    d.dcode=e.deptno
order by e.pay desc; 


select dcode
from dept2
where
    area = (select area
                from dept2
                where
                    dcode=(select deptno
                            from emp2
                            where name ='AL Pacino'));
(select avg(pay)
from emp2
where deptno in(select dcode
                from dept2
                where
                    area = (select area
                                from dept2
                                where
                                    dcode=(select deptno
                                            from emp2
                                            where name ='AL Pacino'))));

select e.empno, e.name, e.deptno, d.dname,d.area,e.pay
from emp2 e, dept2 d
where 
        d.dcode=e.deptno
    and
        pay > (select avg(pay)
                from emp2
                where deptno in(select dcode
                                from dept2
                                where
                                    area = (select area
                                                from dept2
                                                where
                                                    dcode=(select deptno
                                                            from emp2
                                                            where name ='AL Pacino'))));
