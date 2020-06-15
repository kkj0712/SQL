--1.테이블의 모든 데이터 가져오기
SELECT * FROM employees;
--2.WHERE 절에 가져올 조건에 맞는 행을 선택한다.
--  위치는 FROM절 다음에 위치
SELECT * 
FROM employees
WHERE department_id=90; --90번 부서만

SELECT * 
FROM employees
WHERE salary=24000; --월급이 24000인 직원

/*
WHERE절 사용시 주의점
문자(String)과 날짜(Date) 값은 항상 작은따옴표(')로 표시
문자값은 대소문자를 구분한다. (Case-Sensitive)
날짜값은 날짜포맷에 벗어나지 않도록 (Format-Sensitive)
오라클의 날짜포맷은 RR/MM/DD (RR은 2자리 년도)
*/
--3.WHERE+문자열
SELECT employee_id, first_name, last_name, job_id
FROM employees
WHERE first_name='Steven';
--4.WHERE+날짜
SELECT SYSDATE FROM DUAL; 
--dual은 샘플테이블, SYSDATE 는 현재 날짜 시간


--5.비교연산자
--날짜비교
SELECT *
FROM employees
WHERE hire_date>='03/06/32'; --년도/월/날짜
--숫자비교
SELECT *
FROM employees
WHERE salary>=10000;
--문자비교 (알파벳순)
SELECT *
FROM employees
WHERE first_name>'King';

SELECT *
FROM employees
WHERE employee_id=100;

SELECT *
FROM employees
WHERE first_name='David';

SELECT *
FROM employees
WHERE employee_id<=105;

SELECT *
FROM job_history
WHERE start_date>'06/3/3';

SELECT *
FROM departments
WHERE location_id<>1700; --!=1700

--6.AND OR
SELECT *
FROM employees
WHERE department_id=60 OR
(department_id=80 AND salary > 10000);

SELECT *
FROM employees
WHERE (department_id=60 OR
department_id=80) AND salary > 10000;

SELECT *
FROM employees
WHERE hire_date > '08/04/04' OR salary > 13000
AND job_id = 'AD_VP';

SELECT *
FROM employees
WHERE NOT(hire_date > '04/01/01' OR salary > 5000);
--(hire_date<='04/01/01' AND salary <=5000)

SELECT *
FROM employees
WHERE salary > 4000 AND job_id='IT_PROG';

SELECT *
FROM employees
WHERE salary > 4000 AND (job_id='IT_PROG' OR job_id='FI_ACCOUNT');

--IN
SELECT *
FROM employees
WHERE salary = 4000 
OR salary = 3000 OR salary = 2700;

SELECT *
FROM employees
WHERE salary IN (4000, 3000, 2700);

SELECT *
FROM employees
WHERE salary IN (10000, 17000, 24000);

SELECT *
FROM employees
WHERE department_id NOT IN (30, 50, 80, 100, 110);

--BETWEEN
SELECT *
FROM employees
WHERE salary >= 9000 AND salary <=10000;

SELECT *
FROM employees
WHERE salary BETWEEN 9000 AND 10000;

SELECT *
FROM employees
WHERE salary BETWEEN 10000 AND 20000;

SELECT *
FROM employees
WHERE hire_date BETWEEN '04/01/01' AND '04/12/30';

SELECT *
FROM employees
WHERE salary NOT BETWEEN 7000 AND 17000;

/*
LIKE 연산자 (%, _)
*/

SELECT *
FROM employees
WHERE last_name LIKE 'B%';

SELECT *
FROM employees
WHERE last_name LIKE '%B%';

SELECT *
FROM employees
WHERE first_name LIKE '_d%';

SELECT *
FROM employees
WHERE first_name LIKE '__s%';

--예제
SELECT *
FROM employees
WHERE job_id LIKE '%AD%';

SELECT *
FROM employees
WHERE job_id LIKE '%AD___';

SELECT *
FROM employees 
WHERE phone_number LIKE '%1234';

SELECT *
FROM employees
WHERE phone_number NOT LIKE '%3%' AND phone_number LIKE '%9';

SELECT *
FROM employees
WHERE job_id LIKE '%MGR%' OR job_id LIKE '%ASST%';

/*
IS NULL/ IS NOT NULL
*/

SELECT *
FROM employees
WHERE commission_pct IS NULL;

SELECT *
FROM employees
WHERE commission_pct IS NOT NULL;

SELECT *
FROM employees
WHERE manager_id IS NULL;

--ORDER BY
SELECT *
FROM employees
ORDER BY last_name DESC;

SELECT *
FROM employees
ORDER BY salary;

--멀티 정렬
SELECT department_id, employee_id, first_name, last_name
FROM employees
ORDER BY department_id, employee_id DESC;
--(부서 번호로 오름차순 정렬 후 중복일 경우 사원번호로 내림차순 정렬)

--열을 생성하여 정렬
SELECT employee_id, last_name, salary*12 AS "연봉"
FROM employees
ORDER BY "연봉" DESC;

SELECT department_id, employee_id, last_name, salary*12 AS "연봉"
FROM employees
WHERE department_id=90
ORDER BY "연봉" DESC;

SELECT department_id, last_name, salary*12 AS "연봉"
FROM employees
ORDER BY 3 DESC;

--예제
SELECT employee_id, first_name, last_name
FROM employees
ORDER BY employee_id DESC;

SELECT *
FROM employees
WHERE job_id LIKE '%CLERK%'
ORDER BY salary DESC;

SELECT *
FROM employees
WHERE employee_id BETWEEN 120 AND 150
ORDER BY department_id DESC, salary DESC;