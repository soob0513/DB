-- CHAPTER 01. SELECT -- 

-- �ּ� ��ȣ

-- ���� ũ�� ���� : ���� > ȯ�漳�� > �ڵ������� > �۲�
-- �ּ� ���� ���� : ���� > ȯ�漳�� > �ڵ������� > PL/SQL �ּ�

-- �ּ� ����(2����) : /**/   --> ���� ���� �ѹ��� �ּ�ó���� �� ���
/*
1. SQL ������ ��ҹ��ڸ� �������� �ʴ´�!
2. ���⳪ �ٹٲ� ���� ��ɾ� ���࿡ ������ ���� �ʴ´�.
3. SQL ���� ������ �ݵ�� �����ݷ�(;)�� ������ �Ѵ�!!!
4. SQL ���� ����Ű : Ctrl + Enter, F9
*/

DESC EMPLOYEES ;
-- DESC(DESCRIBE) : SQL���� ���Ǵ� ���̺��� ������ Ȯ���� �� ����ϴ� ��ɾ�


SELECT FIRST_NAME, LAST_NAME
  FROM EMPLOYEES ;

SELECT COUNTRY_NAME, REGION_ID  FROM COUNTRIES ;

-- [SELECT�� �⺻ ��� ���]
-- 2. SELECT ��ȸ�� �÷���1, ....
-- 1. FROM ��ȸ�� ���̺��


-- ��ü �����͸� ��ȸ�ϴ� ���
-- * (�ƽ�Ÿ����ũ) --> ��ü�� �ǹ�

-- ���� ���̺��� ��ü ������ ���
SELECT *
  FROM EMPLOYEES ;
  
-- �ǽ�1) �μ����̺��� ��ü ������ ���
SELECT *
  FROM DEPARTMENTS ;
  
-- �ǽ�2) ���� ���̺��� ����ID, FIRST_NAME, EMAIL ������ ���
SELECT * FROM EMPLOYEES ;  --> �������̺� �ִ� ��� ���� ��ȸ -- ������
SELECT EMPLOYEE_ID , FIRST_NAME , EMAIL
  FROM EMPLOYEES ;
  
-- �ǽ�3) �μ����̺��� �μ�ID, �μ���, LOCATION_ID �� ���
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID 
  FROM DEPARTMENTS ;

-- �ǽ�4) ���� ���̺��� EMAIL, EMPLOYEE ID, JOB ID, LAST NAME�� ������� ���
SELECT EMAIL, EMPLOYEE_ID, JOB_ID, LAST_NAME
  FROM EMPLOYEES ;
  
-- �ǽ�5) �������̺��� �������� �μ�id�� ���
SELECT * FROM EMPLOYEES ;

SELECT DEPARTMENT_ID
  FROM EMPLOYEES ;
  
--DISTINCT : ������ �ߺ� ����

--SELECT ��DISTINCT�� ��ȸ�ϰ� ���� �÷��� 1, 2, 3, ...
-- FROM ���̺�

-- �������� �μ� ID�� �ߺ� �����Ͽ� ���
SELECT DISTINCT DEPARTMENT_ID 
  FROM EMPLOYEES ;

-- �ǽ� 6) �������̺��� JOB_ID�� �μ� ID�� �ߺ��� �����Ͽ� ���
SELECT DISTINCT JOB_ID, DEPARTMENT_ID
  FROM EMPLOYEES ;

-- DISTINCT �ߺ� ���Ŵ� �ڿ� 2�� �̻��� �÷��� ������
-- ���� �÷��� �ߺ��� �־ �ٸ� �� �÷��� ���� �ٸ��� '�ٸ���' ����Ѵ�. 

-- �ǽ� 1) �������̺��� �Ի����� ��� �� ���� ���� Ȯ�� ��, �ּ����� ���� ������ �Է�
SELECT HIRE_DATE
  FROM EMPLOYEES ;
-- ���� ���� : 107��

-- �ǽ� 2) �������̺��� �Ի����� ���. ��, �ߺ��� �����ؼ� �ּ����� ���� ������ �Է�
SELECT DISTINCT HIRE_DATE
  FROM EMPLOYEES ;
-- ���� ���� : 98��


--TIP!!!
--�÷��� ���ڿ����� �����ϴ�(+, -, *, /)!

