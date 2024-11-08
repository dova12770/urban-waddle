
SELECT 
    d.dname,
    s.max_height,
    s1.name,
    s1.height
FROM (select deptno1,max(height) max_height
                    from student
                    group by deptno1) s, student s1, department d
where 
    s.deptno1=s1.deptno1
    and
    s.max_height=s1.height
    and
    s1.deptno1=d.deptno
    ;

select s1.grade,s1.name,s1.height,s.avg_height
from(select grade, avg(height) avg_height
    from student
    group by grade) s,student s1
where 
    s1.grade=s.grade
    and
    s1.height>s.avg_height
    order by grade
;




select height MAX_HEIGHT, name, height
from student
where (deptno1,height) in (select deptno1,max(height)
                            from student
                            group by deptno1);
--1-2) 서브쿼리
select (select dname
        from department
        where deptno = deptno1) dname,
        height max_height , name, height
from student
where (deptno1,height) in (select deptno1,max(height)
                            from student
                            group by deptno1);
--2-1) join
select d.dname, t.max_height,s.name,s.height                          
from(select deptno1, max(height) max_height
                        from student
                        group by deptno1) t, student s,department d
where t.deptno1 = s.deptno1
and t.max_height =s.height
and s.deptno1 = d.deptno;
--and t.deptno1 = d.deptno;

--2-2) subquery
select (select dname
        from department
        where deptno = s.deptno1) dname, t.max_height,s.name,s.height                          
from(select deptno1, max(height) max_height
                        from student
                        group by deptno1) t, student s
where t.deptno1 = s.deptno1
and t.max_height =s.height;


select s.grade, s.name, s.height, t.avg_height
from
        (select grade, avg(height) avg_height
        from student
        group by grade) t, student s
where t.grade = s.grade
and t.avg_height < s.height
order by s.grade;

select 
    s.grade, 
    s.name, 
    s.height,
    (select AVG(t.height)              --내 학년 평균 키
            from student t
            where t.grade =s.grade
            ) avg_height
from student s
where s.height > (select AVG(t.height)              --내 학년 평균 키
                    from student t
                    where t.grade =s.grade
                    )
;
