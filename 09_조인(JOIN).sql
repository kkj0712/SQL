-- ����
SELECT e.employee_id, e.department_id, d.department_name
FROM employees  e
JOIN departments d
ON e.department_id = d.department_id;

--���� ����: ON �� ����
SELECT employee_id, first_name,
       job_id, job_title
FROM employees
NATURAL JOIN jobs;

--�⺻ ��������
SELECT e.employee_id, j.job_id, j.job_title
FROM employees e
JOIN jobs j
    ON e.job_id = j.job_id;

--WHERE �� �߰� 
SELECT e.employee_id, e.department_id, d.department_name
FROM employees  e
JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_id = 50;

--3�� ���̺� ����
SELECT e.employee_id, d.department_name, lo.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations lo ON d.location_id = lo.location_id;

--����
SELECT d.department_name �μ���, lo.city ���ø�,
co.country_name ������
FROM departments d
JOIN locations lo ON d.location_id = lo.location_id
JOIN countries co ON co.country_id = lo.country_id
WHERE lo.city IN ('Seattle', 'London') 
AND co.country_name LIKE 'United%';

--��ü ����
SELECT e.last_name ����, e.employee_id ������ȣ1,
m.last_name �Ŵ���, e.employee_id ������ȣ2
FROM employees e
JOIN employees m
    ON e.manager_id = m.employee_id;