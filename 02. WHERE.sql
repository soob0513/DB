-- CHAPTER 02. WHERE --

-- [WHERE �� �⺻ ��� ���]
-- 3. SELECT  ��ȸ�� �÷���1, 2, ...
-- 1. FROM    ���̺��
-- 2. WHERE   ��ȸ�� ���� �����ϱ� ���� ���ǽ�

--�ǽ�1) �������̺��� ����ID�� 105�� ������ FIRST_NAME�� LAST_NAME�� ���
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 105 ;
 
--�ǽ�2) �μ����̺��� �Ŵ������̵� 100�� �μ��̸��� �μ����̵� ���
SELECT MANAGER_ID, DEPARTMENT_NAME, DEPARTMENT_ID
  FROM DEPARTMENTS 
 WHERE MANAGER_ID = 100 ;
 
-- �ǽ�3) �������̺��� �޿��� 9000�� ������ ����ID, ���� �̸�, �޿� ������ ���
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY = 9000 ;



-- [��� ������ (+, -, *, / )]
-- �ǽ�)������ �޿������� ����ϴµ� ��������� 4���� �̿��ؼ� ���
SELECT LAST_NAME, SALARY+SALARY AS ���ϱ�
  FROM EMPLOYEES ;
SELECT EMPLOYEE_ID, SALARY - 1000 AS ����
  FROM EMPLOYEES ;
SELECT EMPLOYEE_ID, SALARY *12 AS ����
  FROM EMPLOYEES ;
SELECT LAST_NAME, SALARY / 100 AS ������
  FROM EMPLOYEES ;



-- [�� ������ (>�ʰ�, <�̸�, <=����, >=�̻�)]
-- �ǽ�1) �������̺��� �޿��� 5000 ������ ������ FIRST_NAME, �޿� ������ ���
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY <= 5000 
 ORDER BY SALARY ASC ;
 
-- �ǽ�2) �������̺��� ������ 50000 ������ ������ �̸��� ������ ���
SELECT FIRST_NAME, SALARY*12 AS ����
  FROM EMPLOYEES
 WHERE SALARY*12 <= 50000   -- SALARY*12�� '����'�̶�� ������ �ȵ�.
ORDER BY SALARY*12 ASC ;    -- SALARY*12�� '����'�̶�� ��� ��



-- [� �� ������]
-- = : ����
-- !=, <>, ^= : ���� �ʴ�
-- NOT A = B : ���� �ʴ�

--�ǽ�1)�������̺��� ����ID�� IT_PROG�� �ƴ� ������ �̸��� ����ID�� ���
SELECT * FROM EMPLOYEES ;
SELECT FIRST_NAME, EMPLOYEE_ID, JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID ^= 'IT_PROG' ;
 
--�ǽ�2) �������̺��� EMAIL������ SKING�� ������ ��� ������ ���
SELECT *
  FROM EMPLOYEES 
 WHERE EMAIL = 'SKING' ;

--�ǽ�3) �������̺��� EMAIL������ SKING�� �ƴ� ������ ��� ������ ���
SELECT *
  FROM EMPLOYEES
 WHERE EMAIL <> 'SKING' ;
 

-- [�� ������]
-- AND(�׸���) : ������ ��� �����ϴ� ��� TRUE ���� ��ȯ
-- OR(Ȥ��) : �ϳ��� �����̶� �����ϴ� ��� TRUE ���� ��ȯ

-- �ǽ�) �������̺��� �μ�ID�� 90�̰� �޿��� 5000 �̻��� ������ ID, �̸�, �޿��� ���
SELECT DEPARTMENT_ID, EMPLOYEE_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES 
 WHERE DEPARTMENT_ID = 90
   AND SALARY >= 5000 ;

-- �ǽ�) ���� ���̺��� �μ� ���̵� 100�̰ų� �Ի����� 06�� 06�� 02�� ���Ŀ� �Ի��� 
-- ������ �̸�, �μ� ���̵�, �Ի����� ���
SELECT FIRST_NAME, DEPARTMENT_ID, HIRE_DATE
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 100
    OR HIRE_DATE > '06/06/02' ;    -- HIRE_DATE�� ���ڿ�

-- �ǽ�) �μ� ID�� 100�̰ų� 90�� ���� �߿���
-- ���� ID�� 101�� ������ ����ID, FIRST_NAME, ������ ���(��, ������ AnnSal�� ��Ī ����
SELECT DEPARTMENT_ID, EMPLOYEE_ID, FIRST_NAME, SALARY*12 AS AnnSal
  FROM EMPLOYEES 
 WHERE DEPARTMENT_ID = 100 AND EMPLOYEE_ID = 101
    OR DEPARTMENT_ID = 90 AND  EMPLOYEE_ID = 101 ;  
        --AND�� OR���� �켱�̴�!

 SELECT DEPARTMENT_ID, EMPLOYEE_ID, FIRST_NAME, SALARY*12 AS AnnSal
  FROM EMPLOYEES 
 WHERE (DEPARTMENT_ID = 90 OR DEPARTMENT_ID = 100)
       AND  EMPLOYEE_ID = 101 ;
       
SELECT DEPARTMENT_ID, EMPLOYEE_ID, FIRST_NAME
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 90 OR DEPARTMENT_ID = 100 ;
 
 SELECT DEPARTMENT_ID, EMPLOYEE_ID, FIRST_NAME, SALARY*12 AS AnnSal
  FROM EMPLOYEES 
 WHERE EMPLOYEE_ID = 101 
       AND (DEPARTMENT_ID = 90 OR DEPARTMENT_ID = 100) ;
       



--[NULL ���� ������]
-- IS NULL : ������ ���� NULL�� ���� ��ȸ
-- IS NOT NULL : ������ ���� NULL�� �ƴ� ���� ��ȸ

-- �������̺��� ������ �̸��� ���ʽ��� ���
SELECT FIRST_NAME, COMMISSION_PCT
  FROM EMPLOYEES ;

-- �ǽ�) ���� ���̺��� ���ʽ��� �ִ� ������ ���(FIRST_NAME, ���ʽ� �������)
SELECT FIRST_NAME, COMMISSION_PCT
  FROM EMPLOYEES
 WHERE COMMISSION_PCT IS NOT NULL ;

