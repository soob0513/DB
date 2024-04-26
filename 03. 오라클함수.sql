-- CHAPTER 03. 오라클함수 --

-- 함수란?
--> 입력값을 넣어 특정한 기능을 통해 결과값을 출력

-- 사용자 정의 함수 : 사용자가 필요에 의해 직접 정의한 함수

-- 내장 함수 : 오라클에서 미리 만들어 놓은 함수, 필요할 때마다 호출해서 사용
-- 문자형, 숫자형, 날짜형, 변환형, NULL 함수, 조건함수가 있다.

-- 함수를 실행할 때 사용하는 입력값 : 매개변수, 인자값



-- [문자형 함수]
-- UPPER : 괄호 안 문자 데이터를 모두 대문자로 변환하여 출력
-- LOWER : 괄호 안 문자 데이터를 모두 소문자로 변환하여 출력

SELECT 'abcde123@@'
  FROM DUAL ;       -- 테스트용 테이블
-- DUAL 테이블이란?
--> 오라클 최고 관리자(SYS) 소유의 테이블
--> 임시 연산이나 함수의 결과값 확인 용도로 사용되는 '테스트용 테이블'이다!!

SELECT UPPER('abcde123@@')
  FROM DUAL ;

-- 실습) 직원 테이블에서 직원의 FIRST_NAME 과 EMAIL로 출력,
-- 이름을 대문자로, 이메일 정보는 소문자로 출력
SELECT UPPER(FIRST_NAME), LOWER(EMAIL)
  FROM EMPLOYEES ; 



-- LENGTH : 괄호 안 문자 데이터의 길이를 구하는 함수
SELECT LENGTH('HELLO WORLD')
  FROM DUAL ;

-- 직원의 FIRST_NAME을 출력, FIRST_NAME의 길이도 같이 출력
SELECT FIRST_NAME, LENGTH(FIRST_NAME)
  FROM EMPLOYEES ;
  
-- 실습) 직원의 FIRST_NAME의 길이가 5인 이상의 직원들의 직원ID, 이름 출력
SELECT EMPLOYEE_ID, FIRST_NAME, LENGTH(FIRST_NAME)
  FROM EMPLOYEES 
 WHERE LENGTH(FIRST_NAME) > = 5 
ORDER BY EMPLOYEE_ID ASC;



-- SUBSTR : 문자열을 추출하는 함수
-- 1. SUBSTR(입력값, 시작위치, 추출길이)
    --> 문자열 데이터의 시작위치부터 추출길이만큼 출력
-- 2. SUBSTR(입력값, 시작위치)
    --> 추출 길이 생략 시 문자열 데이터의 시작위치부터 끝까지 출력
SELECT '스마트인재개발원'
      , SUBSTR('스마트인재개발원',1,3)
      , SUBSTR('스마트인재개발원', 4)  AS 인재개발원
  FROM DUAL ;

-- 실습) 직원테이블에서 입사날짜에서 연도, 월, 일 별로 출력
-- 각 컬럼에는 연도, 월, 일 이라는 별칭을 사용해서 출력
SELECT HIRE_DATE FROM EMPLOYEES ;
SELECT SUBSTR(HIRE_DATE, 1,2) AS 연도
     , SUBSTR(HIRE_DATE, 4,2) AS 월
     , SUBSTR(HIRE_DATE, 7) AS 일  , FIRST_NAME
  FROM EMPLOYEES 
ORDER BY HIRE_DATE ASC ;

-- 문제) DUAL 테이블을 이용해서 'https://smhrd.or.kr' 의 문자열을 입력받아
--      smhrd 문자열만 잘라서 출력
SELECT 'https://smhrd.or.kr' FROM DUAL ;
SELECT 'https://smhrd.or.kr'
    , SUBSTR('https://smhrd.or.kr',9,5) AS  smhrd
  FROM DUAL ;



-- REPLACE : 특정 문자를 다른 문자로 바꾸어 주는 함수
-- 1. REPLACE(문자열데이터 및 컬럼, 바꾸고 싶은 문자, 바꿔야 할 문자)
-- 2. REPLACE(문자열데이터 및 컬럼, 바꾸고 싶은 문자)
    --> 바꿔야 할 문자를 생략 시 바꾸고 싶은 문자는 문자열 데이터에서 삭제가 된다!

