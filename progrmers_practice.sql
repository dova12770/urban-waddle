
CREATE TABLE product_quiz
(
product_id INTEGER NOT NULL,
product_code VARCHAR(8) NOT NULL,
price INTEGER NOT NULL
);

select *
from product_quiz;

INSERT INTO product_quiz VALUES (1, 'A1000011', 10000);
INSERT INTO product_quiz VALUES (2, 'A1000045', 9000);
INSERT INTO product_quiz VALUES (3, 'C3000002', 22000);
INSERT INTO product_quiz VALUES (4, 'C3000006', 15000);
INSERT INTO product_quiz VALUES (5, 'C3000010', 30000);
INSERT INTO product_quiz VALUES (6, 'K1000023', 17000);

create table count_quiz
(
    c_start NUMBER(5),
    c_end NUMBER(5)
);

INSERT INTO count_quiz VALUES (0,9999);
INSERT INTO count_quiz VALUES (10000,19999);
INSERT INTO count_quiz VALUES (20000,29999);
INSERT INTO count_quiz VALUES (30000,39999);

select *
from count_quiz;

select *
from product_quiz;

select count(price)
from product_quiz
where price < 10000;

select count(price)
from product_quiz
where 
price >= 10000
and
price < 20000;

select
    case
        when price between 0 and 9999 then '0'
        when price between 10000 and 19999 then '10000'
        when price between 20000 and 29999 then '20000'
        when price between 30000 and 39999 then '30000'
    end price_group
from product_quiz;

-------------------------------------------------------------------

--단순 계산먼저
select 0 PRICE_GROUP, COUNT(*) PRODUCTS
from product_quiz
where price BETWEEN 0 AND 9999
UNION ALL
select 10000, COUNT(*)
from product_quiz
where price BETWEEN 10000 AND 19999
UNION ALL
select 20000, COUNT(*)
from product_quiz
where price BETWEEN 20000 AND 29999
UNION ALL
select 30000, COUNT(*)
from product_quiz
where price BETWEEN 30000 AND 39999;

--group by 로 묶자

select
    floor(price/10000),price/10000
from product_quiz;
 10000  1
 9000   0
 22000  2
 15000  1
 30000  3
 17000  1
 
select 
    trunc(price/10000)*10000 price_group, 
    count(*) products
from product_quiz
group by trunc(price/10000) 
order by price_group;


--case문 활용 (방향성은 나쁘지 않았었네ㅠ)
select 
    case
        when price between 0 and 9999 then 0
        when price between 10000 and 19999 then 10000
        when price between 20000 and 29999 then 20000
        when price between 30000 and 39999 then 30000
    end price_group,
    count(*) products
from product_quiz
group by 
    case
        when price between 0 and 9999 then 0
        when price between 10000 and 19999 then 10000
        when price between 20000 and 29999 then 20000
        when price between 30000 and 39999 then 30000
    end
order by price_group;

--3.group by... subquery 를... 써본다면?

select price price_group, count(*) products
from(
    select product_id, product_code, trunc(price/10000)* 10000 price
    from product_quiz)
group by price
order by price;

select price_group*10000 price_group, count(*) products
from(
    select product_id, product_code, trunc(price/10000) price_group
    from product_quiz)
group by price_group
order by price_group;


select price price_group, count(*) products
from (
    select trunc(price/10000)*10000 price
    from product_quiz)
group by price
order by price;