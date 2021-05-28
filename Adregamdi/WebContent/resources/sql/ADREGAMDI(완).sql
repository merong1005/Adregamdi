-- ADREGAMDI --

-- 1. ȸ������ --

-- (1) ���̺� ���� --
DROP TABLE USER_INFO PURGE;
CREATE TABLE USER_INFO
(
    USER_NO       NUMBER          CONSTRAINT USER_INFO_PK PRIMARY KEY, 
    USER_NAME     VARCHAR2(15), 
    USER_ID       VARCHAR2(50)    UNIQUE, 
    USER_PW       VARCHAR2(100), 
    USER_EMAIL    VARCHAR2(50)    NOT NULL, 
    USER_PHONE    VARCHAR2(15)    NOT NULL, 
    USER_PROVIDER NUMBER          NOT NULL
);

-- (2) ������ ���� --
DROP TABLE USER_INFO_SEQ;
CREATE SEQUENCE USER_INFO_SEQ
START WITH 1
INCREMENT BY 1;

-- (3) Ư�̻��� --

-- ȸ��Ż�� ���� �ݵ�� �ʿ��� ������

-- �ܷ�Ű �÷� ����
ALTER TABLE [�� �Խ��� ���̺�] DROP CONSTRAINT [�ܷ�Ű �̸�];

-- ON DELETE CASCADE �� ������ �ܷ�Ű �����
ALTER TABLE [�� �Խ��� ���̺�] ADD CONSTRAINT [�ܷ�Ű �̸�] FOREIGN KEY ([�ܷ�Ű �ڽ� �÷�])
REFERENCES USER_INFO(user_no) ON DELETE CASCADE;

-- PROVIDER(0) : ������(ADMINISTRATOR)

-- 2. �������� --

-- (1) ���̺� ���� --
DROP TABLE NOTICE PURGE;
CREATE TABLE NOTICE(
    NOTICE_NO        NUMBER           CONSTRAINT NOTICE_PK PRIMARY KEY, 
    NOTICE_USER_NO   NUMBER           CONSTRAINT NOTICE_FK REFERENCES USER_INFO(USER_NO),
    NOTICE_TITLE     VARCHAR2(100)    NOT NULL, 
    NOTICE_CNT       NUMBER           NOT NULL, 
    NOTICE_DATE      DATE             NOT NULL, 
    NOTICE_CONTENT   VARCHAR2(4000)   NOT NULL
);

-- (2) ������ ���� --
DROP TABLE NOTICE_SEQ;
CREATE SEQUENCE NOTICE_SEQ
START WITH 1
INCREMENT BY 1;


-- ON DELETE CASCADE (���� ����)
ALTER TABLE notice DROP CONSTRAINT notice_fk;

ALTER TABLE notice ADD CONSTRAINT notice_fk FOREIGN KEY (notice_user_no)
REFERENCES USER_INFO(user_no) ON DELETE CASCADE;


-- 3. �����Խ��� --

-- (1) ���̺� ���� --

-- FREEDOMBOARD
DROP TABLE FREEDOMBOARD PURGE;
CREATE TABLE FREEDOMBOARD (
    FREE_NO        NUMBER            CONSTRAINT FREEDOMBOARD_PK PRIMARY KEY,
    FREE_WRITER    NUMBER            CONSTRAINT FREEDOMBOARD_FK REFERENCES USER_INFO(USER_NO),
    FREE_TITLE     VARCHAR2(300)     NOT NULL,
    FREE_CNT       NUMBER            NOT NULL,
    FREE_DATE      DATE              NOT NULL,
    FREE_CONTENT   VARCHAR2(4000)    NOT NULL
);

-- ON DELETE CASCADE (���� ����)
ALTER TABLE FREEDOMBOARD DROP CONSTRAINT FREEDOMBOARD_FK;

ALTER TABLE FREEDOMBOARD ADD CONSTRAINT FREEDOMBOARD_FK FOREIGN KEY (free_writer)
REFERENCES USER_INFO(user_no) ON DELETE CASCADE;

-- FREEDOMREPLY
DROP TABLE FREEDOMREPLY PURGE;
CREATE TABLE FREEDOMREPLY (
    REPLY_NUM       NUMBER           CONSTRAINT FREEDOMREPLY_PK PRIMARY KEY,
    FREEDOM_NUM     NUMBER           CONSTRAINT FREEDOMREPLY_FK REFERENCES FREEDOMBOARD(FREE_NO),
    REPLY_WRITER    VARCHAR2(100)    NOT NULL,
    REPLY_CONTENT   VARCHAR2(1000)   NOT NULL,
    REPLY_DATE      DATE             NOT NULL
);

-- ON DELETE CASCADE (���� ����)
ALTER TABLE FREEDOMBOARD DROP CONSTRAINT FREEDOMBOARD_FK;

ALTER TABLE FREEDOMBOARD ADD CONSTRAINT FREEDOMBOARD_FK FOREIGN KEY (free_writer)
REFERENCES USER_INFO(user_no) ON DELETE CASCADE;

-- (2) ������ ���� --

