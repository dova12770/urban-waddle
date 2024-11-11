
select (select dname
        from department
        where deptno = deptno1) danme,
        height max_height,name, height
from student
where 
    (deptno1,height) in (select deptno1,max(height)
                        from student
                        group by deptno1);

select s1.grade, s1.name,s1.height,s.avg_height                        
from(select grade, avg(height) avg_height
from student
group by grade) s, student s1
where 
    s.grade=s1.grade
    and
    s1.height > s.avg_height
;

select *
from emp2;

select *
from dept2;



select area
from dept2
where
    dcode=( select deptno
            from emp2
            where 
                name = 'AL Pacino');