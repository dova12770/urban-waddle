
select 
    p.p_date 판매일자,
    p.p_code 상품코드,
    pr.p_name 상품명,
    TO_CHAR(pr.p_price,'9,999') 상품가,
    p.p_qty 구매수량,
    TO_CHAR(p.p_total,'9,999')총금액,
    TO_CHAR(p.p_total*100,'999,999') 적립포인트,
    TO_CHAR((decode(substr(p.p_date,5,4), '0101', p.p_total*200, p.p_total*100)),'9,999,999') 새해적립포인트,
    g.gname 사은품명,
    TO_CHAR(g.g_start,'999,999') 포인트START,
    TO_CHAR(g.g_end,'999,999,999') 포인트END
from panmae p, product pr, gift g
where 
    p.p_code = pr.p_code  
   and
    (decode(substr(p.p_date,5,4), '0101', p.p_total*200, p.p_total*100))
    between g.g_start and g.g_end
order by p.p_date
;

SELECT 
    TO_CHAR(TO_DATE(p.p_date),'YYYY-MM-DD') 판매일자,
    p.p_code 상품코드,
    pr.p_name 상품명,
    TO_CHAR(pr.p_price,'9,999') 상품가,
    p.p_qty 구매수량,
    TO_CHAR(p.p_total,'9,999') 총금액,
    TO_CHAR(p.p_total*100,'999,999') 적립포인트,
    /*case
        to_char(to_date(p.p_date),'mmdd')
        when '0101' then '새해첫날이벤트'
        else '이벤트 아님'
    end*/
    /*case
        when ( to_char(to_date(p.p_date),'mmdd')='0101') then p.p_total*200
        else p.p_total*100
    end 새해2배적립포인트,*/
    TO_CHAR((decode(substr(p.p_date,5,4), '0101', p.p_total*200, p.p_total*100)),'9,999,999') 새해2배적립포인트,
    g.gname 사은품명,
    TO_CHAR(g.g_start,'999,999') 포인트START,
    TO_CHAR(g.g_end,'999,999') 포인트END
from panmae p ,product pr, gift g
where 
    p.p_code = pr.p_code
    AND  
    (decode(substr(p.p_date,5,4), '0101', p.p_total*200, p.p_total*100))
    BETWEEN g.g_start AND g.g_end
order by p.p_date
;
