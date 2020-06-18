--서브쿼리

--예제 1Abel 직원보다 급여를 더 많이 받는 직원들은?
--Abel의 급여 확인
SELECT salary
FROM employees
WHERE last_name = 'Abel';

--서브쿼리를 사용
--단일행 연산자(=,>,<,<=,>=,<>,!=)
SELECT employee_id, last_name, salary
FROM employees
WHERE salary > (SELECT salary
                FROM employees
                WHERE last_name = 'Abel');
--에러가 나는 경우
SELECT employee_id, last_name, salary
FROM employees
WHERE salary > (SELECT salary
                FROM employees
                WHERE department_id=30);

--그룹함수를 서브쿼리로 이용
--그룹함수 예로 MAX는 가장 높은 급여를 받는 사람을 알 수 없음
SELECT *
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

--예제2
SELECT employee_id 직원번호, last_name 이름,
    department_id 부서번호, salary 급여
FROM employees
WHERE salary > (SELECT salary FROM employees
          WHERE last_name = 'Bull')
AND   department_id = (SELECT department_id FROM employees
          WHERE last_name = 'Bull');

--예제3 
SELECT last_name, salary, manager_id
FROM employees
WHERE manager_id = (SELECT employee_id FROM employees
                    WHERE last_name = 'Russell');

--예제4
SELECT *
FROM employees
WHERE job_id = (SELECT job_id FROM jobs
                WHERE job_title='Stock Manager');
                
--다중행 서브쿼리
--연산자(in, any, all)
SELECT salary FROM employees WHERE department_id = 90;

--IN: 결과값과 같은데 OR로 연결되었다 생각
SELECT employee_id, first_name, last_name, salary 
FROM employees
WHERE salary IN (SELECT salary 
                 FROM employees 
                 WHERE department_id = 90);
                 
--ANY: 하나의 조건만 만족해도 됨 (앞에 연산자가 꼭 붙어야함)
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary >=ANY (SELECT salary 
                    FROM employees 
                    WHERE department_id = 90);
                    
--ALL: 모든 조건을 만족해야 함
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary >=ALL (SELECT salary 
                    FROM employees 
                    WHERE department_id = 90);
                    
--예제1
SELECT employee_id, first_name, job_id 직종, salary 급여
FROM employees
WHERE manager_id IN (SELECT manager_id
                FROM employees
                WHERE department_id=20)
      AND department_id !=20;

--예제2
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ANY (SELECT salary
                    FROM employees
                    WHERE job_id='ST_MAN');
                    
--예제3
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ALL (SELECT salary
                    FROM employees
                    WHERE job_id='IT_PROG');
                    
--다중열 서브쿼리
SELECT employee_id, first_name, job_id, salary, manager_id
FROM employees
WHERE (manager_id, job_id) IN (SELECT manager_id, job_id
                               FROM employees
                               WHERE first_name='Bruce')
    AND first_name <> 'Bruce';
    
--부서별로 최소 급여를 받는 사원의 부서번호, 사원번호, 이름 급여 정보 검색
SELECT department_id 부서번호, employee_id 사원번호,
       last_name 이름, salary 급여
FROM employees
WHERE (department_id, salary) IN
       (SELECT department_id, MIN(salary)
        FROM employees
        GROUP BY department_id)
ORDER BY department_id;

--예제
SELECT first_name, job_id, salary, department_id
FROM employees
WHERE (job_id, salary) IN
        (SELECT job_id, MIN(salary)
        FROM employees
        GROUP BY job_id)
ORDER BY salary DESC;