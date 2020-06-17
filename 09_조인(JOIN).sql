-- 조인
SELECT e.employee_id, e.department_id, d.department_name
FROM employees  e
JOIN departments d
ON e.department_id = d.department_id;

--내츄럴 조인: ON 절 생략
SELECT employee_id, first_name,
       job_id, job_title
FROM employees
NATURAL JOIN jobs;

--기본 동등조인
SELECT e.employee_id, j.job_id, j.job_title
FROM employees e
JOIN jobs j
    ON e.job_id = j.job_id;

--WHERE 절 추가 
SELECT e.employee_id, e.department_id, d.department_name
FROM employees  e
JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_id = 50;

--3개 테이블 조인
SELECT e.employee_id, d.department_name, lo.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations lo ON d.location_id = lo.location_id;

--예제
SELECT d.department_name 부서명, lo.city 도시명,
co.country_name 국가명
FROM departments d
JOIN locations lo ON d.location_id = lo.location_id
JOIN countries co ON co.country_id = lo.country_id
WHERE lo.city IN ('Seattle', 'London') 
AND co.country_name LIKE 'United%';

--자체 조인
SELECT e.last_name 직원, e.employee_id 직원번호1,
m.last_name 매니저, e.employee_id 직원번호2
FROM employees e
JOIN employees m
    ON e.manager_id = m.employee_id;