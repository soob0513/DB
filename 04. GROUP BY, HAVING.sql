-- CHAPTER 04. GROUP BY / HAVING �� --

-- [�����Լ��� ����]
-- ���� �� �Լ� : �Էµ� �ϳ��� �� �� ����� �ϳ��� ������ �Լ�
-- ���� �� �Լ� : ���� ���� �Է¹޾� �ϳ��� ��� ������ ����� �Ǵ� �Լ�
    --> ���� �� �Լ��� '�����Լ�'��� �θ���.
    
    -- [���� �� �Լ�(�����Լ�)�� Ư¡]
    -- 1. NULL ���� �����ϴ� Ư���� ������ �ִ�.
    -- 2. �׷�ȭ(GROUP BY)�� �Ǿ� �ִ� ���¿����� ��� ����!
    
    -- [�����Լ��� ����]
    -- COUNT : ������ �������� ������ ��ȯ
    -- SUM : ������ �������� ���� ��ȯ
    -- MAX : ������ ������ �� �ִ밪 ��ȯ
    -- MIN : ������ ������ �� �ּڰ� ��ȯ
    -- AVG : ������ ������ �� ��հ� ��ȯ



-- COUNT(������) 
-- ���� ���̺��� ����ID�� ���� ������ ��ȸ(�� ������)
SELECT -- EMPLOYEE_ID,    -- 107���� ��  ==> ���� ������ �ٸ�
       COUNT(EMPLOYEE_ID) AS "�� ������"  -- 1���� ��
  FROM EMPLOYEES ;
--> ����ϰ��� �ϴ� ���� ������ ���� �ʾƼ� ���� �߻�

SELECT COUNT(EMPLOYEE_ID)
  FROM EMPLOYEES 
GROUP BY () ;
-- ���� ���̺��� �ϳ��� �׷����� ���� ������ �ν��� �Ѵ�. 
    --> �׷��� �����Լ��� �����!

-- �ǽ�) �μ� ���̺��� �μ�ID�� ���� ������ ���
SELECT COUNT(DEPARTMENT_ID)
  FROM DEPARTMENTS ;
  
-- �ǽ�) ���� ���̺��� �μ�ID�� ���� ������ ���
SELECT COUNT(DEPARTMENT_ID)
  FROM EMPLOYEES ;

SELECT FIRST_NAME, DEPARTMENT_ID 
FROM EMPLOYEES 
WHERE DEPARTMENT_ID IS NULL ;

SELECT FIRST_NAME, DEPARTMENT_ID
  FROM EMPLOYEES ;
  
-- COUNT �Լ��� *(�ƽ�Ÿ����ũ)�� ����� �� �ִ�.
-- �ٸ� �����Լ��� ����� ���Ѵ�!

SELECT COUNT(*) 
  FROM EMPLOYEES ;
  --> �ƽ�Ÿ����ũ�� ����ϸ� NULL ������ �����ؼ� ����� ���ش�!

-- ����1) ���� ���̺��� �޿��� �� �հ踦 ���(SUM�Լ�)
SELECT SUM(SALARY)
 FROM EMPLOYEES ;

-- ����2) �������̺��� �������� �ִ� �޿��� �ּ� �޿��� ��� (MAX/MIN �Լ�)
SELECT MAX(SALARY), MIN(SALARY)
  FROM EMPLOYEES ;
  
-- ����3) �������̺��� �μ�ID�� 100�� ������ ��� �޿��� ��� (AVG �Լ�)
--        * ������� �Ҽ��� 1�� �ڸ����� �ݿø�
SELECT ROUND(AVG(SALARY),1)
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 100 ;
 

SELECT * FROM ���������� ;
SELECT * FROM ����ǥ ; 



-- [GROUP BY] : Ư�� �÷��� �������� �׷�ȭ(����)

