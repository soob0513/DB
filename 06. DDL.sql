-- CHAPTER 06. DDL(DATA DIFINITION LANGUAGE) --

-- DDL 이란?
    --> 데이터 정의어로 테이블 같은 저장소 객체를 만들거나 수정합니다.

-- [DDL 명령어 종류]
  -- CREATE   : 테이블 같은 객체를 생성하는 명령어
  -- ALTER    : 테이블 같은 객체를 변경하는 명령어
  -- RENAME   : 테이블의 이름을 변경하는 명령어
  -- TRUNCATE : 테이블 안의 데이터를 삭제하는 명령어
  -- DROP     : 테이블 같은 객체를 삭제하는 명령어

-- [테이블 생성 시 자주 사용하는 자료형]
  -- VARCHAR2(N) : 가변형 문자형, N 크기만큼 입력 받음
  -- NUMBER(P,S) : 숫자형 자료형, 숫자형 값을 P자리만큼 입력받고, S자리만큼 소수를 입력받음
                --> SQL에서는 실수와 정수 모두 표현이 가능.
                --> ()를 생략 하게 되면 최대값인 38 크기가 들어간다.
  -- DATE : 현재 날짜값을 입력 받음


-- 테이블 생성
    -- CREATE TABLE 테이블 명 (
    --             컬럼명1 자료형(크기),
    --             컬럼명2 자료형(크기),
    --             ... ,
    --             컬럼명 N 자료형(크기)
    --  ) ;
    
-- 수강생정보 테이블을 확인해서 TEST_수강생정보 테이블을 만들어보자
  -- 테이블명 선택 후 SHIFT+F4 누르면 테이블에 대한 정보를 확인 가능
CREATE TABLE TEST_수강생정보 (
    학생ID VARCHAR2(9) PRIMARY KEY,
    학생이름 VARCHAR2(50) NOT NULL,
    소속반 VARCHAR2(5)
    ) ;

SELECT * FROM TEST_수강생정보 ;

-- 성적표 테이블을 확인해서 TEST_성적표 테이블을 생성해보자
-- 제약조건은 쓰지 말기! 컬럼명 + 자료형 입력 하기
CREATE TABLE TEST_성적표 (
        학생ID VARCHAR2(9) PRIMARY KEY,
        과목 VARCHAR2(30),
        성적 NUMBER
        ) ;

-- [테이블 생성 규칙]
  -- 1. 대소문자 구분을 안 한다
  -- 2. 중복되는 테이블명 사용 불가
  -- 3. 테이블 내에서 컬럼명 중복 사용 불가
  -- 4. 문자로 시작해야함, 예약어는 사용 불가 (특수문자는 _, $, #만 사용 가능)

-- 실습) 테이블 이름은 테이블명_LOGIN으로 생성
--      로그인 기능을 하기 위해서 아이디, 비밀번호, 이메일, 이름 정보를 받을 예정
CREATE TABLE INFO_LOGIN(
    ID VARCHAR2(20),
    PW VARCHAR2(20),
    EMAIL VARCHAR2(20),
    NAME VARCHAR2(20)
         );
SELECT * FROM INFO_LOGIN ;



-- 제약 조건이란?
  --> 테이블에 입력 가능한 데이터를 조건으로 제약하는 것
  --> 데이터의 정확성을 유지하기 위한 목적으로 사용됨.
  --> 제약 조건 지정 방식에 따라서 데이터의 수정이나 삭제 여부에 영향을 받음

-- [제약 조건의 종류]
-- PRIMARY KEY (PK) : 기본키. NOT NULL + UNIQUE = NULL불가 + 중복불가
-- UNIQUE KEY (UK) : 고유키. NULL값은 입력 가능하지만 중복은 불가하다.
-- NOT NULL : NULL 값이 불가능, 꼭 입력되어야 하는 데이터일 때 설정
-- CHECK : T OR F 로 평가할 수 있는 논리식을 지정, 지정한 데이터만 입력 가능
-- FOREIGN KEY (FK) : 외래키. 테이블을 연결하는 키



-- [무결성 제약조건 종류]
-- 개체 무결성 : 기본 키 제약이라고 하며, 하나의 테이블에 중복된 행이 존재하지 않도록 규정
-- 참조 무결성 : 행을 입력, 수정, 삭제할 때 연관되는 다른 테이블 간의 데이터가 정확하게 유지되도록 규정,
--              참조 관계에 있는 두 테이블의 데이터가 항상 일관된 값을 가져야 하는 것


-- [이미 생성된 테이블에 제약 조건(CONSTRAINT)을 지정하기]
-- ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건명 제약조건(컬럼);
SELECT * FROM INFO_LOGIN ;

-- 테이블에 PK 제약조건 지정
ALTER TABLE INFO_LOGIN ADD CONSTRAINT ID_PK PRIMARY KEY(ID);

-- 테이블에 UK 제약조건 지정
ALTER TABLE INFO_LOGIN ADD CONSTRAINT EMAIL_UK UNIQUE(EMAIL);

-- 테이블에 CHECK 제약조건 지정
-- 비밀번호를 3자리 이상만 출력될 수 있도록 조건을 지정
ALTER TABLE INFO_LOGIN ADD CONSTRAINT PW_CHECK CHECK(LENGTH(PW) > 3) ;


-- [이미 생성된 테이블에 FK 제약 조건을 지정하기]
-- ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건명 제약조건(컬럼)
--   REFERENCES 참조테이블(참조컬럼명);

-- <테이블에 FK 제약조건 지정>
ALTER TABLE TEST_성적표 ADD CONSTRAINT 학생ID_FK FOREIGN KEY(학생ID)
REFERENCES TEST_수강생정보(학생ID);

