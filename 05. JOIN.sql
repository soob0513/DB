-- CHAPTER 05. JOIN --

-- [JOIN] : ���� ���̺��� �ʿ��� �����͸� �ѹ��� �������� ���

-- �� ���� (NON EQUI JOIN) 
    --> �� ���� ���̺� ���� ���� ��Ȯ�ϰ� ��ġ���� �ʴ� ��� Ȱ���ϴ� ����
    --> � ������(=)�� �ƴ� �����ڵ��� ����� ������ �ǹ�(>, >=, <=, <, BETWEEN)
    
    
-- � ���� (EQUI JOIN)
    --> �� ���� ���̺� ���� ���� ��Ȯ�ϰ� ��ġ�ϴ� ��� Ȱ���ϴ� ����
    --> � �����ڸ� ����ؼ� ������ �ǹ�(=)
    --> ���� ���� ���Ǵ� ������ ����
    
-- � ������ �����
-- SELECT ���̺�1.�÷���, ���̺�2.�÷���    ->��� ���̺� �ִ� �÷����� ����ؼ� ����ϰڴ�(��μ���)
--   FROM ���̺�1, ���̺�2                -> ���̺�1�� ���̺�2�� �����ϰڴ�!
--  WHERE ���̺�1.�÷��� = ���̺�2.�÷���   -> JOIN ������ �����ִ� ��

-- �ǽ�)������ ���� ���̺�� ����ǥ ���̺��� �л�ID, �̸�, ����, ���� ������ ���
    -- 1. ������ ��� ���̺��� ���� Ȯ��
SELECT * FROM ���������� ;
SELECT * FROM ����ǥ ;
    -- 2. FROM���� ������ ���̺��� ',(�޸�)' �������� �ۼ�
    -- 3. ���� ������ �Ǵ� Ư�� �÷��� Ȯ��, WHERE �������� ���� ������ �ۼ�(WHERE)
         --> ���� ������ �Ǵ� Ư�� �÷� : ������ ���̺� ���� ���� ������� ������ �÷�
    -- 4. SELECT ���� �ش�Ǵ� �÷��� '.(���)'�� �����Ͽ� �ۼ� (SELECT)
SELECT ����������.�л�ID, ����������.�л��̸�, ����ǥ.����, ����ǥ.����
  FROM ����ǥ, ����������
 WHERE ����������.�л�ID = ����ǥ.�л�ID ;

-- ����ID�� ������ FIRST_NAME, DEPARTMENT_NAME ������ ���
   -- 1. ������ ��� ���̺��� ������ Ȯ��
   -- 2. FROM���� ������ ���̺��� ,(�޸�)�� �������� �ۼ�
   -- 3. WHERE������ ���� ������ �Ǵ� Ư�� �÷��� Ȯ���ϸ�, ���� ������ �ۼ�
       --> ���� ������ �Ǵ� Ư�� �÷� : ������ ���̺� ���� ���� �����(�ǹ�)�� ������ �÷�
   -- 4. SELECT���� ����ϰ��� �ϴ� �÷��� �ۼ�
SELECT * FROM EMPLOYEES ;
SELECT * FROM DEPARTMENTS ;

SELECT EMPLOYEES.EMPLOYEE_ID, EMPLOYEES.FIRST_NAME
     , DEPARTMENTS.DEPARTMENT_NAME
  FROM EMPLOYEES, DEPARTMENTS
 WHERE EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID ;
 
-- ��Ī ���
-- ���� ���̺��� ��Ī�� E��, �μ� ���̺��� ��Ī�� D��
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, D.DEPARTMENT_NAME
  FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID ;

SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_NAME
  FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID ;
--> �ܵ����� �����ϴ� �÷��� SELECT���� .(���)�� �� ��� DB�� ��θ� ã�� ������ش�.
-- ���� ���� �÷��� ��κ� PK�� FK ����� �̷������. 
    -- ������ ���� �׷� ���� �ƴϴ�

-- �ǽ�) ����ID�� 100�� ������ FIRST_NAME�� �μ��̸��� ���
   -- ���� ���̺��� ��Ī�� E��, �μ� ���̺��� ��Ī�� D�� �ۼ�
SELECT FIRST_NAME, DEPARTMENT_NAME
  FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID 
       AND E.EMPLOYEE_ID = 100;





-- ANSI ���� ���� : �̱�ǥ����ȸ���� ���� ��� DBMS���� ��밡���� �����̴�.

-- INNER JOIN : ���������̶�� �ϸ� ���� ���ǿ��� ������ ���� �ִ� �ุ ��ȯ
     --> INNER�� ������ �����ϴ� 
     --> NULL���� ������� �ʴ´�
  -- INNER JOIN�� ��� ���
  -- 3. SELECT ��ȸ�� �÷� ��, ...
  -- 1.   FROM ���̺�1 INNER JOIN ���̺�2
  --        ON (���̺�1.�÷��� = ���̺�2.�÷���)  --> ��������
  -- 2.  WHERE �Ϲ� ������       --> �� �� �ٸ� �Ϲ� ����

-- ����) ���� ���̺��� ����ID�� �μ�ID,
--      �μ� ���̺� �ִ� �μ� �̸��� ��� (INNER JOIN)
SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
  FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID) ;




