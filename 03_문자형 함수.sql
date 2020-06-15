--������ �Լ��� ��ҹ��� �Լ��� ���� ���� �Լ��� ������.
--1.��ҹ��� ���� �Լ� (UPPER, LOWER, INITCATP)
SELECT 1+1
FROM DUAL; --DUAL���̺��� ������ ���̺�

SELECT LOWER ('SQL COURSE'), UPPER ('sql course'), INITCAP ('SQL COURSE')
FROM DUAL;

--�����Լ��� WHERE ���� ���
SELECT employee_id, first_name
FROM employees
WHERE UPPER (first_name) = 'PATRICK';

--2. ���� ���� �Լ�
--CONCAT
SELECT first_name, last_name, CONCAT (first_name, last_name) AS Ǯ����
FROM employees;

--SUBSRT (���̸�, m, n): m�� ���۹���, n�� �߶� ����
SELECT employee_id, 
first_name, 
SUBSTR (first_name, 1, 3), --ù��°���� 3���� ���ڸ� �߶󳽴�.
SUBSTR (first_name, 2, 4), --�ι�°���� 4���� ���ڸ� �߶󳽴�.
SUBSTR (first_name, 2, 3), --�ι�°���� 3���� ���ڸ� �߶󳽴�.
SUBSTR (first_name, -3) --����: ���������� ī��Ʈ. ������ 3���� ���ڸ� �߶󳽴�.
FROM employees;

--LENGTH
SELECT first_name, LENGTH (first_name)
FROM employees;

--INSTR (���ڿ�, ã�� ���� M,N)
--M�� �˻� ���� ��ġ
--N�� ã�� Ƚ��
--����Ʈ ���� M,N ���� 1

SELECT first_name,
INSTR (first_name, 'e', 2), --�ι�° ���� e�� �˻�
INSTR (first_name, 'e', 5), --�ټ���° ���� e�� �˻�
INSTR (first_name, 'e', 1, 2) --ù��°���� ã�µ� 2��° ������ e�� �ڸ���
FROM employees
WHERE first_name = 'Nanette';

--lpad/rpad
SELECT employee_id, first_name, salary, 
LPAD (salary, 10, '#'), RPAD (salary, 10, '*')
FROM employees;

--������ �̿��� ���ڿ��� �и�
SELECT
'ȫ �浿' ����,
SUBSTR('ȫ �浿', 1, INSTR('ȫ �浿', ' ')-1) ��
FROM DUAL; 
--�̸��� ������ ������ ���� ���. ������ ������ ���ڸ� ������ 
--INSTR�Լ��� ������ �� ��° �ִ��� �� �� �ִ�.
--INSTR�Լ��� ���ϰ��� 2. SUBSTR(�̸�, 1,1)�� �ǹǷ� ù��° ���ڸ� ��ȯ

SELECT
'���� �浿' ����,
SUBSTR('���� �浿', 1, INSTR('���� �浿', ' ')-1) ��
FROM DUAL; 

SELECT
'���� �浿' ����,
SUBSTR('���� �浿', 1, INSTR('���� �浿', ' ')-1) ��,
SUBSTR('���� �浿', INSTR('���� �浿', ' ')+1) �̸� --�̸��� ��ĭ �ڸ������� ���ڸ� ����
FROM DUAL; 

SELECT last_name, CONCAT('�������� ', job_id) AS ������
FROM employees
WHERE SUBSTRB(job_id, 4, 3)='REP';

SELECT employee_id, 
    CONCAT (first_name, last_name) ��ü�̸�,
    last_name,
    LENGTH (last_name) ����,
    INSTR (last_name, 'a') "'a'�� ���°?"
FROM employees;

SELECT job_id, REPLACE (job_id, 'ACCOUNT', 'ACCNT')
FROM employees
WHERE job_id LIKE '%ACCOUNT%';

SELECT last_name, LOWER(last_name) "LOWER����",
UPPER(last_name) "UPPER����",
email "�̸���",
INITCAP (email) "INITCAP����"
FROM employees;

SELECT job_id, SUBSTR(job_id,1,2) "����2��"
FROM employees;
