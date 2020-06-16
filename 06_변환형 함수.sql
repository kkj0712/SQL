--변환형 함수

--TO_CHAR
--숫자를 문자로 변환
--콤마(,)
SELECT TO_CHAR(12345678, '999,999,999') 콤마
FROM DUAL;
--소수점(.)
SELECT TO_CHAR(12345678, '999,999,999.99') 소수점
FROM DUAL;
--$표시
SELECT TO_CHAR(12345678, '$999,999,999.99') 달러표시
FROM DUAL;
--L표시
SELECT TO_CHAR(12345678, 'L999,999,999.99') L표시
FROM DUAL;
--왼쪽에 0을 삽입
SELECT TO_CHAR(123, '09999') 제로표시 --남는 공간을 0으로 채우기
FROM DUAL;

--날짜를 문자로 변환
--년, 월, 일, 시, 분, 초
SELECT TO_CHAR(sysdate, 'YY-MM-DD HH24:MI:SS') 현재날짜시간 
FROM DUAL;

SELECT TO_CHAR(sysdate, 'YYYY/MM/DD HH24:MI:SS') 현재날짜시간 
FROM DUAL;

--365일 중 오늘이 며칠?
SELECT TO_CHAR(sysdate, 'DDD') 날짜
FROM dual;

--오늘의 월?
SELECT TO_CHAR(sysdate, 'MONTH') 몇월
FROM dual;

SELECT employee_id, TO_CHAR(hire_date, 'MM/DD') 
FROM employees
WHERE department_id=100;

SELECT last_name "이름", TO_CHAR(salary, '$999,999,999.99') "월급"
FROM employees
WHERE salary > 10000
ORDER BY salary DESC;

--문자를 날짜로 바꾸는 TO_DATE
SELECT TO_DATE('2011-01-01', 'YYYY-MM-DD')
FROM dual;

--문자를 숫자로 바꾸는 TO_NUMBER
SELECT TO_NUMBER('0123123')+100
FROM dual;