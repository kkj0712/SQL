--1.���̺��� ��� ������ ��������
SELECT * FROM employees;
--2.WHERE ���� ������ ���ǿ� �´� ���� �����Ѵ�.
--  ��ġ�� FROM�� ������ ��ġ
SELECT * 
FROM employees
WHERE department_id=90; --90�� �μ���

SELECT * 
FROM employees
WHERE salary=24000; --������ 24000�� ����

/*
WHERE�� ���� ������
����(String)�� ��¥(Date) ���� �׻� ��������ǥ(')�� ǥ��
���ڰ��� ��ҹ��ڸ� �����Ѵ�. (Case-Sensitive)
��¥���� ��¥���˿� ����� �ʵ��� (Format-Sensitive)
����Ŭ�� ��¥������ RR/MM/DD (RR�� 2�ڸ� �⵵)
*/
--3.WHERE+���ڿ�
SELECT employee_id, first_name, last_name, job_id
FROM employees
WHERE first_name='Steven';
--4.WHERE+��¥
SELECT SYSDATE FROM DUAL; 
--dual�� �������̺�, SYSDATE �� ���� ��¥ �ð�


--5.�񱳿�����
--��¥��
SELECT *
FROM employees
WHERE hire_date>='03/06/32'; --�⵵/��/��¥
--���ں�
SELECT *
FROM employees
WHERE salary>=10000;
--���ں� (���ĺ���)
SELECT *
FROM employees
WHERE first_name>'King';

SELECT *
FROM employees
WHERE employee_id=100;

SELECT *
FROM employees
WHERE first_name='David';

SELECT *
FROM employees
WHERE employee_id<=105;

SELECT *
FROM job_history
WHERE start_date>'06/3/3';

SELECT *
FROM departments
WHERE location_id<>1700; --!=1700

--6.AND OR
SELECT *
FROM employees
WHERE department_id=60 OR
(department_id=80 AND salary > 10000);

SELECT *
FROM employees
WHERE (department_id=60 OR
department_id=80) AND salary > 10000;

SELECT *
FROM employees
WHERE hire_date > '08/04/04' OR salary > 13000
AND job_id = 'AD_VP';

SELECT *
FROM employees
WHERE NOT(hire_date > '04/01/01' OR salary > 5000);
--(hire_date<='04/01/01' AND salary <=5000)

SELECT *
FROM employees
WHERE salary > 4000 AND job_id='IT_PROG';

SELECT *
FROM employees
WHERE salary > 4000 AND (job_id='IT_PROG' OR job_id='FI_ACCOUNT');

--IN
SELECT *
FROM employees
WHERE salary = 4000 
OR salary = 3000 OR salary = 2700;

SELECT *
FROM employees
WHERE salary IN (4000, 3000, 2700);

SELECT *
FROM employees
WHERE salary IN (10000, 17000, 24000);

SELECT *
FROM employees
WHERE department_id NOT IN (30, 50, 80, 100, 110);

--BETWEEN
SELECT *
FROM employees
WHERE salary >= 9000 AND salary <=10000;

SELECT *
FROM employees
WHERE salary BETWEEN 9000 AND 10000;

SELECT *
FROM employees
WHERE salary BETWEEN 10000 AND 20000;

SELECT *
FROM employees
WHERE hire_date BETWEEN '04/01/01' AND '04/12/30';

SELECT *
FROM employees
WHERE salary NOT BETWEEN 7000 AND 17000;

/*
LIKE ������ (%, _)
*/

SELECT *
FROM employees
WHERE last_name LIKE 'B%';

SELECT *
FROM employees
WHERE last_name LIKE '%B%';

SELECT *
FROM employees
WHERE first_name LIKE '_d%';

SELECT *
FROM employees
WHERE first_name LIKE '__s%';

--����
SELECT *
FROM employees
WHERE job_id LIKE '%AD%';

SELECT *
FROM employees
WHERE job_id LIKE '%AD___';

SELECT *
FROM employees 
WHERE phone_number LIKE '%1234';

SELECT *
FROM employees
WHERE phone_number NOT LIKE '%3%' AND phone_number LIKE '%9';

SELECT *
FROM employees
WHERE job_id LIKE '%MGR%' OR job_id LIKE '%ASST%';

/*
IS NULL/ IS NOT NULL
*/

SELECT *
FROM employees
WHERE commission_pct IS NULL;

SELECT *
FROM employees
WHERE commission_pct IS NOT NULL;

SELECT *
FROM employees
WHERE manager_id IS NULL;

--ORDER BY
SELECT *
FROM employees
ORDER BY last_name DESC;

SELECT *
FROM employees
ORDER BY salary;

--��Ƽ ����
SELECT department_id, employee_id, first_name, last_name
FROM employees
ORDER BY department_id, employee_id DESC;
--(�μ� ��ȣ�� �������� ���� �� �ߺ��� ��� �����ȣ�� �������� ����)

--���� �����Ͽ� ����
SELECT employee_id, last_name, salary*12 AS "����"
FROM employees
ORDER BY "����" DESC;

SELECT department_id, employee_id, last_name, salary*12 AS "����"
FROM employees
WHERE department_id=90
ORDER BY "����" DESC;

SELECT department_id, last_name, salary*12 AS "����"
FROM employees
ORDER BY 3 DESC;

--����
SELECT employee_id, first_name, last_name
FROM employees
ORDER BY employee_id DESC;

SELECT *
FROM employees
WHERE job_id LIKE '%CLERK%'
ORDER BY salary DESC;

SELECT *
FROM employees
WHERE employee_id BETWEEN 120 AND 150
ORDER BY department_id DESC, salary DESC;