DROP TABLE FREEDOM_REPLY_SEQ;
CREATE SEQUENCE FREEDOM_REPLY_SEQ
START WITH 1
INCREMENT BY 1;

DROP TABLE CONTENT_CNT_SEQ;
CREATE SEQUENCE CONTENT_CNT_SEQ
START WITH 1
INCREMENT BY 1;


-- 4. ������ --

-- (1) ���̺� ���� --

-- SPOT_INFO
DROP TABLE SPOT_INFO PURGE;

CREATE TABLE SPOT_INFO (
    LIKE_IDX     NUMBER         CONSTRAINT LIKE_PK PRIMARY KEY,
    CONTENT_ID   VARCHAR2(10)   NOT NULL,
    LIKE_CNT     NUMBER,
    REVIEW_CNT   NUMBER
);


-- 데이터 입력 --

SELECT * FROM SPOT_INFO;


UPDATE SPOT_INFO SET LIKE_CNT = 25 WHERE CONTENT_ID = '322836';
UPDATE SPOT_INFO SET LIKE_CNT = 85 WHERE CONTENT_ID = '127813';
UPDATE SPOT_INFO SET LIKE_CNT = 78 WHERE CONTENT_ID = '126438';
UPDATE SPOT_INFO SET LIKE_CNT = 70 WHERE CONTENT_ID = '126435';
UPDATE SPOT_INFO SET LIKE_CNT = 195 WHERE CONTENT_ID = '228854';
UPDATE SPOT_INFO SET LIKE_CNT = 854 WHERE CONTENT_ID = '126452';
UPDATE SPOT_INFO SET LIKE_CNT = 45 WHERE CONTENT_ID = '129617';
UPDATE SPOT_INFO SET LIKE_CNT = 748 WHERE CONTENT_ID = '141736';
UPDATE SPOT_INFO SET LIKE_CNT = 87 WHERE CONTENT_ID = '126439';
UPDATE SPOT_INFO SET LIKE_CNT = 755 WHERE CONTENT_ID = '667418';
UPDATE SPOT_INFO SET LIKE_CNT = 744 WHERE CONTENT_ID = '228853';
UPDATE SPOT_INFO SET LIKE_CNT = 78 WHERE CONTENT_ID = '126471';
UPDATE SPOT_INFO SET LIKE_CNT = 78 WHERE CONTENT_ID = '127490';
UPDATE SPOT_INFO SET LIKE_CNT = 7 WHERE CONTENT_ID = '127479';
UPDATE SPOT_INFO SET LIKE_CNT = 78 WHERE CONTENT_ID = '139008';
UPDATE SPOT_INFO SET LIKE_CNT = 74 WHERE CONTENT_ID = '126470';
UPDATE SPOT_INFO SET LIKE_CNT = 88 WHERE CONTENT_ID = '127635';
UPDATE SPOT_INFO SET LIKE_CNT = 77 WHERE CONTENT_ID = '142948';
UPDATE SPOT_INFO SET LIKE_CNT = 7 WHERE CONTENT_ID = '127336';
UPDATE SPOT_INFO SET LIKE_CNT = 123 WHERE CONTENT_ID = '127053';
UPDATE SPOT_INFO SET LIKE_CNT = 754 WHERE CONTENT_ID = '2444532';
UPDATE SPOT_INFO SET LIKE_CNT = 78 WHERE CONTENT_ID = '130474';
UPDATE SPOT_INFO SET LIKE_CNT = 54 WHERE CONTENT_ID = '128556';

commit; 

-- REVIEW_INFO
DROP TABLE REVIEW_INFO PURGE;
CREATE TABLE REVIEW_INFO (
    REVIEW_IDX       NUMBER          CONSTRAINT REVIEW_PK PRIMARY KEY,
    CONTENT_ID       VARCHAR2(10)    NOT NULL,
    USER_NO          NUMBER          CONSTRAINT REVIEW_FK2 REFERENCES USER_INFO(USER_NO),
    USER_ID        VARCHAR2(50)    NOT NULL,
    REVIEW_DATE      VARCHAR2(100)   NOT NULL,
    REVIEW_CONTENT   VARCHAR2(200)   NOT NULL
);

-- ON DELETE CASCADE (���� ����)
ALTER TABLE REVIEW_INFO DROP CONSTRAINT REVIEW_FK2;

ALTER TABLE REVIEW_INFO ADD CONSTRAINT REVIEW_FK2 FOREIGN KEY (USER_NO)
REFERENCES USER_INFO(user_no) ON DELETE CASCADE;

-- (2) ������ ���� --

DROP SEQUENCE SPOT_SEQ;
CREATE SEQUENCE SPOT_SEQ
START WITH 1
INCREMENT BY 1;

DROP SEQUENCE REVIEW_SEQ;
CREATE SEQUENCE REVIEW_SEQ
START WITH 1
INCREMENT BY 1;

SELECT * FROM REVIEW_INFO;

-- 5. ���� ���� ����� --

-- (1) ���̺� ���� --

