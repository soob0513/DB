-- CHAPTER 07. DML (DATA MANIPULATION LANGUAGE) --

-- DML 이란?
-- 데이터 조작어로 테이블의 데이터를 조회, 추가, 수정, 삭제할 때 사용하는 질의어이다.
  --> 테이블에서 원하는 데이터를 입력, 수정, 삭제한다.

-- DML 유형 --> 세인업데
-- SELECT : 데이터 조회
-- INSERT : 데이터 추가
-- UPDATE : 데이터 수정
-- DELETE : 데이터 삭제

-- 사용방법 1)
-- INSERT INTO 테이블명(컬럼1, 2, ...)
-- VALUES (값...);
    --> INSERT에 입력한 컬럼과 VALUES에 입력한 값은 순서와 자료형이 같아야 함

-- 사용방법 2)
-- INSERT INTO 테이블명
-- VALUES (값...);
    --> INSERT에 컬럼 리스트 생략 시 VALUES에 입력한 값은 테이블의 컬럼 수, 순서와 자료형이 같아야 함


-- 1. 나의 정보를 넣기
INSERT INTO LOGIN_JOIN (ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
VALUES ('SMHRD01', '12345', '최수빈', SYSDATE, 26, '01096548342', 'SOOB0513@GMAIL.COM');

SELECT * FROM LOGIN_JOIN ;

-- 2. 친구의 정보를 넣기 (전화번호와 이메일 정보를 NULL값으로 입력)
        --명시적으로 NULL을 넣는다
            --> NULL이라고 직접 입력
            --> '' 라고 입력
INSERT INTO LOGIN_JOIN (ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
VALUES ('SMHRD02', '11111', '최혜빈', SYSDATE, 24, NULL, '');

SELECT * FROM LOGIN_JOIN ;

-- 3. 친구의 정보를 넣기 (전화번호와 이메일 정보를 NILL값으로 입력)
        --암시적으로 NULL값을 넣는다
            --> 컬럼명, 값을 전부 적지 않음
INSERT INTO LOGIN_JOIN (ID, PW, NAME, JOIN_DATE, AGE)
VALUES ('SMHRD03', '22222', '이은우', SYSDATE, 26) ;




-----------------------------------------------------------------------------------------------
-- [테이블 생성시 에러 리스트]

-- 1. 컬럼리스트와 입력 값의 개수가 다른 경우
INSERT INTO SMHRD_JOIN (ID, PW, NAME, JOINDATE, AGE, TEL, EMAIL)
 VALUES ('호두아빠', '33333', '박병관' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM', 'N');
 
--  SQL 오류: ORA-00913: too many values 
--> 컬럼 리스트의 갯수와 입력 값 개수는 일치해야 한다!

-- 2. 식별자에 NULL을 입력한 경우
INSERT INTO SMHRD_JOIN (ID, PW, NAME, JOINDATE, AGE, TEL, EMAIL)
 VALUES (NULL, '33333', '박병관' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01400: cannot insert NULL into ("HR"."SMHRD_JOIN"."ID")
--> 컬럼에 대한 제약조건에 맞게 작성 해야함 (식별자는 NOT NULL + UNIQUE 중복불가)

-- 3. NOT NULL인 컬럼에 NULL을 넣은 경우
INSERT INTO SMHRD_JOIN (ID, PW, NAME, JOINDATE, AGE, TEL, EMAIL)
 VALUES ('호두아빠', '33333', NULL , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01400: cannot insert NULL into ("HR"."SMHRD_JOIN"."NAME")
--> 컬럼에 대한 제약조건에 맞게 작성 해야함 ( NOT NULL 조건 )

-- 4. 자료형에 맞지 않게 입력 값을 넣은 경우
INSERT INTO SMHRD_JOIN (ID, PW, NAME, JOINDATE, AGE, TEL, EMAIL)
 VALUES ('호두아빠', '33333', '박병관' , SYSDATE, '29살', '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01722: invalid number
--> 컬럼에 대한 자료형에 맞게 작성이 되야 한다. (AGE는 숫자형 자료형)

-- 5. 식별자 컬럼에 중복 값을 넣으려는 경우
INSERT INTO SMHRD_JOIN (ID, PW, NAME, JOINDATE, AGE, TEL, EMAIL)
 VALUES ('호두아빠', '33333', '박병관' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');
 
-- unique constraint (HR.SYS_C007110) violated
--> 값이 들어간 상태에서 한번더 실행이 되면 식별자가 값이 중복이 되서 에러가 남

------------------------------------------------------------------------------------------------


-- 컬럼리스트를 쓰지 않고 INSERT 하는 방법
INSERT INTO LOGIN_JOIN
VALUES ('SMHRD04', '33333', '김수현', SYSDATE, 25, '01033333333', 'SALLY@NAVER.COM');

SELECT * FROM LOGIN_JOIN ;


-- INSERT 실습 -- SONGLIST 테이블 만들기
CREATE TABLE DREAM_SONGLIST (
    NUM NUMBER(3) PRIMARY KEY,
    TITLE VARCHAR2(20) NOT NULL,
    SINGER VARCHAR2(20),
    GENDER VARCHAR2(10) CHECK((GENDER ='남자') OR (GENDER = '여자'))
    );

INSERT INTO DREAM_SONGLIST (NUM, TITLE, SINGER, GENDER)
VALUES ('01', 'DEJA VU', 'DREAMCATCHER', '여자');

INSERT INTO DREAM_SONGLIST
VALUES ('02', 'RUN FOR ROSES', 'NMIXX', '여자');

INSERT INTO DREAM_SONGLIST
VALUES ('03', 'MARCH', 'SEVENTEEN', '남자');





-- UPDATE : 테이블의 데이터를 변경하고 싶을 때 사용
-- UPDATE 테이블명 
-- SET 변경할컬럼 = 데이터, ...
-- WHERE 데이터는 변경할 대상 행을 선별하기 위한 조건 ;
    --> ** WHERE 조건절을 생략할 경우 테이블 내 저장된 모든 컬럼의 데이터가 변경이 된다.
    
SELECT * FROM LOGIN_JOIN ;

UPDATE LOGIN_JOIN
SET AGE = 27
WHERE NAME = '이은우' ;

-- 실습) 이메일 정보가 없는 친구 칸에 정보 채워 넣기
UPDATE LOGIN_JOIN
SET EMAIL = 'HYEBIN@NAVER.COM', TEL = '01055555555'
WHERE NAME = '최혜빈' ;

-- 조건은 PK로 설정해주는 것이 가장 올바른 방법이다!



-- DELETE : 데이터를 삭제할 때 사용하는 명령어
-- DELETE FROM 테이블명 ;
-- WHERE 삭제할 대상 행을 선별하기 위한 조건식 ;
    --> ** WHERE 조건절을 생략할 경우 테이블의 모든 데이터가 삭제된다!

-- 25살 이하인 회원들의 정보를 삭제
DELETE FROM LOGIN_JOIN 
WHERE AGE <= 24 ;

SELECT * FROM LOGIN_JOIN ;


