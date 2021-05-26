DROP TABLE SPOT_INFO PURGE;
CREATE TABLE SPOT_INFO (
    LIKE_IDX        NUMBER          CONSTRAINT LIKE_PK PRIMARY KEY,
    CONTENT_ID       VARCHAR2(10)    NOT NULL,
    LIKE_CNT        NUMBER,
    REVIEW_CNT      NUMBER
);



select * from spot_info;

INSERT INTO SPOT_INFO (LIKE_IDX, CONTENT_ID, LIKE_CNT) VALUES ( SPOT_LIKE_SEQ.nextval, '1' , 0);
rollback;

ROLLBACK;

DROP SEQUENCE SPOT_SEQ;
CREATE SEQUENCE SPOT_SEQ
START WITH 1
INCREMENT BY 1
MINVALUE 0;

UPDATE SPOT_INFO SET LIKE_CNT = LIKE_CNT + 1 WHERE CONTENT_ID="";

SELECT * FROM SPOT_INFO;