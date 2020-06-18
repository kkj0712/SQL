--���� ������ (UNION ��)

--UNION. ������ �ߺ����� 115��
SELECT employee_id, job_id
FROM employees
UNION
SELECT employee_id, job_id
FROM job_history;

--UNION ALL. ������ �ߺ����� 117��
SELECT employee_id, job_id
FROM employees
UNION ALL
SELECT employee_id, job_id
FROM job_history;

--INTERSECT.������ 2�� (2���� �ߺ��ȴٴ� ��)
SELECT employee_id, job_id
FROM employees
INTERSECT
SELECT employee_id, job_id
FROM job_history;

--MINUS.������ 105�� (2���� �ߺ��ȴٴ� ��)
SELECT employee_id, job_id
FROM employees
MINUS
SELECT employee_id, job_id
FROM job_history;

--����1
SELECT department_id
FROM employees
WHERE department_id IS NOT NULL
UNION 
SELECT department_id
FROM departments;

--����2
SELECT department_id
FROM employees
UNION ALL
SELECT department_id
FROM departments;

--����3
SELECT department_id
FROM employees
INTERSECT
SELECT department_id
FROM departments;

--����4
SELECT department_id
FROM departments
MINUS
SELECT department_id
FROM employees;