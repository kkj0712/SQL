--인덱스 확인하기
SELECT 
    TABLE_NAME 테이블명,
    INDEX_NAME 인덱스이름,
    COLUMN_NAME 컬럼이름
FROM ALL_IND_COLUMNS --오라클에서 자동 생성됨
WHERE TABLE_NAME = 'DEPARTMENTS'; --테이블 이름을 대문자로

DROP TABLE members;

--실습으로 테이블 만들기
CREATE TABLE members (
    member_id NUMBER,
    first_name VARCHAR2(100) NOT NULL,
    last_name VARCHAR2(100) NOT NULL,
    gender CHAR(1) NOT NULL,
    dob DATE NOT NULL,
    email VARCHAR2(255) NOT NULL,
    PRIMARY KEY (member_id)
);
DESC members;

--인덱스 확인하기
SELECT 
    TABLE_NAME 테이블명,
    INDEX_NAME 인덱스이름,
    COLUMN_NAME 컬럼이름
FROM ALL_IND_COLUMNS --오라클에서 자동 생성됨
WHERE TABLE_NAME = 'MEMBERS'; --테이블 이름을 대문자로

SELECT * FROM MEMBERS
WHERE last_name='Harse'; --테이블 전체 검색 (last_name은 인덱스키가 아님)

EXPLAIN PLAN FOR --다음 나오는 select문을 실행하여 보고서 작성
SELECT * FROM members
WHERE last_name = 'Harse';

SELECT PLAN_TABLE_OUTPUT --설명문을 출력
FROM TABLE (DBMS_XPLAN.DISPLAY());

--인덱스 만들기
CREATE INDEX members_last_name_i
ON members (last_name);

--인덱스 삭제하기
DROP INDEX members_last_name_i;

SELECT * 
FROM members
WHERE first_name LIKE 'M%' AND last_name LIKE 'A%';

--멀티 인덱스 만들기
CREATE INDEX name_i
ON members(first_name, last_name);
--성능평가
EXPLAIN PLAN FOR 
SELECT * FROM members
WHERE first_name LIKE 'M%' AND last_name LIKE 'A%';

SELECT PLAN_TABLE_OUTPUT --설명문을 출력
FROM TABLE (DBMS_XPLAN.DISPLAY());

--인덱스 삭제하기
DROP INDEX name_i;