-- DCL (DATA CONTROL LANGUAGE)

-- [DCL�̶�?]
  --> DB�� �����ϰų� ��ü�� ������ �ִ� ���� ������ �ϴ� ���
  
-- [DCL ��ɾ� ����] 
  -- GRANT : ������ �ο��ϴ� ��ɾ�
  -- REVOKE : ������ ȸ���ϴ� ��ɾ�
  -- ROLL : ������ ��� �ο��� �� ����ϴ� ��ɾ�
  
-- GRANT CREATE SESSION TO DCL_TEST ;  

-- [����� ���� ���]
  -- CREATE USER     ����� �̸�
  -- IDENTIFIED BY   �н�����

-- [���� �ο�] 
  -- GRANT    �ý��۱���
  -- TO       USER ;

-- [���� ȸ��]
  -- REVOKE   �ý��۱���
  -- FROM     USER;

CREATE TABLE �׽�Ʈ (
       TEST NUMBER);
        --> ���� �߻� 
        --> ORA-01031: insufficient privileges
        --> ������ ������� �ʴ�!!



-- [��Ű��]
  -- DB�� ����Ǵ� ������ ������ �������� ���� ������ ����
  -- ���̺�, ��, �ε���, ������ ���� hr ������ ��� ��ü�� hr�� ��Ű��
  -- ��Ű���� �� �������� �����ϸ�, �̸��� ������ ����.
  -- ����Ŭ������ ��Ű���� ����ڸ� �������� �ʰ� ����Ѵ�.

  --> ��Ű��.���̺�.�÷�
SELECT * FROM HR.EMPLOYEES ;

-- GRANT SELECT, UPDATE ON HR.EMPLOYEES TO DCL_TEST ;
  
UPDATE HR.EMPLOYEES 
SET FIRST_NAME = 'SUBIN', LAST_NAME = 'CHOI'
WHERE EMPLOYEE_ID = 100 ;

COMMIT ;


