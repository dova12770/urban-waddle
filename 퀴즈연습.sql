
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



select e.empno, e.name, e.deptno, d.dname,d.area,e.pay
from emp2 e, dept2 d
where 
    e.deptno = d.dcode
    and
    pay > (select avg(pay)
            from emp2
            where
                deptno in(select dcode
                            from dept2 
                            where
                            area = (select area
                                    from dept2
                                    where
                                        dcode=( select deptno
                                                from emp2
                                                where 
                                                    name = 'AL Pacino'))));

select *
from panmae;

select *
from product;

select *
from gift;



select 
    p.p_date 판매일자,
    p.p_code 상품코드,
    pr.p_name 상품이름,
    pr.p_price 상품가,
    p.p_qty 구매수량,
    p.p_total 총금액,
    p.p_total*100 적립포인트,
    decode(TO_char(substr(p.p_date,5,4)),'0101',p.p_total*200,p.p_total*100) 새해2배적립포인트,
    g.gname 사은품명,
    g.g_start 포인트START,
    g.g_end 포인트END
from panmae p, product pr, gift g
where 
    p.p_code = pr.p_code
    and
    (decode(TO_char(substr(p.p_date,5,4)),'0101',p.p_total*200,p.p_total*100)) between g.g_start and g.g_end
order by p.p_date;