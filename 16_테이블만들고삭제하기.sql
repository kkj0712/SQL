--���̺� �����
CREATE TABLE ex_date( --���̺� �̸�
        ex_id       NUMBER(2), --���� �̸�, ������ Ÿ��
        start_date  DATE DEFAULT sysdate);
--����Ʈ�� �Է� �ȵɽ� ����Ʈ ���� ������

INSERT INTO ex_date(ex_id)
VALUES (1);
INSERT INTO ex_date(ex_id)
VALUES (2);
INSERT INTO ex_date(ex_id)
VALUES (3);
commit;
SELECT * FROM ex_date;
DESC ex_date;

--���̺� �����ϱ�
DROP TABLE comp;
DROP TABLE copy_emp;

--����
CREATE TABLE sample_product (
     product_id NUMBER (10),
     product_name VARCHAR2 (20),
     menu_date DATE DEFAULT sysdate);
    
SELECT * FROM sample_product;
 
DROP TABLE sample_product;
DESC sample_product;