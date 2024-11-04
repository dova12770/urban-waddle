
--1.
SELECT ename,
    replace(ename,SUBSTR(ename,3,2),'--')"REPLACE"
FROM emp
WHERE deptno=20;

--2.
SELECT name,
    replace(jumin,SUBSTR(jumin,7,7),'-/-/-/-')주민뒷자리숨김 
FROM student
WHERE deptno1= 101;

--3.
SELECT name,
    tel,
    replace(tel,SUBSTR(tel,INSTR(tel,')')+1,INSTR(tel,'-')-5),'***')"REPLACE"
FROM student
WHERE deptno1= 102;

--3-Option.
SELECT name,
    tel,
    --replace(tel,SUBSTR(tel,INSTR(tel,')')+1,INSTR(tel,'-')-5),'***')"REPLACE",
    SUBSTR(tel, 1, INSTR(tel,')'))
    || LPAD('*',(INSTR(tel,'-') - INSTR(tel, ')') - 1 ),'*')
    || SUBSTR(tel,-5,5)"REPLACE"
FROM student
WHERE deptno1= 102;

--4.
SELECT name,
    tel,
    replace(tel,substr(tel,INSTR(tel,'-')+1),'****')"REPLACE"
FROM student
WHERE deptno1= 101;