-- GROUP BY ��� ���
-- 4. SELECT ��ȸ�� �÷���1, 2, ....
-- 1. FROM   ���̺� ��
-- 2. WHERE  ���ϴ� ���� �����ϱ� ���� ���ǽ�
-- 3. GROUP BY Ư�� �÷��� �������� �׷�ȭ

-- ���������� ���̺��� �Ҽӹ� �� �л��� �ο����� ��ȸ
SELECT * FROM ���������� ;

SELECT �Ҽӹ�, COUNT(�Ҽӹ�)
  FROM ���������� 
GROUP BY  �Ҽӹ� ;

-- ����1) ����ǥ ���̺��� ���񺰷� �ְ� ������ ���� ������ ���
SELECT ����, MAX(����), MIN(����)
  FROM ����ǥ
GROUP BY ���� ;

-- ����2) ����ǥ ���̺��� �л����� ��� ���� ���
--   ��, �Ҽ��� 1�ڸ������� ���
SELECT �л�ID, ROUND(AVG(����),1)
  FROM ����ǥ
GROUP BY �л�ID 
ORDER BY �л�ID ASC ;

-- ����3) ����ǥ ���̺��� �л����� JAVA, DB���� ������ ���� ���
SELECT * FROM ����ǥ ;

SELECT �л�ID, SUM(����)
  FROM ����ǥ
 WHERE ���� IN ('JAVA', 'DATABASE')
GROUP BY �л�ID 
ORDER BY �л�ID ASC ;




-- SQL ���� ����
-- FROM > WHERE > GROUP BY > HAVING > SELECT > ORDER BY

--[HAVING �� ] : GROUP BY ���� ������ ���� ����� �����ϴ�.
--> ���谡 �Ϸ�� ����� ������ ���� ���͸� �ϴ� ����
--> ������ ���� ����� ����� �ȴٴ� �������� WHERE���� ���������,
-- HAVING ���� �׷�ȭ�� ��󿡼��� ����� �����ϴٴ� ������ �ٸ���!

-- ����ǥ ���̺��� �л��� ��� ������ ���ϵ�, 
--  ��� ������ 75 ������ �л��鸸 ���
SELECT �л�ID, ROUND(AVG(����), 1)
  FROM ����ǥ
GROUP BY �л�ID 
HAVING AVG(����) <= 75 ;


-- WHERE���� HAVING���� ������
-- WHERE : GROUP BY������ ���� ����� => ���� �Լ� ��� �Ұ�
-- HAVING : GROUP BY�� ���Ŀ� ���� => ���� �Լ��� ���� ���� �ο� ����


--����1) ������ �������� �� �� �ο����� 3�� �̻��� �ݸ� ���
SELECT* FROM ���������� ;
SELECT �Ҽӹ�, COUNT(�Ҽӹ�)
  FROM ����������
GROUP BY  �Ҽӹ� 
HAVING COUNT(�Ҽӹ�) >= 3 ;

-- ����2) ���� ���̺��� �μ��� �ְ� ������ 100,000 �̻��� �μ��� ���
SELECT * FROM EMPLOYEES ;
-- ����Ǯ��(Ʋ��)
SELECT DEPARTMENT_ID, SALARY*12 AS ����
  FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID, SALARY
HAVING MAX(SALARY*12) >= 100000 
ORDER BY DEPARTMENT_ID ASC;

--������Ǯ��
SELECT DEPARTMENT_ID, MAX(SALARY*12)
  FROM EMPLOYEES 
  GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY*12) >= 100000  
ORDER BY DEPARTMENT_ID ASC;

-- ����3) ����ǥ ���̺��� �л��� ��� ������ ����ϵ�, 
--      NULL�� �ƴ� ���� ���. ��, ������ �Ҽ��� 1�� �ڸ������� ���
SELECT * FROM ����ǥ ;
SELECT �л�ID, ROUND(AVG(����), 1)
  FROM ����ǥ
GROUP BY �л�ID
HAVING AVG(����) IS NOT NULL 
ORDER BY �л�ID ASC ;

