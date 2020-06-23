SELECT * FROM EMP WHERE EMPNO=7369;

DROP TABLE NAMECARD;

CREATE TABLE NAMECARD(
    NO      NUMBER CONSTRAINT PK_NAMECARD PRIMARY KEY,
    NAME    VARCHAR2(20) NOT NULL,
    MOBILE  VARCHAR2(20) NOT NULL,
    EMAIL   VARCHAR2(40),
    COMPANY VARCHAR2(60)
);

DROP SEQUENCE CARD_NO;

CREATE SEQUENCE CARD_NO
INCREMENT BY 1
START WITH 1;

INSERT INTO NAMECARD VALUES (
    CARD_NO.NEXTVAL,
    'LALA',
    '010-1234-5678',
    'LALA@naver.com',
    'Naver Com'
);

SELECT * FROM NAMECARD;

SELECT * FROM NAMECARD 
ORDER BY NO;
commit;

UPDATE NAMECARD SET company = ? WHERE NO = ?