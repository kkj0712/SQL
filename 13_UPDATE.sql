--UPDATE: ������ �����ϱ�

--������Ʈ ���� where ���� �׻� �⺻Ű�� Ȱ���Ѵ�.
CREATE TABLE copy_emp
AS
SELECT * FROM employees;

UPDATE copy_emp
SET salary = 24100
WHERE employee_id = 100;
COMMIT;

--�ǵ�ġ �ʰ� �̸��� ���� ������� ������Ʈ��
--Steven�� �θ��̹Ƿ� �⺻Ű�� ������ �Ŵ°� ����
UPDATE copy_emp
SET salary = 24100
WHERE first_name = 'Steven'; 
COMMIT;

--Where ���� �Ƚ�����: ���� ������Ʈ ��
UPDATE copy_emp
SET phone_number = '123-456-789';
ROLLBACK;

--����1
DESC copy_departments;
INSERT INTO copy_departments (department_name)
VALUES ('Music');

UPDATE copy_departments
SET manager_id=100, location_id=1800
WHERE department_name = 'Music';

UPDATE copy_departments
SET manager_id=100, location_id=1800
WHERE department_name='���ߺ� 4';

UPDATE copy_departments
SET manager_id=100, location_id=1800
WHERE department_name='���ߺ� 5';

--����2
UPDATE copy_departments
SET manager_id=100
WHERE department_id BETWEEN 150 AND 200;