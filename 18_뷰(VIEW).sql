--단순한 view 만들기 EMP_V1
--하나의 원본테이블 사용, 함수나 그룹 사용 안함, DML 사용가능
DROP VIEW EMP_V1; --미리 뷰 삭제 명령

--employees 테이블에서 필요한 열들을 골라서 뷰로 생성
CREATE VIEW EMP_V1
AS
SELECT employee_id, last_name, email, hire_date, job_id
FROM employees;

--테이블처럼 select 문 사용
SELECT * FROM emp_v1;

DESC emp_v1;

--테이블처럼 DML 사용가능(뷰는 가상의 테이블 => 원본 테이블에 입력됨)
INSERT INTO EMP_V1 
    (employee_id, last_name, email, hire_date, job_id)
VALUES (333, 'David', 'DAVID', SYSDATE,'IT_PROG');

--뷰에 입력된 데이터 확인
SELECT * FROM emp_v1;
SELECT * FROM employees;
DESC employees;

--삭제하기
DELETE FROM emp_v1
WHERE employee_id = 333;
commit;

--뷰 테이블 emp_v2 만들기
CREATE VIEW emp_v2
AS
SELECT employee_id 직원번호, last_name 이름, 
       email, hire_date, job_id
FROM employees;

SELECT * FROM emp_v2;

--뷰 테이블 emp_v3 만들기
CREATE VIEW emp_v3 (직원번호, 이름, 이메일, 고용일자, 직종)
AS
SELECT employee_id, last_name, email, hire_date, job_id
FROM employees;

SELECT * FROM emp_v1;
SELECT * FROM emp_v2;
SELECT * FROM emp_v3;
SELECT * FROM employees;

--DML 사용 (emp_v3)
INSERT INTO emp_v3 (직원번호, 이름, 이메일, 고용일자, 직종)
VALUES (334, 'LaLa', 'LaLa', SYSDATE, 'IT_PROG');

--복잡한 뷰 만들기
--그룹함수를 사용한 뷰는 DML 사용 불가
--OR REPLACE를 사용하여 수정이 쉽도록
CREATE OR REPLACE VIEW 부서별_직원_보고서
AS
SELECT department_id 부서번호, count(employee_id) 직원수, 
    MAX(salary) 최고급여, MIN(salary) 최저급여,
    ROUND(AVG(salary)) 평균급여
FROM employees
GROUP BY department_id
ORDER BY 부서번호;

SELECT * FROM 부서별_직원_보고서;
INSERT INTO 부서별_직원_보고서
VALUES (200, 4, 5000, 1000);

--읽기 전용 뷰 (옵션 WITH READ ONLY)
CREATE OR REPLACE VIEW EMP_V_read
AS
SELECT employee_id, last_name, email, 
    hire_date, job_id
FROM employees
WHERE department_id = 90
WITH READ ONLY; --읽기 전용
SELECT * FROM emp_v_read;

--DML 사용 불가
DELETE FROM EMP_V_READ; --모든 행 삭제

--체크 옵션 뷰
CREATE OR REPLACE VIEW emp_v_check
AS 
SELECT employee_id, last_name, email, 
    hire_date, job_id, department_id
FROM employees
WHERE department_id = 90
WITH check option; --where절의 조건에서만 수정 및 입력 가능

SELECT * FROM emp_v_check;

--90번 부서 일때만 DML 가능
INSERT INTO emp_v_check (employee_id, last_name, email, 
    hire_date, job_id, department_id)
VALUES (444, '알리', 'ALI', SYSDATE, 'IT_PROG', 10);
