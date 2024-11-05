SELECT * 
FROM professor;
SELECT * 
FROM student;


1.
SELECT deptno,name,
    DECODE(name,'Audie Murphy',DECODE(deptno,101,'BEST!')) "DECODE"
FROM professor;

2.
SELECT deptno,name,
     DECODE(deptno,101,DECODE(name,'Audie Murphy','BEST!','GOOD')) "비고"
FROM professor;

3.
SELECT deptno,name,
    DECODE(deptno,101,DECODE(name,'Audie Murphy','BEST!','GOOD'),'N/A') "비고"
FROM professor;

4.
SELECT 
    name,
    jumin,
    DECODE(substr(jumin,7,1),1,'남자',2,'여자')"성별"
FROM student
WHERE deptno1=101;

5.
SELECT 
    name,
    tel,
    DECODE(SUBSTR(tel,1,INSTR(tel,')')-1),02,'서울',031,'경기',051,'부산',052,'울산',055,'경남','기타지역')"지역명"
FROM student
WHERE deptno1=101;
