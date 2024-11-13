
CREATE TABLE T_ITEM_LIST
(
    no NUMBER(6) PRIMARY KEY,
    item_name VARCHAR2(24) NOT NULL,
    price NUMBER(6),
    create_date DATE DEFAULT SYSDATE
);


CREATE SEQUENCE T_ITEM_LIST_PK_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 999999
NOCYCLE;

select t_item_list_pk_seq.nextval from dual;
select t_item_list_pk_seq.currval from dual;

INSERT INTO  T_ITEM_LIST VALUES (t_item_list_pk_seq.nextval,'가가가',1000,sysdate);

SELECT * FROM T_ITEM_LIST;