--��ȯ�� �Լ�

--TO_CHAR
--���ڸ� ���ڷ� ��ȯ
--�޸�(,)
SELECT TO_CHAR(12345678, '999,999,999') �޸�
FROM DUAL;
--�Ҽ���(.)
SELECT TO_CHAR(12345678, '999,999,999.99') �Ҽ���
FROM DUAL;
--$ǥ��
SELECT TO_CHAR(12345678, '$999,999,999.99') �޷�ǥ��
FROM DUAL;
--Lǥ��
SELECT TO_CHAR(12345678, 'L999,999,999.99') Lǥ��
FROM DUAL;
--���ʿ� 0�� ����
SELECT TO_CHAR(123, '09999') ����ǥ�� --���� ������ 0���� ä���
FROM DUAL;

--��¥�� ���ڷ� ��ȯ
--��, ��, ��, ��, ��, ��
SELECT TO_CHAR(sysdate, 'YY-MM-DD HH24:MI:SS') ���糯¥�ð� 
FROM DUAL;

SELECT TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS') ���糯¥�ð� 
FROM DUAL;

--365�� �� ������ ��ĥ?
SELECT TO_CHAR(sysdate, 'DDD') ��¥
FROM dual;

--������ ��?
SELECT TO_CHAR(sysdate, 'MONTH') ���
FROM dual;

SELECT employee_id, TO_CHAR(hire_date, 'MM/DD') 
FROM employees
WHERE department_id=100;

SELECT last_name "�̸�", TO_CHAR(salary, '$999,999,999.99') "����"
FROM employees
WHERE salary > 10000
ORDER BY salary DESC;

--���ڸ� ��¥�� �ٲٴ� TO_DATE
SELECT TO_DATE('2011-01-01', 'YYYY-MM-DD')
FROM dual;

--���ڸ� ���ڷ� �ٲٴ� TO_NUMBER
SELECT TO_NUMBER('0123123')+100
FROM dual;