SELECT '스마트#인재개발원'
      , REPLACE('스마트#인재개발원', '#','-')
      , REPLACE('스마트#인재개발원', '#') AS 삭제
  FROM DUAL ;

-- 실습) 직원 테이블에서 입사날짜를 출력
-- '/'를 '-'으로 바꿔서 출력하고 별칭을 하이픈
-- '/'를 삭제해서 출력하고 별칭을 삭제
SELECT HIRE_DATE
      , REPLACE(HIRE_DATE, '/', '-') AS 하이픈
      , REPLACE(HIRE_DATE, '/') AS 삭제
  FROM EMPLOYEES ;



-- CONCAT : 두 문자열 데이터를 합치는 함수
-- 인자값으로 2개만 들어갈 수 있다. 그래서 2개의 문자열만 합치는 함수이다!
-- 합성연산자 '||'를 이용하여 무한대로 문자열 연결이 가능하다.

SELECT CONCAT('스마트', '인재개발원')||'최고입니다'||'!!!'
  FROM DUAL ;

-- 직원 테이블에서 직원의 이름을 출력
-- 직원 이름 앞에 '이름은  '을 합쳐보기
SELECT CONCAT('이름은  ',FIRST_NAME) ||'입니다'
  FROM EMPLOYEES ;



-- TRIM : 입력 받은 문자형 데이터의 양 끝의 공백을 제거합니다.
SELECT TRIM('        여러분은 최고 입니다         ')
      , REPLACE(TRIM('        여  러  분  은   최 고         입   니 다         '),' ')
      , REPLACE('        여  러  분  은   최 고         입   니 다         ', ' ')
  FROM DUAL ;





-- [숫자형 함수]

-- ROUND : 특정 위치에서 반올림 하는 함수
-- 1. ROUND(반올림 할 숫자, 반올림 위치)
-- 2. ROUND(반올림 할 숫자)
    --> 반올림 위치 생략 시 소수점 첫째 자리에서 강제로 반올림 수행


-- TRUNC : 특정 위치에서 버리는 함수
-- 1. TRUNC(버림 할 숫자, 버림 위치)
-- 2. TRUNC(버림 할 숫자)
    --> 버림 위치 생략 시 소수점 첫째 자리에서 강제로 버림 수행
    
SELECT ROUND(1234.56789, 1)
      , ROUND(1234.56789,2)
      , ROUND(1234.56789,3)
      , ROUND(1234.56789,4)
      , ROUND(1234.56789) AS 반올림
  FROM DUAL ; 
SELECT TRUNC(1234.56789, 1)
      , TRUNC(1234.56789, 2)
      , TRUNC(1234.56789, 3)
      , TRUNC(1234.56789) AS 버림
  FROM DUAL ;


-- MOD : 숫자를 나눈 나머지 값을 구하는 함수
--> 홀수, 짝수를 구분할 때 유용하게 사용

-- MOD(나누게 될 숫자, 나눌 숫자)
SELECT MOD(10,2) AS "0", MOD(10,3) AS "1"
      , MOD(15,6)
  FROM DUAL ;



--[날짜형 함수]

-- SYSDATE : 현재 날짜와 시간을 출력해주는 함수
--> 입력 시 바로 출력되며, 현재 시간을 초 단위까지 출력 가능
--> 날짜형 함수는 연산이 가능

SELECT SYSDATE
  FROM DUAL ;
  
-- <날짜 형식 세팅>
-- 도구 > 환경설정 > 데이터베이스 > NLS > 날짜 형식 > YYYY-MM-DD HH24:MM:SS 입력

SELECT SYSDATE AS NOW
     , SYSDATE -1 AS YESTERDAY
     , SYSDATE +1 AS TOMORROW
--   , SYSDATE + SYSDATE   -- 날짜 데이터끼리는 연산이 불가능!!
  FROM DUAL ; 

