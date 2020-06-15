--��¥�� �Լ�
SELECT first_name, hire_date --��¥���� ������
FROM employees;

--sysdate ���� ��¥�� �ð�
SELECT SYSDATE
FROM DUAL;

--��¥+����=>��¥
SELECT SYSDATE, SYSDATE+3, SYSDATE-3
FROM DUAL;

--��¥-��¥: �� �ϼ�
SELECT employee_id, SYSDATE, hire_date,
SYSDATE - hire_date, ROUND (SYSDATE-hire_date)
FROM employees;

--�ð� ���
SELECT sysdate + 5/24 --�ð� 1(�Ϸ�) 24�ð� �� 5�ð�
FROM DUAL;

--month_between: ���� ���
SELECT employee_id, first_name,
    ROUND(MONTHS_BETWEEN(sysdate,hire_date)),
    (sysdate-hire_date)/30
FROM employees;

--add_months: ���� ����
SELECT employee_id, first_name, hire_date,
ADD_MONTHS(hire_date,4) --4�� ���ϱ�
FROM employees;

--next day(��¥, ������ ���� ����)
SELECT sysdate, next_day(sysdate, '������')
FROM DUAL;  

--next day(��¥, ������ ���� ����)
SELECT sysdate, next_day(sysdate, 'ȭ����')
FROM DUAL;  

--last_day(��¥, �� ���� ������ ��)
SELECT LAST_DAY(SYSDATE)
FROM DUAL;

--��¥�� �ݿø�
SELECT employee_id, hire_date,
ROUND(hire_date, 'MONTH') ��, --������ �ݿø� 1��
ROUND(hire_date, 'YEAR') �� --������ �ݿø� 1�� 1��
FROM employees
WHERE MONTHS_BETWEEN (sysdate, hire_date) < 150;

SELECT sysdate, hire_date, MONTHS_BETWEEN(SYSDATE,hire_date)
FROM employees
WHERE department_id = 100;

SELECT hire_date, ADD_MONTHS(hire_date,3) "���ϱ�_3����",
ADD_MONTHS(hire_date,-3) "����_3����"
FROM employees
WHERE employee_id BETWEEN 100 AND 106;