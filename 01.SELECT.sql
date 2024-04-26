-- CHAPTER 01. SELECT -- 

-- 주석 기호

-- 글자 크기 변경 : 도구 > 환경설정 > 코드편집기 > 글꼴
-- 주석 색깔 변경 : 도구 > 환경설정 > 코드편집기 > PL/SQL 주석

-- 주석 형태(2가지) : /**/   --> 여러 줄을 한번에 주석처리할 때 사용
/*
1. SQL 문장은 대소문자를 구분하지 않는다!
2. 띄어쓰기나 줄바꿈 또한 명령어 수행에 영향을 주지 않는다.
3. SQL 문장 끝에는 반드시 세미콜론(;)을 찍어줘야 한다!!!
4. SQL 실행 단축키 : Ctrl + Enter, F9
*/

DESC EMPLOYEES ;
-- DESC(DESCRIBE) : SQL에서 사용되는 테이블의 구조를 확인할 때 사용하는 명령어


SELECT FIRST_NAME, LAST_NAME
  FROM EMPLOYEES ;

SELECT COUNTRY_NAME, REGION_ID  FROM COUNTRIES ;

-- [SELECT절 기본 사용 방법]
-- 2. SELECT 조회할 컬럼명1, ....
-- 1. FROM 조회할 테이블명


-- 전체 데이터를 조회하는 방법
-- * (아스타리스크) --> 전체를 의미

-- 직원 테이블의 전체 정보를 출력
SELECT *
  FROM EMPLOYEES ;
  
-- 실습1) 부서테이블의 전체 정보를 출력
SELECT *
  FROM DEPARTMENTS ;
  
-- 실습2) 직원 테이블에서 직원ID, FIRST_NAME, EMAIL 정보를 출력
SELECT * FROM EMPLOYEES ;  --> 직원테이블에 있는 모든 정보 조회 -- 쿼리문
SELECT EMPLOYEE_ID , FIRST_NAME , EMAIL
  FROM EMPLOYEES ;
  
-- 실습3) 부서테이블에서 부서ID, 부서명, LOCATION_ID 를 출력
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID 
  FROM DEPARTMENTS ;

-- 실습4) 직원 테이블에서 EMAIL, EMPLOYEE ID, JOB ID, LAST NAME을 순서대로 출력
SELECT EMAIL, EMPLOYEE_ID, JOB_ID, LAST_NAME
  FROM EMPLOYEES ;
  
-- 실습5) 직원테이블에서 직원들의 부서id를 출력
SELECT * FROM EMPLOYEES ;

SELECT DEPARTMENT_ID
  FROM EMPLOYEES ;
  
--DISTINCT : 데이터 중복 제거

--SELECT ★DISTINCT★ 조회하고 싶은 컬럼명 1, 2, 3, ...
-- FROM 테이블

-- 직원들의 부서 ID를 중복 제거하여 출력
SELECT DISTINCT DEPARTMENT_ID 
  FROM EMPLOYEES ;

-- 실습 6) 직원테이블에서 JOB_ID와 부서 ID를 중복을 제거하여 출력
SELECT DISTINCT JOB_ID, DEPARTMENT_ID
  FROM EMPLOYEES ;

-- DISTINCT 중복 제거는 뒤에 2개 이상의 컬럼이 있으면
-- 한쪽 컬럼에 중복이 있어도 다른 쪽 컬럼의 값이 다르면 '다르게' 취급한다. 

-- 실습 1) 직원테이블에서 입사일을 출력 후 행의 개수 확인 후, 주석으로 행의 객수를 입력
SELECT HIRE_DATE
  FROM EMPLOYEES ;
-- 행의 개수 : 107개

-- 실습 2) 직원테이블에서 입사일을 출력. 단, 중복을 제거해서 주석으로 행의 갯수를 입력
SELECT DISTINCT HIRE_DATE
  FROM EMPLOYEES ;
-- 행의 개수 : 98개


--TIP!!!
--컬럼에 숫자연산이 가능하다(+, -, *, /)!

