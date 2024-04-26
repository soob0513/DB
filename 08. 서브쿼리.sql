-- CHAPTER 08. 서브쿼리 --

-- [서브쿼리란?]
--> SQL문을 실행하는데 필요한 데이터를 추가로 조회하기 위해서
-- SQL 내부에서 사용하는 SELECT 문을 의미한다.
-- 서브쿼리는 메인쿼리 안에 포함된 종속적인 관계이다.

-- 메인쿼리 : 서브쿼리의 결과값을 사용하여 기능을 수행하는 영역
-- 서브쿼리 : 메인쿼리의 조건식에 들어가는 값을 의미


-- 실습) 직원 테이블에서 Jack의 급여보다 낮은 직원의 이름과 급여를 출력
    -- 1. 테이블의 정보 확인
SELECT * FROM EMPLOYEES ;
    -- 2. 조건의 기준이 되는 Jack의 급여 정보 확인
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES 
 WHERE FIRST_NAME = 'Jack' ;
    -- 3. 2번의 결과값을 가지고 조건절을 통해 결과값 출력
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY < (SELECT SALARY
                   FROM EMPLOYEES 
                  WHERE FIRST_NAME = 'Jack');

-- 직원 테이블에서 JAMES의 급여보다 낮은 직원의 이름과 급여 정보를 조회
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY < (SELECT SALARY
                   FROM EMPLOYEES
                  WHERE FIRST_NAME = 'James');
        --> 에러 발생
-- James의 급여 정보를 확인          
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES 
 WHERE FIRST_NAME = 'James' ;  --> James라는 사람이 두 명이다
 


-- [서브쿼리의 특징]
  -- 1. 서브쿼리는 연산자와 같은 비교 또는 조회 대상의 오른쪽에 놓이며 ()로 묶어서 사용한다.
  -- 2. 서브쿼리의 SELECT절에 명시한 컬럼은 메인쿼리의 비교 대상과 같은 자료형과 개수를 지정해야한다.
  -- 3. 서브쿼리에 있는 SELECT 문의 결과 행 수는 함께 사용하는 메인쿼리의 연산자 종류와 호환 가능해야 한다.
  --   즉, 단 하나의 데이터로만 연산 가능한 연산자라면 서브쿼리의 결과 행 수도 하나여야 한다.
  -- 연산자와 함께 상호 작용하는 방식에 따라서 단일 행 서브쿼리와 다중 행 서브쿼리로 나뉜다.

-- 단일 행 서브쿼리 란?
  --> 실행 결과가 단 하나의 행으로 나오는 서브쿼리를 말한다.
  --> =, >, >=, <, <=, !=, <>, ^=

-- 실습) 직원 테이블에서 NANCY보다 빨리 입사한 직원의 이름과 입사일 조회
-- 1. Nancy의 입사 날짜 정보를 확인 (서브쿼리)
SELECT FIRST_NAME, HIRE_DATE 
  FROM EMPLOYEES 
 WHERE FIRST_NAME = 'Nancy';  --> 2002/08/17
-- 2. 1번의 결과를 가지고 메인쿼리에 조건절 입력
SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES 
 WHERE HIRE_DATE < (SELECT HIRE_DATE
                      FROM EMPLOYEES
                     WHERE FIRST_NAME = 'Nancy') ;

-- 실습) 직원 테이블에서 평균 급여보다 높은 급여를 받는 직원의 이름과 급여 정보를 조회
SELECT AVG(SALARY) FROM EMPLOYEES ; --6461.8

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY > (SELECT AVG(SALARY)
                   FROM EMPLOYEES);




-- [다중 행 서브쿼리 란?]
  --> 실행 결과 행이 여러 개로 나오는 서브쿼리를 말한다,
  --> 단일 행 연산자는 사용할 수 없고 다중 행 연산자를 사용해야 한다.

-- [다중 행 연산자의 종류]
  -- IN : 메인쿼리의 데이터가 서브쿼리의 결과 중 하나라도 일치하는 데이터가 있으면 TRUE값을 반환
        --> IN (서브쿼리)
  -- ANY, SOME  : 메인쿼리의 조건식을 만족하는 서브쿼리의 결과가 하나 이상이면 TRUE 값을 반환
        --> 비교연산자 ANY (서브쿼리)
  -- ALL : 메인쿼리의 조건식을 서브쿼리의 결과 모두가 만족하면 TRUE
        --> 비교연산자 ALL (서브쿼리)
  -- EXISTS : 서브 쿼리 결과 값이 '존재'하는지 여부만 확인한다(즉, 출력된 행이 하나 이상이면 TRUE)
        --> EXISTS (서브쿼리)


-- 실습) 각 부서별 최고 급여와 동일한 급여를 받는 직원들의 정보를 출력(부서ID, FIRST_NAME, SALARY)
-- IN 연산자를 이용
-- 1. 부서별 최고 급여의 정보
SELECT DEPARTMENT_ID, MAX(SALARY)
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID ;

-- 2. 서브쿼리를 이용해서 결과값 출력
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES 
 WHERE SALARY IN (SELECT MAX(SALARY)
                    FROM EMPLOYEES
                  GROUP BY DEPARTMENT_ID);
    --> 부서별 최고 급여와 같은 급여를 가지는 모든 직원들의 정보가 출력
    

