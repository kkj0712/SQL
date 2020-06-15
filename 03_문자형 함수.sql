--문자형 함수는 대소문자 함수와 문자 조작 함수로 나뉜다.
--1.대소문자 조작 함수 (UPPER, LOWER, INITCATP)
SELECT 1+1
FROM DUAL; --DUAL테이블은 연습용 테이블

SELECT LOWER ('SQL COURSE'), UPPER ('sql course'), INITCAP ('SQL COURSE')
FROM DUAL;

--문자함수를 WHERE 절에 사용
SELECT employee_id, first_name
FROM employees
WHERE UPPER (first_name) = 'PATRICK';

--2. 문자 조작 함수
--CONCAT
SELECT first_name, last_name, CONCAT (first_name, last_name) AS 풀네임
FROM employees;

--SUBSRT (열이름, m, n): m은 시작문자, n은 잘라낼 길이
SELECT employee_id, 
first_name, 
SUBSTR (first_name, 1, 3), --첫번째부터 3개의 문자를 잘라낸다.
SUBSTR (first_name, 2, 4), --두번째부터 4개의 문자를 잘라낸다.
SUBSTR (first_name, 2, 3), --두번째부터 3개의 문자를 잘라낸다.
SUBSTR (first_name, -3) --음수: 끝에서부터 카운트. 마지막 3개의 문자를 잘라낸다.
FROM employees;

--LENGTH
SELECT first_name, LENGTH (first_name)
FROM employees;

--INSTR (문자열, 찾을 문자 M,N)
--M은 검사 시작 위치
--N은 찾을 횟수
--디폴트 값은 M,N 각각 1

SELECT first_name,
INSTR (first_name, 'e', 2), --두번째 부터 e를 검색
INSTR (first_name, 'e', 5), --다섯번째 부터 e를 검색
INSTR (first_name, 'e', 1, 2) --첫번째부터 찾는데 2번째 나오는 e의 자릿수
FROM employees
WHERE first_name = 'Nanette';

--lpad/rpad
SELECT employee_id, first_name, salary, 
LPAD (salary, 10, '#'), RPAD (salary, 10, '*')
FROM employees;

--공백을 이용해 문자열을 분리
SELECT
'홍 길동' 성명,
SUBSTR('홍 길동', 1, INSTR('홍 길동', ' ')-1) 성
FROM DUAL; 
--이름의 공백을 가지고 성을 출력. 공백을 가지고 문자를 나눌때 
--INSTR함수로 공백이 몇 번째 있는지 알 수 있다.
--INSTR함수의 리턴값은 2. SUBSTR(이름, 1,1)이 되므로 첫번째 문자만 반환

SELECT
'제갈 길동' 성명,
SUBSTR('제갈 길동', 1, INSTR('제갈 길동', ' ')-1) 성
FROM DUAL; 

SELECT
'제갈 길동' 성명,
SUBSTR('제갈 길동', 1, INSTR('제갈 길동', ' ')-1) 성,
SUBSTR('제갈 길동', INSTR('제갈 길동', ' ')+1) 이름 --이름은 빈칸 자릿수보다 한자리 많음
FROM DUAL; 

SELECT last_name, CONCAT('직업명이 ', job_id) AS 직업명
FROM employees
WHERE SUBSTRB(job_id, 4, 3)='REP';

SELECT employee_id, 
    CONCAT (first_name, last_name) 전체이름,
    last_name,
    LENGTH (last_name) 길이,
    INSTR (last_name, 'a') "'a'가 몇번째?"
FROM employees;

SELECT job_id, REPLACE (job_id, 'ACCOUNT', 'ACCNT')
FROM employees
WHERE job_id LIKE '%ACCOUNT%';

SELECT last_name, LOWER(last_name) "LOWER적용",
UPPER(last_name) "UPPER적용",
email "이메일",
INITCAP (email) "INITCAP적용"
FROM employees;

SELECT job_id, SUBSTR(job_id,1,2) "앞의2개"
FROM employees;
