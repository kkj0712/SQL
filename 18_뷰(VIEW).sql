--�ܼ��� view ����� EMP_V1
--�ϳ��� �������̺� ���, �Լ��� �׷� ��� ����, DML ��밡��
DROP VIEW EMP_V1; --�̸� �� ���� ���

--employees ���̺��� �ʿ��� ������ ��� ��� ����
CREATE VIEW EMP_V1
AS
SELECT employee_id, last_name, email, hire_date, job_id
FROM employees;

--���̺�ó�� select �� ���
SELECT * FROM emp_v1;

DESC emp_v1;

--���̺�ó�� DML ��밡��(��� ������ ���̺� => ���� ���̺� �Էµ�)
INSERT INTO EMP_V1 
    (employee_id, last_name, email, hire_date, job_id)
VALUES (333, 'David', 'DAVID', SYSDATE,'IT_PROG');

--�信 �Էµ� ������ Ȯ��
SELECT * FROM emp_v1;
SELECT * FROM employees;
DESC employees;

--�����ϱ�
DELETE FROM emp_v1
WHERE employee_id = 333;
commit;

--�� ���̺� emp_v2 �����
CREATE VIEW emp_v2
AS
SELECT employee_id ������ȣ, last_name �̸�, 
       email, hire_date, job_id
FROM employees;

SELECT * FROM emp_v2;

--�� ���̺� emp_v3 �����
CREATE VIEW emp_v3 (������ȣ, �̸�, �̸���, �������, ����)
AS
SELECT employee_id, last_name, email, hire_date, job_id
FROM employees;

SELECT * FROM emp_v1;
SELECT * FROM emp_v2;
SELECT * FROM emp_v3;
SELECT * FROM employees;

--DML ��� (emp_v3)
INSERT INTO emp_v3 (������ȣ, �̸�, �̸���, �������, ����)
VALUES (334, 'LaLa', 'LaLa', SYSDATE, 'IT_PROG');

--������ �� �����
--�׷��Լ��� ����� ��� DML ��� �Ұ�
--OR REPLACE�� ����Ͽ� ������ ������
CREATE OR REPLACE VIEW �μ���_����_����
AS
SELECT department_id �μ���ȣ, count(employee_id) ������, 
    MAX(salary) �ְ�޿�, MIN(salary) �����޿�,
    ROUND(AVG(salary)) ��ձ޿�
FROM employees
GROUP BY department_id
ORDER BY �μ���ȣ;

SELECT * FROM �μ���_����_����;
INSERT INTO �μ���_����_����
VALUES (200, 4, 5000, 1000);

--�б� ���� �� (�ɼ� WITH READ ONLY)
CREATE OR REPLACE VIEW EMP_V_read
AS
SELECT employee_id, last_name, email, 
    hire_date, job_id
FROM employees
WHERE department_id = 90
WITH READ ONLY; --�б� ����
SELECT * FROM emp_v_read;

--DML ��� �Ұ�
DELETE FROM EMP_V_READ; --��� �� ����

--üũ �ɼ� ��
CREATE OR REPLACE VIEW emp_v_check
AS 
SELECT employee_id, last_name, email, 
    hire_date, job_id, department_id
FROM employees
WHERE department_id = 90
WITH check option; --where���� ���ǿ����� ���� �� �Է� ����

SELECT * FROM emp_v_check;

--90�� �μ� �϶��� DML ����
INSERT INTO emp_v_check (employee_id, last_name, email, 
    hire_date, job_id, department_id)
VALUES (444, '�˸�', 'ALI', SYSDATE, 'IT_PROG', 10);
