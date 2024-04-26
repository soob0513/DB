-- CHAPTER 08. �������� --

-- [����������?]
--> SQL���� �����ϴµ� �ʿ��� �����͸� �߰��� ��ȸ�ϱ� ���ؼ�
-- SQL ���ο��� ����ϴ� SELECT ���� �ǹ��Ѵ�.
-- ���������� �������� �ȿ� ���Ե� �������� �����̴�.

-- �������� : ���������� ������� ����Ͽ� ����� �����ϴ� ����
-- �������� : ���������� ���ǽĿ� ���� ���� �ǹ�


-- �ǽ�) ���� ���̺��� Jack�� �޿����� ���� ������ �̸��� �޿��� ���
    -- 1. ���̺��� ���� Ȯ��
SELECT * FROM EMPLOYEES ;
    -- 2. ������ ������ �Ǵ� Jack�� �޿� ���� Ȯ��
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES 
 WHERE FIRST_NAME = 'Jack' ;
    -- 3. 2���� ������� ������ �������� ���� ����� ���
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY < (SELECT SALARY
                   FROM EMPLOYEES 
                  WHERE FIRST_NAME = 'Jack');

-- ���� ���̺��� JAMES�� �޿����� ���� ������ �̸��� �޿� ������ ��ȸ
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY < (SELECT SALARY
                   FROM EMPLOYEES
                  WHERE FIRST_NAME = 'James');
        --> ���� �߻�
-- James�� �޿� ������ Ȯ��          
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES 
 WHERE FIRST_NAME = 'James' ;  --> James��� ����� �� ���̴�
 


-- [���������� Ư¡]
  -- 1. ���������� �����ڿ� ���� �� �Ǵ� ��ȸ ����� �����ʿ� ���̸� ()�� ��� ����Ѵ�.
  -- 2. ���������� SELECT���� ����� �÷��� ���������� �� ���� ���� �ڷ����� ������ �����ؾ��Ѵ�.
  -- 3. ���������� �ִ� SELECT ���� ��� �� ���� �Բ� ����ϴ� ���������� ������ ������ ȣȯ �����ؾ� �Ѵ�.
  --   ��, �� �ϳ��� �����ͷθ� ���� ������ �����ڶ�� ���������� ��� �� ���� �ϳ����� �Ѵ�.
  -- �����ڿ� �Բ� ��ȣ �ۿ��ϴ� ��Ŀ� ���� ���� �� ���������� ���� �� ���������� ������.

-- ���� �� �������� ��?
  --> ���� ����� �� �ϳ��� ������ ������ ���������� ���Ѵ�.
  --> =, >, >=, <, <=, !=, <>, ^=

-- �ǽ�) ���� ���̺��� NANCY���� ���� �Ի��� ������ �̸��� �Ի��� ��ȸ
-- 1. Nancy�� �Ի� ��¥ ������ Ȯ�� (��������)
SELECT FIRST_NAME, HIRE_DATE 
  FROM EMPLOYEES 
 WHERE FIRST_NAME = 'Nancy';  --> 2002/08/17
-- 2. 1���� ����� ������ ���������� ������ �Է�
SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES 
 WHERE HIRE_DATE < (SELECT HIRE_DATE
                      FROM EMPLOYEES
                     WHERE FIRST_NAME = 'Nancy') ;

-- �ǽ�) ���� ���̺��� ��� �޿����� ���� �޿��� �޴� ������ �̸��� �޿� ������ ��ȸ
SELECT AVG(SALARY) FROM EMPLOYEES ; --6461.8

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY > (SELECT AVG(SALARY)
                   FROM EMPLOYEES);




-- [���� �� �������� ��?]
  --> ���� ��� ���� ���� ���� ������ ���������� ���Ѵ�,
  --> ���� �� �����ڴ� ����� �� ���� ���� �� �����ڸ� ����ؾ� �Ѵ�.

-- [���� �� �������� ����]
  -- IN : ���������� �����Ͱ� ���������� ��� �� �ϳ��� ��ġ�ϴ� �����Ͱ� ������ TRUE���� ��ȯ
        --> IN (��������)
  -- ANY, SOME  : ���������� ���ǽ��� �����ϴ� ���������� ����� �ϳ� �̻��̸� TRUE ���� ��ȯ
        --> �񱳿����� ANY (��������)
  -- ALL : ���������� ���ǽ��� ���������� ��� ��ΰ� �����ϸ� TRUE
        --> �񱳿����� ALL (��������)
  -- EXISTS : ���� ���� ��� ���� '����'�ϴ��� ���θ� Ȯ���Ѵ�(��, ��µ� ���� �ϳ� �̻��̸� TRUE)
        --> EXISTS (��������)


-- �ǽ�) �� �μ��� �ְ� �޿��� ������ �޿��� �޴� �������� ������ ���(�μ�ID, FIRST_NAME, SALARY)
-- IN �����ڸ� �̿�
-- 1. �μ��� �ְ� �޿��� ����
SELECT DEPARTMENT_ID, MAX(SALARY)
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID ;

-- 2. ���������� �̿��ؼ� ����� ���
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES 
 WHERE SALARY IN (SELECT MAX(SALARY)
                    FROM EMPLOYEES
                  GROUP BY DEPARTMENT_ID);
    --> �μ��� �ְ� �޿��� ���� �޿��� ������ ��� �������� ������ ���
    

-- ANY ������ ���
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES 
 WHERE SALARY = ANY  (SELECT MAX(SALARY)
                    FROM EMPLOYEES
                  GROUP BY DEPARTMENT_ID);
        --> IN �����ڿ� ���� ������� ���, ���������� IN �����ڸ� ���� ����Ѵ�.
        --> ���ǿ� �����ϴ� ����� �ϳ��� ���̸� ���� ��ȯ�Ѵ�.
   
