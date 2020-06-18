--문제 1
SELECT empno, ename, sal
FROM emp
WHERE deptno=10;

--문제 2
SELECT ename, hiredate, deptno 
FROM emp
WHERE empno = 7369;

--문제 3
SELECT *
FROM emp e
WHERE e.ename='ALLEN';

--문제 4
SELECT e.ename, e.deptno, e.sal
FROM emp e
WHERE e.hiredate = '81/02/20';

--문제 5
SELECT *
FROM emp
WHERE job <> 'MANAGER';

--문제 6
SELECT *
FROM emp
WHERE hiredate >= '81/04/02';

--문제 7
SELECT ename, sal, deptno
FROM emp
WHERE sal >= 800;

--문제 8
SELECT *
FROM emp
WHERE deptno >= 20;

--문제 9
SELECT *
FROM emp
WHERE ename >= 'L%';

--문제 10
SELECT *
FROM emp
WHERE hiredate < '81/12/09';

--문제 10
SELECT *
FROM emp
WHERE hiredate < '81/12/09';

--문제 11
SELECT empno, ename
FROM emp
WHERE empno <= 7698;

--문제 12
SELECT ename, sal, deptno
FROM emp
WHERE hiredate BETWEEN '81/04/02' AND '82/12/09';

--문제 13
SELECT ename, job, sal
FROM emp
WHERE sal BETWEEN 1601 AND 2999;

--문제 14
SELECT *
FROM emp
WHERE empno NOT BETWEEN 7654 AND 7782;

--문제 15
SELECT *
FROM emp
WHERE ename BETWEEN 'B%' AND 'J%'; 

--문제 16
SELECT *
FROM emp
WHERE NOT TO_CHAR(hiredate) LIKE '81%';

--문제 17
SELECT *
FROM emp
WHERE job = 'MANAGER' OR job = 'SALESMAN';

--문제 18
SELECT ename, empno, deptno
FROM emp
WHERE deptno NOT IN (20, 30);

--문제 19
SELECT empno, ename, hiredate, deptno
FROM emp
WHERE ename LIKE 'S%';

--문제 20
SELECT *
FROM emp
WHERE TO_CHAR(hiredate) LIKE '81%';

--문제 21
SELECT *
FROM emp
WHERE ename LIKE '%S%';

--문제 22
SELECT *
FROM emp
WHERE ename LIKE 'M____N';

--문제 23
SELECT *
FROM emp
WHERE SUBSTR(ename, 2, 1)='A';

--문제 24
SELECT *
FROM emp
WHERE comm IS NULL;

--문제 25
SELECT *
FROM emp
WHERE comm IS NOT NULL;

--문제 26
SELECT ename, deptno, sal
FROM emp
WHERE sal >= 1500 AND deptno=30;

--문제 27
SELECT empno, ename, deptno
FROM emp
WHERE ename LIKE 'K%' OR deptno=30;

--문제 28
SELECT *
FROM emp
WHERE sal>=1500 AND deptno=30 AND job='MANAGER'; 

--문제 29
SELECT *
FROM emp
WHERE deptno=30
ORDER BY empno;

--문제 30
SELECT *
FROM emp
ORDER BY sal DESC;

--문제 31
SELECT *
FROM emp
ORDER BY deptno ASC, sal DESC;

--문제 32
SELECT deptno, ename, sal
FROM emp
ORDER BY deptno DESC, ename ASC, sal DESC; 

--문제 33
SELECT ename, sal, ROUND((sal*0.13), 0) AS BONUS, deptno
FROM emp e
WHERE deptno=10;

--문제 34
SELECT ename, sal, NVL(comm,0),(sal+NVL(comm,0)) AS TOTAL
FROM emp
ORDER BY TOTAL DESC;

--문제 35
SELECT ename, sal, 
TO_CHAR((sal*0.15),'$999.9') AS 회비
FROM emp 
WHERE sal BETWEEN 1500 AND 3000;

--문제 36
SELECT d.dname, COUNT (e.empno)
FROM emp e
JOIN dept d
ON e.deptno=d.deptno
GROUP BY d.dname
HAVING count(empno)>5;

--문제 37
SELECT job, SUM(sal) 급여합계
FROM emp
WHERE job <> 'SALESMAN'
GROUP BY job
HAVING sum(sal)>5000
ORDER BY sum(sal) DESC;

--문제 38
SELECT empno, ename, sal, grade 
FROM emp
JOIN salgrade
ON sal BETWEEN losal AND hisal;

--문제 39
SELECT deptno, count(empno) 사원수,
count(comm) "커미션 받은 사원수"
FROM emp
GROUP BY deptno;

--문제 40
SELECT e.ename, e.deptno,
DECODE(e.deptno, '10', '총무부',
                 '20', '개발부',
                 '30', '영업부') 부서명
FROM emp e
JOIN dept d
ON e.deptno=d.deptno;