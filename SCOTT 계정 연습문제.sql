--���� 1
SELECT empno, ename, sal
FROM emp
WHERE deptno=10;

--���� 2
SELECT ename, hiredate, deptno 
FROM emp
WHERE empno = 7369;

--���� 3
SELECT *
FROM emp e
WHERE e.ename='ALLEN';

--���� 4
SELECT e.ename, e.deptno, e.sal
FROM emp e
WHERE e.hiredate = '81/02/20';

--���� 5
SELECT *
FROM emp
WHERE job <> 'MANAGER';

--���� 6
SELECT *
FROM emp
WHERE hiredate >= '81/04/02';

--���� 7
SELECT ename, sal, deptno
FROM emp
WHERE sal >= 800;

--���� 8
SELECT *
FROM emp
WHERE deptno >= 20;

--���� 9
SELECT *
FROM emp
WHERE ename >= 'L%';

--���� 10
SELECT *
FROM emp
WHERE hiredate < '81/12/09';

--���� 10
SELECT *
FROM emp
WHERE hiredate < '81/12/09';

--���� 11
SELECT empno, ename
FROM emp
WHERE empno <= 7698;

--���� 12
SELECT ename, sal, deptno
FROM emp
WHERE hiredate BETWEEN '81/04/02' AND '82/12/09';

--���� 13
SELECT ename, job, sal
FROM emp
WHERE sal BETWEEN 1601 AND 2999;

--���� 14
SELECT *
FROM emp
WHERE empno NOT BETWEEN 7654 AND 7782;

--���� 15
SELECT *
FROM emp
WHERE ename BETWEEN 'B%' AND 'J%'; 

--���� 16
SELECT *
FROM emp
WHERE NOT TO_CHAR(hiredate) LIKE '81%';

--���� 17
SELECT *
FROM emp
WHERE job = 'MANAGER' OR job = 'SALESMAN';

--���� 18
SELECT ename, empno, deptno
FROM emp
WHERE deptno NOT IN (20, 30);

--���� 19
SELECT empno, ename, hiredate, deptno
FROM emp
WHERE ename LIKE 'S%';

--���� 20
SELECT *
FROM emp
WHERE TO_CHAR(hiredate) LIKE '81%';

--���� 21
SELECT *
FROM emp
WHERE ename LIKE '%S%';

--���� 22
SELECT *
FROM emp
WHERE ename LIKE 'M____N';

--���� 23
SELECT *
FROM emp
WHERE SUBSTR(ename, 2, 1)='A';

--���� 24
SELECT *
FROM emp
WHERE comm IS NULL;

--���� 25
SELECT *
FROM emp
WHERE comm IS NOT NULL;

--���� 26
SELECT ename, deptno, sal
FROM emp
WHERE sal >= 1500 AND deptno=30;

--���� 27
SELECT empno, ename, deptno
FROM emp
WHERE ename LIKE 'K%' OR deptno=30;

--���� 28
SELECT *
FROM emp
WHERE sal>=1500 AND deptno=30 AND job='MANAGER'; 

--���� 29
SELECT *
FROM emp
WHERE deptno=30
ORDER BY empno;

--���� 30
SELECT *
FROM emp
ORDER BY sal DESC;

--���� 31
SELECT *
FROM emp
ORDER BY deptno ASC, sal DESC;

--���� 32
SELECT deptno, ename, sal
FROM emp
ORDER BY deptno DESC, ename ASC, sal DESC; 

--���� 33
SELECT ename, sal, ROUND((sal*0.13), 0) AS BONUS, deptno
FROM emp e
WHERE deptno=10;

--���� 34
SELECT ename, sal, NVL(comm,0),(sal+NVL(comm,0)) AS TOTAL
FROM emp
ORDER BY TOTAL DESC;

--���� 35
SELECT ename, sal, 
TO_CHAR((sal*0.15),'$999.9') AS ȸ��
FROM emp 
WHERE sal BETWEEN 1500 AND 3000;

--���� 36
SELECT d.dname, COUNT (e.empno)
FROM emp e
JOIN dept d
ON e.deptno=d.deptno
GROUP BY d.dname
HAVING count(empno)>5;

--���� 37
SELECT job, SUM(sal) �޿��հ�
FROM emp
WHERE job <> 'SALESMAN'
GROUP BY job
HAVING sum(sal)>5000
ORDER BY sum(sal) DESC;

--���� 38
SELECT empno, ename, sal, grade 
FROM emp
JOIN salgrade
ON sal BETWEEN losal AND hisal;

--���� 39
SELECT deptno, count(empno) �����,
count(comm) "Ŀ�̼� ���� �����"
FROM emp
GROUP BY deptno;

--���� 40
SELECT e.ename, e.deptno,
DECODE(e.deptno, '10', '�ѹ���',
                 '20', '���ߺ�',
                 '30', '������') �μ���
FROM emp e
JOIN dept d
ON e.deptno=d.deptno;