-- �ǽ�) �μ��� �ְ� �޿����� ���� �޿��� �޴� �������� ���
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY > ANY (SELECT MAX(SALARY)
                      FROM EMPLOYEES
                      GROUP BY DEPARTMENT_ID);
        --> �μ��� �ְ� �޿��� �ϳ��� ���̸� ���� ������� ��ȯ
        --> ���� �� � �ϳ��� ������ ���������� ���� ū ���� ������ ��� ���� ��µȴ�
        --> ��, �μ��� �ּ� �޿����� ���� ������ ���� ��µȴ�.
        

-- ALL ������ ���
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES 
 WHERE SALARY >= ALL (SELECT MAX(SALARY)
                    FROM EMPLOYEES
                    GROUP BY DEPARTMENT_ID);
    -- ���������� ���������� ��� ������� �����ؾ���
    -- ���������� ����� �� ���� ū ���� �񱳸� �ؼ� ũ�ų� ���� ���� ���� �����͸� ���
    -- �ִ밪���� ū ���� ���ϰڴ�


-- EXISTS ������ : ���� ���θ� Ȯ���Ѵ�.
-- �ǽ�) �μ�ID�� �������� Ȯ��
SELECT DEPARTMENT_ID, COUNT(*)
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID ;

-- ���������� ������� �����ϴ� ���
SELECT FIRST_NAME, DEPARTMENT_ID
  FROM EMPLOYEES 
 WHERE EXISTS (SELECT FIRST_NAME
                FROM EMPLOYEES
                WHERE DEPARTMENT_ID = 110 );
        --> �������� ����� ����O => 107���� �� ���� ���

-- ���������� ������� �������� �ʴ� ���
SELECT FIRST_NAME, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE EXISTS (SELECT FIRST_NAME 
                FROM EMPLOYEES
                WHERE DEPARTMENT_ID = 120) ;
        --> �������� ����� ����X => ��� X
        

-- [���� �÷� ��������]
  --> ���������� ����� ���� �÷��� ��ȯ�Ǿ� ���������� ���ǰ� ���ÿ� �񱳵Ǵ� ���� �ǹ�
  --> �ַ� IN �����ڿ� �Բ� ���

-- �ǽ�) �� �μ��� �ְ� �޿��� ������ �޿��� �޴� ������ ���� (�μ�ID, FIRST_NAME, SALARY)
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE (DEPARTMENT_ID, SALARY) IN (SELECT DEPARTMENT_ID, MAX(SALARY)
                                     FROM EMPLOYEES 
                                   GROUP BY DEPARTMENT_ID);
        --> 2���� �÷��� ���ؼ� �ش� �μ����� �ְ� �޿��� �޴� ������ ��µǵ��� ���ѵ�
        


-- [�ζ��� ��(Inline View)]
  --> FROM������ ���� ���̺�ó�� ����ϴ� ��������
  --> �ζ��� �並 ����ϸ� ���� ������ ����� ��ġ ���̺�ó�� ��밡��
  --> �����ͺ��̽� SELECT ���� ��ü�ν� ������ ���̺�ó�� ����ϴ� VIEW�� �޸�
       -- �ζ��κ�� ���� ������ ��� ó���ȴ�

-- �ǽ�)
SELECT FIRST_NAME, DEPARTMENT_ID, SALARY
  FROM EMPLOYEES 
GROUP BY DEPARTMENT_ID ;

-- �ζ��� �並 ����ؼ� �μ����� �ְ� �޿��� �޴� ������ �̸�, �μ�ID, �μ��� �ְ� �޿�
SELECT E.FIRST_NAME, E.DEPARTMENT_ID, B."�μ��� �ְ� �޿�"
  FROM EMPLOYEES E, (SELECT DEPARTMENT_ID, MAX(SALARY) AS "�μ��� �ְ� �޿�"
                      FROM EMPLOYEES
                      GROUP BY DEPARTMENT_ID) B  -- �ζ��� ��� ���� ���� ���̺�
 WHERE E.DEPARTMENT_ID = B.DEPARTMENT_ID
   AND E.SALARY = B."�μ��� �ְ� �޿�" ; -- �μ�ID�� �����鼭 �޿��� �ְ� �޿��� ���� ��

-- ���� �÷� ���� �Ұ�
  --> ��Ī�� �־�߸� �÷��� �����ؼ� ��� ����




-- [��Į�� ���� ����(Scalar Subquery)]
  --> SELECT���� ���Ǵ� ��������
  --> �ϳ��� �÷��� ���� �ϳ��� �ุ ��ȯ�Ǵ� Ư¡�� ������ �ִ�.
  --> JOIN ���� JOINó�� ����ϰ��� �� �� ���
  
-- �ǽ�) �����̸�, �޿�, �μ�ID, �μ��̸��� ���
SELECT E.FIRST_NAME, E.SALARY, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
  FROM EMPLOYEES E JOIN DEPARTMENTS D 
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID) ;
            -- JOIN ��� -> NULL�� ����

-- ��Į�� �������� ��� (JOIN����)
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID, (SELECT DEPARTMENT_NAME
                                             FROM DEPARTMENTS 
                                            WHERE DEPARTMENT_ID = E.DEPARTMENT_ID) DEPARTMENT_NAME
  FROM EMPLOYEES E;
            -- ��Į�� �������� -> NULL���� ���ԵǾ� ��µȴ�  
            
