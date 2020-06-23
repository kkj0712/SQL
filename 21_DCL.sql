--DCL: DATA CONTROL LANGUAGE
--�������� �������� ���� 
--GRANT: Ư�� ����ڿ��� ���� ������ �ο�
--REVOKE: Ư�� ����ڿ��� ���� ������ ȸ�� �� ��Ż

--�� ���� �����
CREATE USER John Identified by 1234; --������ ���� ����� ��й�ȣ 1234
--���� ���� �ֱ�
GRANT CREATE SESSION TO John; --John �������� ���� ���� �ֱ�
--���̺� ���� ���� �ο�
GRANT CREATE TABLE TO John;
--���̺� �����̽� (���̺��� ������ �� �ִ� ����)
CREATE TABLESPACE johnSpace
DATAFILE 'C:\oraclexe\app\oracle\oradata\XE\john.dbf' SIZE 10M
AUTOEXTEND ON NEXT 5M;
--johnSpace��� ���̺� ������� ���� (���̺� �����̽�)
--������ ��� ����, ���ʻ������ 10mbyte
--�ڵ����� ���̺������� �����ϸ� 5mbyte�� �߰���

--�������� �� ���̺������̽��� ����� �� �ֵ���
ALTER USER John DEFAULT TABLESPACE johnSpace;
--����Ʈ �������̽���
ALTER USER John QUOTA UNLIMITED ON johnSpace;
--���̺� �����̽� ������

--��(ROLE) �ο�
GRANT CONNECT, RESOURCE to John;
--Connect ���� ���Ӱ��� ���ѵ��� ����
--Resource ���� ������ü��(���̺�, ���)�� ������ ��� ���� 

--������ ���� �� ȸ�� REVOKE + ���� + FROM + ����
REVOKE CREATE TABLE FROM John;

--���� ���� �� ȸ��
REVOKE RESOURCE FROM John;

--John ������ ����
DROP USER John CASCADE;

--���̺������̽� ����
DROP TABLESPACE johnSpace;

--���� �����Ǿ� �ִ� ���� Ȯ��
SELECT * FROM ALL_USERS;
SELECT * FROM DBA_USERS;

--����ڿ� �ο��� �ý��� ���� Ȯ��
SELECT * FROM DBA_SYS_PRIVS
WHERE GRANTEE='SCOTT';