SELECT '안녕하세요'  --작은따옴표('')만 문자열로 인식함. (""는 안됨)
  FROM EMPLOYEES ;

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES ;

-- 문제) 직원테이블에서 직원의 이름과 급여, 연봉을 출력
SELECT FIRST_NAME, SALARY, SALARY*12
  FROM EMPLOYEES ;

-- 별칭 사용하기
-- Alias 라고 하며 한눈에 보기 좋게 설정하는 것을 말함
-- AS 키워드를 사용해서 별칭을 지정합니다.
SELECT FIRST_NAME
      , SALARY
      , SALARY*12  AS "연봉"   --별칭의 문자열은 큰따옴표("")로
  FROM EMPLOYEES ;

-- 별칭 사용 방법
-- 1. SELECT 컬럼명 별칭
-- 2. SELECT 컬럼명 "별칭"
-- 3. SELECT 컬럼명 AS 별칭
-- 4. SELECT 컬럼명 AS "별칭"

-- 실습) 연산을 이용해서 직원테이블에서 입사일, 입사일 다음날을 출력
-- 단, 입사일은 별칭을 입사일로, 입사일 다음날은 "입사일다음날" 별칭을 사용해서 출력
SELECT HIRE_DATE 입사일
      ,HIRE_DATE +1 입사일다음날  --띄어쓰기 하고싶으면 ""으로 써야함
  FROM EMPLOYEES ; 
  
SELECT HIRE_DATE "입사일"
      ,HIRE_DATE+1 "입사일 다음날"
  FROM EMPLOYEES ;
  
SELECT HIRE_DATE AS 입사일
      ,HIRE_DATE+1 AS 입사일다음날
  FROM EMPLOYEES ;

SELECT HIRE_DATE AS "입사일" 
      ,HIRE_DATE+1 AS "입사일다음날"
  FROM EMPLOYEES ;


-- ORDER BY절이란?
-- 특정 컬럼을 기준으로 정렬된 형태로 출력하고자 할 때 사용한다.
-- SQL 실행 순서에서 가장 마지막에 실행된다.
-- 또한, 별도로 정렬 방식을 지정하지 않으면 기본적으로 오름차순이 적용된다.

-- ASC (Ascending) : 오름차순 정렬 (1, 2, 3, ...)
-- DESC (Descending) : 내림차순 정렬 (10, 9, 8, ...)

-- 직원테이블에서 모든 직원의 정보를 출력. 
-- 급여를 오름차순으로 정렬
SELECT *
  FROM EMPLOYEES 
ORDER BY SALARY ASC ;  --OREDR BY SALARY ; 도 가능

-- 실습) 최근에 입사한 날짜를 기준으로 직원의 이름과 입사날짜를 출력
SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES 
ORDER BY HIRE_DATE DESC ;

-- 실습) 직원테이블에서 직원ID, 부서ID, 이름, 급여 순으로 출력
-- 단, 부서ID는 오름차순으로, 급여는 내림차순으로 정렬해서 출력
SELECT EMPLOYEE_ID, DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES 
ORDER BY DEPARTMENT_ID ASC, SALARY DESC ;
-- 같은 부서에서 근무하고 있는 직원들끼리 급여가 높은 순으로 출력
-- 먼저 부서ID를 오름차순으로 정렬한 후에 급여를 내림차순으로 정렬한 것


-- NULL 값이란?
-- NULL값이란 데이터의 값이 완전히 비어 있는 상태를 의미
-- 값이 존재하지 않거나 정해지지 않은 것을 의미합니다.
-- 숫자 0과 문자열 " "은 NULL값이 아닙니다.
-- ★★★ NULL과 연산을 하면 결과값은 무조건 NULL값이 나온다!

-- 실습) 직원테이블에서 직원ID, 보너스, 보너스두배의 정보를 출력
-- 단, 보너스 두 배의 정보는 UP_BONUS로 별칭을 사용해서 출력
SELECT EMPLOYEE_ID, COMMISSION_PCT, COMMISSION_PCT*2 AS "UP_BONUS"
  FROM EMPLOYEES ;

