--DELETE 데이터의 삭제

--71번~75번 부서번호 삭제
DELETE FROM departments
WHERE department_id BETWEEN 71 AND 75;
commit;

--직원테이블 id 1,2 삭제
DELETE FROM employees
WHERE employee_id IN (1,2);
commit;

--데이터 전체를 삭제: rollback 가능 (데이터만 삭제되고 테이블은 남아있음)
DELETE FROM copy_departments;
rollback;

--TRUNCATE TABLE: 전체 삭제인데 rollback이 안됨
TRUNCATE TABLE copy_departments;
rollback;

--DROP TABLE: 테이블 삭제
DROP TABLE copy_departments;
DROP TABLE copy_DEPT;
DROP TABLE XX_EMP;

--세이브 포인트
SELECT * FROM copy_emp
WHERE employee_id=108; -- salary 12008

UPDATE copy_emp
SET salary = salary + 10
WHERE employee_id = 108;
--salary 12018
--세이브 포인트 A만들기
SAVEPOINT A;

UPDATE copy_emp
SET salary = salary + 20
WHERE employee_id = 108;
--salary 12038
--세이브 포인트 A로 롤백
ROLLBACK TO SAVEPOINT A;
--salary 12018
--롤백: COMMIT을 안했기 때문에 최초상태로 돌아감
ROLLBACK;
commit;