-- CROSS JOIN : ���� �������� ���� �ʰ� ���̺��� ��� �����͸� ������ ���� ���
   --> ���� ������ ���� ��� ���� �� �ִ� "��� �������� ����"�� ��ȸ
   --> īƼ�� ��(Cartesian Product)�̶�� �θ���
-- CROSS JOIN �����
-- SELECT  ��ȸ�� �÷���
--   FROM  ���̺�1 CROSS JOIN ���̺�2 ;
    --> ON ���� �������� ������ CROSS JOIN�̴�!

-- ����) ���� ���̺��� ����ID�� �μ�ID
--      �μ� ���̺��� �μ� �̸��� ���(CROSS JOIN)
SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
  FROM EMPLOYEES E CROSS JOIN DEPARTMENTS D ;




-- OUTER JOIN : �ܺ������̶�� �ϸ�, �� ���� ���̺� ���� �������� ��ȸ�ϰ�,
-- ���� ���̺��� �ִ� �����͵� ���Խ��Ѽ� ��ȸ�ϰ� ���� �� ����ϴ� ���� ����
    --> ���� �������� NULL ���� ����ϰ� ���� �� ����Ѵ�

-- LEFT OUTER JOIN : ���� ���̺��� �������� NULL���� �����ϰ� ���� �� ���
    --> ����Ŭ ���� ���� �� : ���� �������� �ݴ��� ������ �÷��� (+) ��ȣ�� �ۼ�

-- RIGHT OUTER JOIN : ������ ���̺��� �������� NULL���� �����Ͽ� ���
    --> ����Ŭ ���� ���� �� : ���� �������� �ݴ��� ���� �÷��� (+) ��ȣ�� �ۼ�

-- FULL OUTER JOIN : ���ʿ� NULL���� �����Ͽ� ���
    --> ����Ŭ ���������� ������ ���� ����, UNION �����ڸ� �̿��� ����ϴ� ����� �ִ�.


-- ����) �� �μ��� �Ŵ��� �������� �μ��̸�, �Ŵ���ID, ������ FIRST_NAME�� ��� (INNER JOIN)
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D INNER JOIN EMPLOYEES E 
     ON (D.MANAGER_ID = E.EMPLOYEE_ID) ;

-- ����2)LEFT OUTER JOIN�� Ȱ����
--    �� �μ��� �Ŵ��� �������� �μ��̸�, �Ŵ���ID, ������ FIRST_NAME�� ���
    -- ANSI ǥ�ع��� (OUTER�� ���� ����)
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID) ;

    -- ����Ŭ ���� --> ���� �������� �ݴ��� ������ �÷��� (+) ��ȣ�� �ۼ�
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D, EMPLOYEES E
 WHERE D.MANAGER_ ID = E.EMPLOYEE_ID(+) ;
 
-- ����3) LEFT OUTER JOIN�� Ȱ����
--  �� �μ��� �Ŵ��� �������� �μ��̸�, �Ŵ���ID, ������ FIRST_NAME�� ���

-->  ANSI ǥ�ع��� (OUTER�� ���� ����)
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D RIGHT OUTER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID) ;

--> ����Ŭ ���� --> ���� �������� �ݴ��� ���� �÷��� (+) ��ȣ�� �ۼ�
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D, EMPLOYEES E
 WHERE D.MANAGER_ID(+) = E.EMPLOYEE_ID ;
 
 
-- ����4) FULL OUTER JOIN�� Ȱ���� 
--  �� �μ��� �Ŵ��� �������� �μ��̸�, �Ŵ���ID, ������ FIRST_NAME�� ���

    -->  ANSI ǥ�ع��� (OUTER�� ���� ����)
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM DEPARTMENTS D FULL OUTER JOIN EMPLOYEES E
    ON (D.MANAGER_ID = E.EMPLOYEE_ID) ;



-- <3�� �̻� ���̺� ���� �����>
    -- ANSI ǥ�� ����
    -- SELECT ���̺�.�÷���, ���̺�2.�÷���, ....
    --   FROM ���̺�1 JOIN ���̺�2
    --       ON (���� ���ǽ�) JOIN ���̺�3
    --       ON (���� ���ǽ�) ;

    -- ����Ŭ ����
    -- SELECT ���̺�1.�÷���, ���̺�2.�÷���, .....
    --   FROM ���̺�1, ���̺�2, ���̺�3
    --  WHERE ���̺�1.�÷��� = ���̺�2.�÷���
    --       AND ���̺�2.�÷��� = ���̺�3.�÷��� ;

-- ����) �μ����̺�, ��ġ���̺�, �������̺��� �����Ͽ�
--      �μ��� �̸��� ����, ���� �̸��� ���
SELECT D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME
  FROM DEPARTMENTS D JOIN LOCATIONS L
       ON (D.LOCATION_ID = L.LOCATION_ID) 
       JOIN COUNTRIES C
       ON (L.COUNTRY_ID = C.COUNTRY_ID) ;

SELECT D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME
  FROM DEPARTMENTS D, LOCATIONS L, COUNTRIES C
 WHERE D.LOCATION_ID = L.LOCATION_ID
      AND L.COUNTRY_ID = C.COUNTRY_ID ;