-- �ǽ�) ���� ���̺��� �Ŵ���ID�� ���� ������ ��� ���� ���
SELECT *
  FROM EMPLOYEES 
 WHERE MANAGER_ID IS NULL ;




--[SQL ������]
-- SQL���� ����� �� �ִ� ������
-- IN , NOT IN, BETWEEN, LIKE

-- IN : Ư�� �÷��� ���Ե� �����͸� ������ ��ȸ�� �� Ȱ��
-- =(������) + OR(��������)
-- IN�� NULL���� �����ϴ� Ư¡�� ������ �ִ�.

-- �ǽ�) ���� ���̺��� �μ����̵� 30�̰ų� 50�̰ų� 90�� ������ ��� ���� ���
SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 30
    OR DEPARTMENT_ID = 50
    OR DEPARTMENT_ID = 90 ; 

SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN (30, 50, 90);

-- �ǽ�) �������̺��� �Ŵ��� ���̵� 100, 102, 103, NULL�� ������
-- �̸��� �Ŵ��� ���̵� ��� (IN�����ڸ� �̿�)
SELECT FIRST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID IN (100, 102, 103)
    OR MANAGER_ID IS NULL;
    
-- NOT IN 
-- IN �ڿ� ���ǿ� �ش����� �ʴ� �����͸� ���
-- (!=) + (AND)
-- (���ǻ���) NOT IN�� NULL ���� ������ �ƿ� ���� �ȳ��͹�����!

-- ���� ���̺��� �Ŵ��� ID�� 100, 120, 121�� �ƴ� �������� �̸��� �Ŵ������̵� ���
SELECT FIRST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID NOT IN (100, 120, 121) ;

-- �ǽ�1) �������̺��� �Ŵ���ID�� 145,146,147,148,149�� �ƴ� ������
-- �̸��� �Ŵ���ID�� ���
SELECT FIRST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID NOT IN (145, 146,147,148,149) ;

-- �ǽ�2) �������̺��� ����ID�� AD_VP�̰ų� ST_MAN�� ������ �̸��� ����ID�� ���
SELECT FIRST_NAME, JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID IN ('AD_VP', 'ST_MAN') ;




-- [BETWEEN A AND B ������]
-->���� ���� ���� �����͸� ��ȸ�� �� ���
-- BETWEEN �ּڰ� AND �ִ밪
-->Ư�� �� ���� �ּ�, �ִ� ������ �����ؼ� �ش� ���� ���� �����͸� ��ȸ�ϴ� ��

-- �ǽ�) ���� ���̺��� �޿��� 10000�̻��̰� 20000�̸��� �������� ��� ���� ���
SELECT * 
  FROM EMPLOYEES
 WHERE SALARY BETWEEN 10000 AND 20000 ;
        -- SALARY >= 10000 AND SALARY < 20000 

-- �ǽ�) ���� ���̺��� 2005�⿡ �Ի��� ������ �̸��� �Ի����� ���
SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
 WHERE HIRE_DATE BETWEEN '05/01/01' AND '05/12/31' 
ORDER BY HIRE_DATE DESC ;




-- [LIKE ������]
-- �Ϻ� ���ڿ��� ���Ե� �����͸� ��ȸ�� �� ���
-- ���ϵ� ī�带 �̿��ؼ� ��Ī ������ ����
-- ���ϵ�ī�� ����
-- 1. % : ���̿� ������� ��� ���� �����͸� �ǹ�
-- 2. _ : � ���̵� ������� �� ���� ���� �����͸� �ǹ�

--����1) �������̺��� 650���� �����ϴ� �ڵ��� ��ȣ ã��
SELECT FIRST_NAME, PHONE_NUMBER
  FROM EMPLOYEES 
 WHERE PHONE_NUMBER LIKE '650%' ;

--����2) �������̺��� �̸��� S�� �����ϰ� n���� ������ ���� ã��
SELECT FIRST_NAME 
  FROM EMPLOYEES 
 WHERE FIRST_NAME LIKE 'S%n' ;

--����3) �������̺��� �̸��� it���� ������ �� 4������ ���� ã��
SELECT FIRST_NAME 
  FROM EMPLOYEES 
 WHERE FIRST_NAME LIKE '__it' ;

--����4) �������̺��� �̸��� �ι�° ���ڰ� e�� ���� ã��
SELECT EMPLOYEE_ID, FIRST_NAME
  FROM EMPLOYEES 
 WHERE FIRST_NAME LIKE '_e%' 
ORDER BY EMPLOYEE_ID ASC ;

--����5) �������̺��� 01���� �Ի��� ���� ã��
SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
 WHERE HIRE_DATE LIKE '__/01/__' 
ORDER BY HIRE_DATE DESC ;

SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
 WHERE HIRE_DATE LIKE '___01%' 
ORDER BY HIRE_DATE DESC ;