-- ANY 연산자 사용
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES 
 WHERE SALARY = ANY  (SELECT MAX(SALARY)
                    FROM EMPLOYEES
                  GROUP BY DEPARTMENT_ID);
        --> IN 연산자와 같은 결과값이 출력, 현업에서는 IN 연산자를 많이 사용한다.
        --> 조건에 만족하는 결과가 하나라도 참이면 참을 반환한다.
   
-- 실습) 부서별 최고 급여보다 높은 급여를 받는 직원들을 출력
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY > ANY (SELECT MAX(SALARY)
                      FROM EMPLOYEES
                      GROUP BY DEPARTMENT_ID);
        --> 부서별 최고 급여가 하나라도 참이면 참인 결과값이 반환
        --> 값들 중 어떤 하나의 값보다 메인쿼리의 값이 큰 값을 가지면 모든 값이 출력된다
        --> 즉, 부서별 최소 급여보다 높은 값들은 전부 출력된다.
        

-- ALL 연산자 사용
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES 
 WHERE SALARY >= ALL (SELECT MAX(SALARY)
                    FROM EMPLOYEES
                    GROUP BY DEPARTMENT_ID);
    -- 메인쿼리는 서브쿼리의 모든 결과값을 만족해야함
    -- 서브쿼리의 결과값 중 가장 큰 값과 비교를 해서 크거나 같은 값을 가진 데이터만 출력
    -- 최대값보다 큰 값만 구하겠다


-- EXISTS 연산자 : 존재 여부만 확인한다.
-- 실습) 부서ID별 직원수를 확인
SELECT DEPARTMENT_ID, COUNT(*)
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID ;

-- 서브쿼리의 결과값이 존재하는 경우
SELECT FIRST_NAME, DEPARTMENT_ID
  FROM EMPLOYEES 
 WHERE EXISTS (SELECT FIRST_NAME
                FROM EMPLOYEES
                WHERE DEPARTMENT_ID = 110 );
        --> 서브쿼리 결과값 존재O => 107개의 행 전부 출력

-- 서브쿼리의 결과값이 존재하지 않는 경우
SELECT FIRST_NAME, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE EXISTS (SELECT FIRST_NAME 
                FROM EMPLOYEES
                WHERE DEPARTMENT_ID = 120) ;
        --> 서브쿼리 결과값 존재X => 출력 X
        

-- [다중 컬럼 서브쿼리]
  --> 서브쿼리의 결과로 여러 컬럼이 반환되어 메인쿼리의 조건과 동시에 비교되는 것을 의미
  --> 주로 IN 연산자와 함께 사용

-- 실습) 각 부서별 최고 급여와 동일한 급여를 받는 직원의 정보 (부서ID, FIRST_NAME, SALARY)
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE (DEPARTMENT_ID, SALARY) IN (SELECT DEPARTMENT_ID, MAX(SALARY)
                                     FROM EMPLOYEES 
                                   GROUP BY DEPARTMENT_ID);
        --> 2개의 컬럼을 비교해서 해당 부서별로 최고 급여를 받는 직원만 출력되도록 제한됨
        


-- [인라인 뷰(Inline View)]
  --> FROM절에서 가상 테이블처럼 사용하는 서브쿼리
  --> 인라인 뷰를 사용하면 서브 쿼리의 결과를 마치 테이블처럼 사용가능
  --> 데이터베이스 SELECT 문을 객체로써 저장해 테이블처럼 사용하는 VIEW와 달리
       -- 인라인뷰는 쿼리 내에서 즉시 처리된다

-- 실습)
SELECT FIRST_NAME, DEPARTMENT_ID, SALARY
  FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID ;

-- 인라인 뷰를 사용해서 부서별로 최고 급여를 받는 직원의 이름, 부서ID, 부서별 최고 급여
SELECT E.FIRST_NAME, E.DEPARTMENT_ID, B."부서별 최고 급여"
  FROM EMPLOYEES E, (SELECT DEPARTMENT_ID, MAX(SALARY) AS "부서별 최고 급여"
                      FROM EMPLOYEES
                      GROUP BY DEPARTMENT_ID) B  -- 인라인 뷰로 만든 가상 테이블
 WHERE E.DEPARTMENT_ID = B.DEPARTMENT_ID
   AND E.SALARY = B."부서별 최고 급여" ; -- 부서ID가 같으면서 급여가 최고 급여와 같은 값

-- 내부 컬럼 지정 불가
  --> 별칭을 주어야만 컬럼을 지정해서 사용 가능




-- [스칼라 서브 쿼리(Scalar Subquery)]
  --> SELECT에서 사용되는 서브쿼리
  --> 하나의 컬럼에 대한 하나의 행만 반환되는 특징을 가지고 있다.
  --> JOIN 없이 JOIN처럼 기능하고자 할 때 사용
  
-- 실습) 직원이름, 급여, 부서ID, 부서이름을 출력
SELECT E.FIRST_NAME, E.SALARY, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
  FROM EMPLOYEES E JOIN DEPARTMENTS D 
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID) ;
            -- JOIN 사용 -> NULL값 제외

-- 스칼라 서브쿼리 사용 (JOIN없이)
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID, (SELECT DEPARTMENT_NAME
                                             FROM DEPARTMENTS 
                                            WHERE DEPARTMENT_ID = E.DEPARTMENT_ID) DEPARTMENT_NAME
  FROM EMPLOYEES E;
            -- 스칼라 서브쿼리 -> NULL값이 포함되어 출력된다  
            