-- <제약조건 변경하기>
-- ALTER TABLE 테이블명 MODIFY 컬럼명 바꿀제약조건 ;
ALTER TABLE INFO_LOGIN MODIFY NAME NOT NULL ;

-- <제약조건 삭제하기>
-- ALTER TABLE 테이블명 DROP CONSTRAINT 제약조건이름 ;
ALTER TABLE INFO_LOGIN DROP CONSTRAINT PW_CHECK;


-- 실습) 테이블 생성
CREATE TABLE TB_TEST1(
    PK테스트 NUMBER PRIMARY KEY,
    UK테스트 NUMBER UNIQUE,
    NL테스트 NUMBER NOT NULL,
    CK테스트 NUMBER CHECK(LENGTH(CK테스트)> 5)   
    );

CREATE TABLE TB_TEST2(
    PK테스트 NUMBER,
    UK테스트 NUMBER,
    NL테스트 NUMBER NOT NULL,
    CK테스트 NUMBER ,
    FK테스트 NUMBER,
    -- 제약조건을 추가
    -- CONSTRAINT 제약조건명 제약조건(컬럼)
    CONSTRAINT PK테스트_PK PRIMARY KEY (PK테스트),
    CONSTRAINT UK테스트_UK UNIQUE(UK테스트),
    CONSTRAINT CK테스트_CK CHECK( CK테스트 > 0),
    CONSTRAINT FK테스트_FK FOREIGN KEY(FK테스트) REFERENCES TB_TEST1(PK테스트)   
    );




-- 테이블에 컬럼 추가하기 --> ADD
-- ALTER TABLE 테이블명 ADD 컬럼명 자료형(크기);

ALTER TABLE INFO_LOGIN ADD ADDRESS VARCHAR2(10) ;

SELECT * FROM INFO_LOGIN ;

-- 컬럼명 변경하기 --> RENAME
-- ALTER TABLE 테이블명 RENAME COLUMN 기존컬럼명 TO 바꿀컬럼명 ;
ALTER TABLE INFO_LOGIN RENAME COLUMN ADDRESS TO ADDR ;

SELECT * FROM INFO_LOGIN ;

-- 컬럼의 자료형을 변경하기 --> MODIFY
-- ALTER TABLE 테이블명 MODIFY 컬럼명 바꿀제약조건(길이) ;
ALTER TABLE INFO_LOGIN MODIFY ADDR VARCHAR2(30);


-- 특정 컬럼 삭제하기 --> DROP
-- ALTER TABLE 테이블명 DROP COLUMN 컬럼명 ;
ALTER TABLE INFO_LOGIN DROP COLUMN ADDR ;
SELECT* FROM INFO_LOGIN ;



-- [테이블 삭제] --> DROP
-- DROP TABLE 테이블명;

-- TEST_수강생정보 테이블을 삭제해보자
DROP TABLE TEST_수강생정보 ;
  -- 오류 발생 --> unique/primary keys in table referenced by foreign keys
    --> 성적표 테이블의 학생ID가 참조되고 있어서 삭제 불가능
-- 테이블의 제약 조건도 같이 삭제하는 방법
-- DROP TABLE 테이블명 CASCADE CONSTRAINT ;
DROP TABLE TEST_수강생정보 CASCADE CONSTRAINT ;  -> FK 제약조건도 같이 삭제
--> 제약 조건 지정 방식에 따라 기존 데이터의 수정이나 삭제 여부에 영향을 받는다!




-- [TRUNCATE] : 테이블의 데이터를 영구 삭제
-- TRUNCATE TABLE 테이블명 ;

-- 테이블 복사 하기
CREATE TABLE DROP_성적표 AS SELECT * FROM 성적표;
    --> 성적표 테이블과 동일한 데이터를 가지는 테이블을 복사하는 쿼리문
    --> 제약조건은 복사되지 않는다!
SELECT * FROM DROP_성적표 ;

-- [DELETE] --> ROLLBACK으로 복구 가능
DELETE FROM DROP_성적표 ;

-- ROLLBACK : 이전 상태로 되돌리는 명령어
            --> 복구가 가능하다!
ROLLBACK ;


-- [TRUNCATE] : 영구삭제 --> 복구 불가능!
TRUNCATE TABLE DROP_성적표 ;

ROLLBACK ;


-- [DROP] : 테이블을 영구삭제
DROP TABLE DROP_성적표 ;
SELECT * FROM DROP_성적표 ;  --> 조회 불가



-- 실습2) 테이블 생성
-- 1. 테이블 이름은 테이블명_JOIN 으로 생성
-- 2. 회원가입 기능을 하기 위해서 아이디, 비밀번호, 이름, 가입날짜, 나이, 전화번호, 이메일 정보를 받을 예정입니다.
-- 3. 컬럼명, 자료명, 제약조건 작성

 CREATE TABLE LOGIN_JOIN (
    ID VARCHAR2(20) PRIMARY KEY,
    PW VARCHAR2(20) NOT NULL,
    NAME VARCHAR2(10) NOT NULL,
    JOIN_DATE DATE,
    AGE NUMBER(3),
    TEL VARCHAR2(20),
    EMAIL VARCHAR2(50) UNIQUE
    );
SELECT * FROM LOGIN_JOIN;

CREATE TABLE SMHRD_JOIN (
    ID VARCHAR2(20),
    PW VARCHAR2(20) ,
    NAME VARCHAR2(10),
    JOIN_DATE DATE,
    AGE NUMBER(3),
    TEL VARCHAR2(20),
    EMAIL VARCHAR2(50),
    
    CONSTRAINT ID_PK PRIMARY KEY (ID),
    CONSTRAINT PW_NL NOT NULL (PW),
    CONSTRAINT NAME_NL NOT NULL (NAME),
    CONSTRAINT EMAIL_UK UNIQUE(EMAIL)
    );



