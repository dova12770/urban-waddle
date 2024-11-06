
select *
from student;

select *
from score;

select *
from hakjum;

select 
    s.studno 학번,
    s.name 이름, 
    s2.total 점수, 
    h.grade 학점
from student s, score s2, hakjum h
WHERE s.studno = s2.studno 
    AND
    s2.total between h.min_point AND h.max_point
ORDER BY s2.total DESC;

select 
    s.studno 학번,
    s.name 이름, 
    s2.total 점수, 
    h.grade 학점
from student s, score s2, hakjum h
WHERE s.studno = s2.studno 
    AND
    s2.total between h.min_point AND h.max_point
    AND
    s.deptno1 in(101,102)
ORDER BY s2.total DESC;

SELECT 
    s.name,
    s.grade,
    p.name,
    p.deptno,
    d.dname
FROM student s, department d, professor p
WHERE s.deptno1<> 301 AND
    S.profno = p.profno AND
    p.deptno = d.deptno;
    
    




