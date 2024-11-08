--subquery

select*
from emp;

--tkqjsdl 7844인 사원과 같은 부서 사람들 조회
select *
from emp
where deptno =(select deptno
                from emp
                where empno =7844);

select deptno
from emp
where empno =7844;

select * from emp2;

select * from dept2;

select * 
from dept2
where area ='Pohang Main Office';

select *
from emp2
where deptno in (select dcode
                from dept2
                where area ='Pohang Main Office');

select *
from emp2
where deptno =&dno;  --%dno 입력표시창 휘발성 :dno 바인드 지속성

select *
from emp2
where deptno =:dno;

    
select * 
from dept
where exists(select deptno
            from dept 
            where deptno =&dno);

select *
from emp2
where exists (select dcode
            from dept2
            where area ='Pohang Main Office'
            and dcode = deptno);

--다중 컬럼
select grade, name, weight
from student
where (grade,weight) in(select grade ,MAX(weight)
                        from student
                        group by grade);

select grade ,MAX(weight)
from student
group by grade;

select *
from emp2 a
where a.pay >=(  select avg(b.pay)
            from emp2 b
            where a.position = b.position);

--join
select e.name, d.dname
from emp2 e, dept2 d
where e.deptno=d.dcode;

--subquery
select danme
from dept2
where dcode =1006;

select name, (select dname 
                from dept2 
                where dcode = deptno) dname
from emp2;

select 
    e.name,
    (select daname
     from dept2 d
     where e.deptno = d.decode) dname
     -- where dcode > deptno) dname 다중행 결과를 만들어서 x
from emp2;

select dname from dept2 where dcode>1010;


select empno,ename, job,'직원'
from emp;

--JAVA avjPay    낙타스타일
--DB    avg_pay  뱀스타일


        --pay 컬럼들의 평균값
select MIN(avg_pay)    --컬럼명 AVG(pay) XX
from (select deptno, avg(pay) avg_pay   --컬럼명 AVG(pay)
        from emp2
        group by deptno);
        
select 1+2+3 result from dual;

SELECT *
FROM emp;

select sal,mgr
from(select empno, ename , job ,mgr ,sal
from emp);

select * from dept;

--group by 집계 -> join
select e.deptno,e.max_sal, d.dname
from(select deptno, max(sal) max_sal
        from emp
        group by deptno) e, dept d
where e.deptno = d.deptno;

--join => groupby

select deptno,max(sal)
from(select e.sal, e.deptno, d.dname
        from emp e, dept d
        where e.deptno = d.deptno)
group by deptno,dname;