-- PLAN
DROP TABLE PLAN PURGE;
CREATE TABLE PLAN (
    PLAN_NO        NUMBER           CONSTRAINT PLAN_PK PRIMARY KEY,
    USER_NO        NUMBER           CONSTRAINT PLAN_FK REFERENCES USER_INFO(USER_NO),
    PLAN_TITLE     VARCHAR2(200)    NOT NULL,
    PLAN_INFO      VARCHAR2(1000)   NOT NULL,
    PLAN_IMG       VARCHAR(300)     NOT NULL,
    PLAN_PRIVATE   VARCHAR(1)       DEFAULT 'N'
);


ALTER TABLE PLAN DROP CONSTRAINT PLAN_FK;

ALTER TABLE PLAN ADD CONSTRAINT PLAN_FK FOREIGN KEY (USER_NO)
REFERENCES USER_INFO(user_no) ON DELETE CASCADE;

-- PLAN_IMG
DROP TABLE PLAN_IMG PURGE;
CREATE TABLE PLAN_IMG (
    PLAN_NO    NUMBER          CONSTRAINT PLAN_IMG_FK REFERENCES PLAN(PLAN_NO),
    USER_NO    NUMBER          NOT NULL,
    PLAN_IMG   VARCHAR2(300)   NOT NULL,
    REGDATE    DATE            NOT NULL
);

ALTER TABLE PLAN_IMG DROP CONSTRAINT PLAN_IMG_FK;

ALTER TABLE PLAN_IMG ADD CONSTRAINT PLAN_IMG_FK FOREIGN KEY (PLAN_NO)
REFERENCES PLAN(PLAN_NO) ON DELETE CASCADE;

-- USER_PLAN
DROP TABLE USER_PLAN PURGE;
CREATE TABLE USER_PLAN (
    PLAN_NO          NUMBER           CONSTRAINT USER_PLAN_FK REFERENCES PLAN(PLAN_NO),
    USER_NO          NUMBER,
    TITLE            VARCHAR2(200),
    CONTENTID        VARCHAR2(10),
    CONTENTTYPEID    VARCHAR2(5),
    ADDR             VARCHAR2(200),
    IMG_SRC          VARCHAR2(300),
    MAPX             VARCHAR2(20),
    MAPY             VARCHAR2(20),
    PLANDATE         VARCHAR2(30),
    PLANDAY          VARCHAR2(30),
    PLANTOTALDATE    VARCHAR2(30),
    STARTDATE        VARCHAR2(20),
    ENDDATE          VARCHAR2(20),
    DESCRIPT         VARCHAR2(1000), 
    IS_INSERTAFTER   VARCHAR(1)       DEFAULT 'N',
    ISACC            VARCHAR(1)       DEFAULT 'N'
);

ALTER TABLE USER_PLAN DROP CONSTRAINT USER_PLAN_FK;

ALTER TABLE USER_PLAN ADD CONSTRAINT USER_PLAN_FK FOREIGN KEY (PLAN_NO)
REFERENCES PLAN(PLAN_NO) ON DELETE CASCADE;

-- (2) ������ ���� --

DROP SEQUENCE PLAN_SEQ;
CREATE SEQUENCE PLAN_SEQ
START WITH 1
INCREMENT BY 1;

-- 6. ���� �Խ���

-- (1) ���̺� ���� --

-- TOGETHER
DROP TABLE TOGETHER PURGE;
CREATE TABLE TOGETHER(
    TO_NO        INT              CONSTRAINT TOGETHER_PK PRIMARY KEY,
    TO_WRITER    INT              CONSTRAINT TOGETHER_FK REFERENCES USER_INFO(USER_NO),
    TO_TITLE     VARCHAR2(300)    NOT NULL, 
    TO_CNT       NUMBER           NOT NULL, 
    TO_DATE      DATE             NOT NULL, 
    TO_CONTENT   VARCHAR2(4000)   NOT NULL
);

ALTER TABLE TOGETHER DROP CONSTRAINT TOGETHER_FK;

ALTER TABLE TOGETHER ADD CONSTRAINT TOGETHER_FK FOREIGN KEY (TO_WRITER)
REFERENCES USER_INFO(user_no) ON DELETE CASCADE;

-- TOGETHERREPLY
DROP TABLE TOGETHERREPLY PURGE;
CREATE TABLE TOGETHERREPLY (
    REPLY_NUM       NUMBER           CONSTRAINT TOGETHERREPLY_PK PRIMARY KEY,
    TOGETHER_NUM    NUMBER           CONSTRAINT TOGETHERREPLY_FK REFERENCES TOGETHER(TO_NO),
    REPLY_WRITER    VARCHAR2(100)    NOT NULL,
    REPLY_CONTENT   VARCHAR2(1000)   NOT NULL,
    REPLY_DATE      DATE             NOT NULL
);

-- (2) ������ ���� --

DROP SEQUENCE TOGETHER_SEQ;
CREATE SEQUENCE TOGETHER_SEQ
START WITH 1
INCREMENT BY 1;

DROP SEQUENCE TOGETHERREPLY_SEQ;
CREATE SEQUENCE together_reply_SEQ
START WITH 1
INCREMENT BY 1;