SELECT SYSDATE AS 현재
      , SYSDATE + 1 AS "하루를 더한 것"
      , SYSDATE + 1/24 AS "1시간을 더한 것"
      , SYSDATE + 1/24/60 AS "1분을 더한 것"
      , SYSDATE + 1/24/60/60 AS "1초를 더한 것"
  FROM DUAL ;


-- ADD_MONTHS : 몇개월 이후 날짜를 구하는 함수
-- ADD_MONTHS(날짜데이터, 더하거나 뺄 개월 수)

SELECT SYSDATE AS NOW
      , ADD_MONTHS(SYSDATE, 1) AS "1개월 후"
      , ADD_MONTHS(SYSDATE, -3) AS "3개월 전"
  FROM DUAL ; 



-- [변환형 함수]
-- 암시적 형변환 : 데이터베이스가 자동으로 형변환을 해주는 것
-- 명시적 형변환 : 데이터 변환형 함수를 사용해서 사용자가 직접 자료형을 지정해주는것

-- TO-CHAR : 날짜, 숫자 데이터를 문자 데이터로 변환 해주는 함수
-- TO-CHAR(변환 할 데이터, 출력형태)

SELECT SALARY
      , TO_CHAR(SALARY, 'L999,999')
  FROM EMPLOYEES ; 

-- 현재 날짜를 'YY/MM/DD/DAY' 형태로 변환
SELECT TO_CHAR(SYSDATE, 'YY/MM/DD/DAY')
  FROM DUAL ; 


-- TO_NUMBER : 문자 데이터를 숫자 데이터로 변환하는 함수
-- TO_NUMBER(문자열 데이터, 인식 될 숫자 형태)

SELECT TO_NUMBER('1,000','999,999') + 500
  FROM DUAL ;



-- TO_DATE : 문자 데이터를 날짜 데이터로 변환해주는 함수
-- TO_DATE(문자열 데이터, 인식 월 날짜 형태)
-- 문자열 또는 컬럼의 데이터를 날짜 포맷으로 변환하여 주는 것
-- 사람 이름이나 주민등록번호 같은 것은 날짜로 변경이 불가능

SELECT TO_DATE('2024-02-27','YYYY-MM-DD')
  FROM DUAL ;


-- NULL 처리 함수
-- NVL / NVL2 : NULL값을 대체할 수 있는 함수
-- 1. NVL(NULL인지 여부를 검사할 데이터, NULL일 경우 반환할 데이터)
-- 2. NVL2(<1>NULL인지 여부를 검사할 데이터
--       , <2>NULL이 아닐 경우 반환할 데이터
--       , <3>NULL일 경우 반환할 데이터)

-- 실습1) 직원 테이블에서 직원ID, FIRST_NAME, MANAGER_ID를 출력
-- *매니저가 있는 직원은 '직원'으로 출력
-- *매니저가 없는 직원은 '대표'로 출력
SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
     , NVL2(MANAGER_ID, '직원', '대표')
  FROM EMPLOYEES ;
  
-- 실습2) 직원 테이블에서 보너스가 없는 직원들은 숫자 0으로 대체해서 출력
SELECT FIRST_NAME, COMMISSION_PCT
      , NVL(COMMISSION_PCT, 0)
  FROM EMPLOYEES ; 
  
  
  

-- [조건 함수]

-- DECODE : 상황에 따라 다른 데이터를 반환하는 함수
--> 검사 대상과 비교해서 지정한 값을 반환
-- DECODE(<1>검사대상이 될 컬럼 또는 데이터, <2>비교 
--      , <3> 일치 시 반환할 값, <4> 일치하지 않을 때 반환할 값

-- 실습) 직원 테이블에서 매니저가 있는 직원은 '직원'으로, 
--     매니저가 없는 직원은 '대표'로 출력 (DECODE 함수로)
SELECT FIRST_NAME, DECODE(MANAGER_ID, NULL, '대표', '직원')
  FROM EMPLOYEES ;

SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
      , DECODE(EMPLOYEE_ID, 100, '대표', '직원')
  FROM EMPLOYEES ;

