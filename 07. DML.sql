-- CHAPTER 07. DML (DATA MANIPULATION LANGUAGE) --

-- DML �̶�?
-- ������ ���۾�� ���̺��� �����͸� ��ȸ, �߰�, ����, ������ �� ����ϴ� ���Ǿ��̴�.
  --> ���̺��� ���ϴ� �����͸� �Է�, ����, �����Ѵ�.

-- DML ���� --> ���ξ���
-- SELECT : ������ ��ȸ
-- INSERT : ������ �߰�
-- UPDATE : ������ ����
-- DELETE : ������ ����

-- ����� 1)
-- INSERT INTO ���̺��(�÷�1, 2, ...)
-- VALUES (��...);
    --> INSERT�� �Է��� �÷��� VALUES�� �Է��� ���� ������ �ڷ����� ���ƾ� ��

-- ����� 2)
-- INSERT INTO ���̺��
-- VALUES (��...);
    --> INSERT�� �÷� ����Ʈ ���� �� VALUES�� �Է��� ���� ���̺��� �÷� ��, ������ �ڷ����� ���ƾ� ��


-- 1. ���� ������ �ֱ�
INSERT INTO LOGIN_JOIN (ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
VALUES ('SMHRD01', '12345', '�ּ���', SYSDATE, 26, '01096548342', 'SOOB0513@GMAIL.COM');

SELECT * FROM LOGIN_JOIN ;

-- 2. ģ���� ������ �ֱ� (��ȭ��ȣ�� �̸��� ������ NULL������ �Է�)
        --��������� NULL�� �ִ´�
            --> NULL�̶�� ���� �Է�
            --> '' ��� �Է�
INSERT INTO LOGIN_JOIN (ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
VALUES ('SMHRD02', '11111', '������', SYSDATE, 24, NULL, '');

SELECT * FROM LOGIN_JOIN ;

-- 3. ģ���� ������ �ֱ� (��ȭ��ȣ�� �̸��� ������ NILL������ �Է�)
        --�Ͻ������� NULL���� �ִ´�
            --> �÷���, ���� ���� ���� ����
INSERT INTO LOGIN_JOIN (ID, PW, NAME, JOIN_DATE, AGE)
VALUES ('SMHRD03', '22222', '������', SYSDATE, 26) ;




-----------------------------------------------------------------------------------------------
-- [���̺� ������ ���� ����Ʈ]

-- 1. �÷�����Ʈ�� �Է� ���� ������ �ٸ� ���
INSERT INTO SMHRD_JOIN (ID, PW, NAME, JOINDATE, AGE, TEL, EMAIL)
 VALUES ('ȣ�ξƺ�', '33333', '�ں���' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM', 'N');
 
--  SQL ����: ORA-00913: too many values 
--> �÷� ����Ʈ�� ������ �Է� �� ������ ��ġ�ؾ� �Ѵ�!

-- 2. �ĺ��ڿ� NULL�� �Է��� ���
INSERT INTO SMHRD_JOIN (ID, PW, NAME, JOINDATE, AGE, TEL, EMAIL)
 VALUES (NULL, '33333', '�ں���' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01400: cannot insert NULL into ("HR"."SMHRD_JOIN"."ID")
--> �÷��� ���� �������ǿ� �°� �ۼ� �ؾ��� (�ĺ��ڴ� NOT NULL + UNIQUE �ߺ��Ұ�)

-- 3. NOT NULL�� �÷��� NULL�� ���� ���
INSERT INTO SMHRD_JOIN (ID, PW, NAME, JOINDATE, AGE, TEL, EMAIL)
 VALUES ('ȣ�ξƺ�', '33333', NULL , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01400: cannot insert NULL into ("HR"."SMHRD_JOIN"."NAME")
--> �÷��� ���� �������ǿ� �°� �ۼ� �ؾ��� ( NOT NULL ���� )

-- 4. �ڷ����� ���� �ʰ� �Է� ���� ���� ���
INSERT INTO SMHRD_JOIN (ID, PW, NAME, JOINDATE, AGE, TEL, EMAIL)
 VALUES ('ȣ�ξƺ�', '33333', '�ں���' , SYSDATE, '29��', '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01722: invalid number
--> �÷��� ���� �ڷ����� �°� �ۼ��� �Ǿ� �Ѵ�. (AGE�� ������ �ڷ���)

-- 5. �ĺ��� �÷��� �ߺ� ���� �������� ���
INSERT INTO SMHRD_JOIN (ID, PW, NAME, JOINDATE, AGE, TEL, EMAIL)
 VALUES ('ȣ�ξƺ�', '33333', '�ں���' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');
 
-- unique constraint (HR.SYS_C007110) violated
--> ���� �� ���¿��� �ѹ��� ������ �Ǹ� �ĺ��ڰ� ���� �ߺ��� �Ǽ� ������ ��

------------------------------------------------------------------------------------------------


-- �÷�����Ʈ�� ���� �ʰ� INSERT �ϴ� ���
INSERT INTO LOGIN_JOIN
VALUES ('SMHRD04', '33333', '�����', SYSDATE, 25, '01033333333', 'SALLY@NAVER.COM');

SELECT * FROM LOGIN_JOIN ;


-- INSERT �ǽ� -- SONGLIST ���̺� �����
CREATE TABLE DREAM_SONGLIST (
    NUM NUMBER(3) PRIMARY KEY,
    TITLE VARCHAR2(20) NOT NULL,
    SINGER VARCHAR2(20),
    GENDER VARCHAR2(10) CHECK((GENDER ='����') OR (GENDER = '����'))
    );

INSERT INTO DREAM_SONGLIST (NUM, TITLE, SINGER, GENDER)
VALUES ('01', 'DEJA VU', 'DREAMCATCHER', '����');

INSERT INTO DREAM_SONGLIST
VALUES ('02', 'RUN FOR ROSES', 'NMIXX', '����');

INSERT INTO DREAM_SONGLIST
VALUES ('03', 'MARCH', 'SEVENTEEN', '����');





-- UPDATE : ���̺��� �����͸� �����ϰ� ���� �� ���
-- UPDATE ���̺�� 
-- SET �������÷� = ������, ...
-- WHERE �����ʹ� ������ ��� ���� �����ϱ� ���� ���� ;
    --> ** WHERE �������� ������ ��� ���̺� �� ����� ��� �÷��� �����Ͱ� ������ �ȴ�.
    
SELECT * FROM LOGIN_JOIN ;

UPDATE LOGIN_JOIN
SET AGE = 27
WHERE NAME = '������' ;

-- �ǽ�) �̸��� ������ ���� ģ�� ĭ�� ���� ä�� �ֱ�
UPDATE LOGIN_JOIN
SET EMAIL = 'HYEBIN@NAVER.COM', TEL = '01055555555'
WHERE NAME = '������' ;

-- ������ PK�� �������ִ� ���� ���� �ùٸ� ����̴�!



-- DELETE : �����͸� ������ �� ����ϴ� ��ɾ�
-- DELETE FROM ���̺�� ;
-- WHERE ������ ��� ���� �����ϱ� ���� ���ǽ� ;
    --> ** WHERE �������� ������ ��� ���̺��� ��� �����Ͱ� �����ȴ�!

-- 25�� ������ ȸ������ ������ ����
DELETE FROM LOGIN_JOIN 
WHERE AGE <= 24 ;

SELECT * FROM LOGIN_JOIN ;


