--UPDATE: 데이터 수정하기

--업데이트 사용시 where 절에 항상 기본키를 활용한다.
CREATE TABLE copy_emp
AS
SELECT * FROM employees;

UPDATE copy_emp
SET salary = 24100
WHERE employee_id = 100;
COMMIT;

--의도치 않게 이름이 같은 사람들이 업데이트됨
--Steven이 두명이므로 기본키로 조건을 거는게 좋다
UPDATE copy_emp
SET salary = 24100
WHERE first_name = 'Steven'; 
COMMIT;

--Where 절을 안썼을때: 전부 업데이트 됨
UPDATE copy_emp
SET phone_number = '123-456-789';
ROLLBACK;

--예제1
DESC copy_departments;
INSERT INTO copy_departments (department_name)
VALUES ('Music');

UPDATE copy_departments
SET manager_id=100, location_id=1800
WHERE department_name = 'Music';

UPDATE copy_departments
SET manager_id=100, location_id=1800
WHERE department_name='개발부 4';

UPDATE copy_departments
SET manager_id=100, location_id=1800
WHERE department_name='개발부 5';

--예제2
UPDATE copy_departments
SET manager_id=100
WHERE department_id BETWEEN 150 AND 200;