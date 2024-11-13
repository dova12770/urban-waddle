select *
from professor;

select *
from dept2;

INSERT INTO dept2 
VALUES (9010,'temp_10',1006,'temp_area');

INSERT INTO dept2 (dcode,dname,pdept)
VALUES (9020,'temp_20',1006);
-------------------------------------
create table professor4
as
select profno,name,pay
from professor
where profno<3000;

create table professor4
as
select profno,name,pay
from professor
where 1=2;

INSERT INTO professor4
select profno,name,pay
from professor
where profno<3000;

update professor
set bonus = 100
where name ='Sharon Stone';