SELECT '�ȳ��ϼ���'  --��������ǥ('')�� ���ڿ��� �ν���. (""�� �ȵ�)
  FROM EMPLOYEES ;

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES ;

-- ����) �������̺��� ������ �̸��� �޿�, ������ ���
SELECT FIRST_NAME, SALARY, SALARY*12
  FROM EMPLOYEES ;

-- ��Ī ����ϱ�
-- Alias ��� �ϸ� �Ѵ��� ���� ���� �����ϴ� ���� ����
-- AS Ű���带 ����ؼ� ��Ī�� �����մϴ�.
SELECT FIRST_NAME
      , SALARY
      , SALARY*12  AS "����"   --��Ī�� ���ڿ��� ū����ǥ("")��
  FROM EMPLOYEES ;

-- ��Ī ��� ���
-- 1. SELECT �÷��� ��Ī
-- 2. SELECT �÷��� "��Ī"
-- 3. SELECT �÷��� AS ��Ī
-- 4. SELECT �÷��� AS "��Ī"

-- �ǽ�) ������ �̿��ؼ� �������̺��� �Ի���, �Ի��� �������� ���
-- ��, �Ի����� ��Ī�� �Ի��Ϸ�, �Ի��� �������� "�Ի��ϴ�����" ��Ī�� ����ؼ� ���
SELECT HIRE_DATE �Ի���
      ,HIRE_DATE +1 �Ի��ϴ�����  --���� �ϰ������ ""���� �����
  FROM EMPLOYEES ; 
  
SELECT HIRE_DATE "�Ի���"
      ,HIRE_DATE+1 "�Ի��� ������"
  FROM EMPLOYEES ;
  
SELECT HIRE_DATE AS �Ի���
      ,HIRE_DATE+1 AS �Ի��ϴ�����
  FROM EMPLOYEES ;

SELECT HIRE_DATE AS "�Ի���" 
      ,HIRE_DATE+1 AS "�Ի��ϴ�����"
  FROM EMPLOYEES ;


-- ORDER BY���̶�?
-- Ư�� �÷��� �������� ���ĵ� ���·� ����ϰ��� �� �� ����Ѵ�.
-- SQL ���� �������� ���� �������� ����ȴ�.
-- ����, ������ ���� ����� �������� ������ �⺻������ ���������� ����ȴ�.

-- ASC (Ascending) : �������� ���� (1, 2, 3, ...)
-- DESC (Descending) : �������� ���� (10, 9, 8, ...)

-- �������̺��� ��� ������ ������ ���. 
-- �޿��� ������������ ����
SELECT *
  FROM EMPLOYEES 
ORDER BY SALARY ASC ;  --OREDR BY SALARY ; �� ����

-- �ǽ�) �ֱٿ� �Ի��� ��¥�� �������� ������ �̸��� �Ի糯¥�� ���
SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES 
ORDER BY HIRE_DATE DESC ;

-- �ǽ�) �������̺��� ����ID, �μ�ID, �̸�, �޿� ������ ���
-- ��, �μ�ID�� ������������, �޿��� ������������ �����ؼ� ���
SELECT EMPLOYEE_ID, DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES 
ORDER BY DEPARTMENT_ID ASC, SALARY DESC ;
-- ���� �μ����� �ٹ��ϰ� �ִ� �����鳢�� �޿��� ���� ������ ���
-- ���� �μ�ID�� ������������ ������ �Ŀ� �޿��� ������������ ������ ��


-- NULL ���̶�?
-- NULL���̶� �������� ���� ������ ��� �ִ� ���¸� �ǹ�
-- ���� �������� �ʰų� �������� ���� ���� �ǹ��մϴ�.
-- ���� 0�� ���ڿ� " "�� NULL���� �ƴմϴ�.
-- �ڡڡ� NULL�� ������ �ϸ� ������� ������ NULL���� ���´�!

-- �ǽ�) �������̺��� ����ID, ���ʽ�, ���ʽ��ι��� ������ ���
-- ��, ���ʽ� �� ���� ������ UP_BONUS�� ��Ī�� ����ؼ� ���
SELECT EMPLOYEE_ID, COMMISSION_PCT, COMMISSION_PCT*2 AS "UP_BONUS"
  FROM EMPLOYEES ;

