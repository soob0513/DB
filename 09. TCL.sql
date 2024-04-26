-- CHAPTER 09. TCL (트랜잭션 제어어) --

-- [트랜잭션(Transaction) 이란?]
  --> 데이터베이스의 상태를 변화시키기 위해서 수행하는 최소 수행 단위
  --> 즉, 업무를 처리하기 위한 최소 수행단위.

-- [트랜잭션의 4가지 특성] - ACID
  -- 원자성(Atomicity) : ALL OR NOTHING. 모두 실행이 되거나 전혀 실행이 되지 않거나
  -- 일관성(Consistency) : 언제나 일관성 있는 상태를 유지하는 것
  -- 고립성(Isolation) : 트랜잭션 실행 시 다른 트랜잭션이 영향을 받지 않는 것
  -- 지속성 (Durability) : 성공적으로 수행된 트랜잭션은 영원히 반영되는 것

-- [TCL의 명령어]
  -- COMMIT : DB에 영구적으로 저장. 마지막 COMMIT 시점 이후의 트랜잭션 결과를 저장
  -- ROLLBACK : 트랜잭션을 취소. 되돌리는 명령어. 마지막 COMMIT 시점가지만 복구가 가능
  -- SAVEPOINT : 하나의 트랜잭션을 작게 분할하여 저장하는 기능을 수행하는 명령어



-- 테이블 복사
CREATE TABLE TCL_수강생정보 AS SELECT * FROM 수강생정보 ;

SELECT * FROM TCL_수강생정보 ;


-- TCL_수강생정보 테이블에 나의 정보를 넣기 (SMHRD10, 이름, D반)
INSERT INTO TCL_수강생정보
VALUES ('SMHRD10', '최수빈', 'D');

SELECT * FROM TCL_수강생정보 ;

ROLLBACK ;

COMMIT ;   --> 영구 저장 됨 => ROLLBACK을 해도 되돌려지지 않는다!

ROLLBACK ;




-- [세션(Session)이란?]
  -- 데이터베이스 접속을 시작으로 여러 데이터베이스에서 관련된 작업을 수행한 후
  -- 접속을 종료하기 까지의 전체기간을 의미
  --> 즉, 세선이 여러 개라는 말은 오라클 DB에 접속하여 사용중인 연결이 여러 개 있다라는 뜻

-- 세션 A : sql developer
-- 세션 B : run sql command line

SELECT * FROM TCL_수강생정보 ;

DELETE FROM TCL_수강생정보 
WHERE 학생이름 = '최수빈' ;

COMMIT ;





-- [읽기 일관성]
  -- 세션 A에서 DELETE를 하고 COMMIT을 하지 않은 상태로 
  -- 세션 B에서 조회를 하게 되면 변환값이 적용되지 않는다.
  -- 왜냐하면, 세션 A에서는 COMMIT(영구저장)을 하지 않았기 때문이다.
  -- 그래서 다른 세션에서는 보이지 않는다 => '읽기 일관성을 보장한다' 라고 한다.




-- [LOCK] : 세션 A와 세션 B 같이 접속하면 스크립트 출력 실행 중이라고 뜨고 출력 안 됨
            --> 세션 B에서 COMMIT; 라고 입력하면 실행됨
UPDATE TCL_수강생정보
SET 학생이름 = 'NAME_CSB'
WHERE 학생ID = 'SMHRD1' ;


