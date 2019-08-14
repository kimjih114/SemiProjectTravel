--문의게시글고유번호 시퀀스
create sequence seq_qboard_no;
select sequence seq_qboard_no from dual;

select seq_qboard_no.currval from dual;
--문의게시글테이블
 --트레블 테이블 콘텐트아이디 외래키는 나중에 지정 on delete set null
 --제목
--이미지 (올드)
--이미지 (뉴)
--board_travel_erf
--진행상태
create table qboard (
        qboard_no number,
        qboard_writer varchar2(15),
        qboard_title varchar2(100),
        qboard_content varchar2(2000),
        qboard_date date default sysdate,
        qboard_readcnt number default 0,
        qboard_travel_ref number,
        qboard_filename varchar2(100),  -- 올드 파일이름
        qboard_newfilename varchar2(100), --뉴 파일이름
        qboard_state number,  --나의 계획은   0이면 진행중....   / 1 이면 진행완료
        
        constraint pk_qboard_no primary key(qboard_no),
        constraint fk_qboard_writer foreign key(qboard_writer) references users(user_id) on delete cascade
    
);

--drop table qboard;
--문의 게시판 insert 
insert into qboard values(seq_qboard_no.nextval,'admin','안녕하세요','안녕하세요,관리자 입니다.',sysdate,0,0,null,null,0);

select * from qboard;

SELECT * FROM ( SELECT ROWNUM AS RNUM, V.* FROM( SELECT * FROM QBOARD ORDER BY QBOARD_DATE DESC) V ) V WHERE RNUM BETWEEN ? AND ?;



select *from qboard;
--삭제게시글테이블
create table qboard_deleted(
        qboard_no number,
        qboard_writer varchar2(15),
        qboard_title varchar2(100),
        qboard_content varchar2(2000),
        qboard_date date,
        qboard_readcnt number,
        qboard_travel_ref number
);

--삭제게시글 트리거
create or replace trigger trig_qboard_deleted
        before 
        delete on qboard
        for each row
begin 
        insert into qboard_deleted
        values(:old.qboard_no, :old.qboard_writer, :old.qboard_title, :old.qboard_content, :old.qboard_date, :old.qboard_readcnt, :old.qboard_travel_ref );
end;

commit;




--문의게시판 댓글테이블
  
CREATE SEQUENCE  "SEQ_QBOARD_COMMENT_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;


--DROP TABLE QBOARD_COMMENT;

--select * from QBOARD_COMMENT where qboard_ref =46 start with qboard_comment_level=1 connect by prior qboard_comment_no=qboard_comment_ref order siblings by qboard_comment_date asc
--select * from QBOARD_COMMENT where qboard_ref = ? start with qboard_comment_level=1 connect by prior qboard_comment_no=qboard_comment_ref order siblings by qboard_comment_date asc
--문의게시판 댓글테이블
--  DROP TABLE QBOARD_COMMENT;
--문의게시판 댓글테이블
   CREATE TABLE "TRAV"."QBOARD_COMMENT" 
   (	"QBOARD_COMMENT_NO" NUMBER, 
	"QBOARD_COMMENT_LEVEL" NUMBER DEFAULT 1, 
	"QBOARD_COMMENT_WRITER" VARCHAR2(15 BYTE), 
	"QBOARD_COMMENT_CONTENT" VARCHAR2(2000 BYTE), 
	"QBOARD_REF" NUMBER, 
	"QBOARD_COMMENT_REF" NUMBER, 
	"QBOARD_COMMENT_DATE" DATE DEFAULT sysdate,
     constraint pk_qboard_comment_no primary key(qboard_comment_no)enable
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
  
alter table qboard_comment add constraint fk_qboard_comment_writer foreign key(qboard_comment_writer)references users(user_id) on delete cascade;
alter table qboard_comment add constraint FK_QBOARD_REF foreign key(QBOARD_REF)references QBOARD(QBOARD_NO) on delete cascade enable;  
alter table qboard_comment add constraint FK_QBOARD_COMMENT_REF foreign key(QBOARD_COMMENT_REF)references QBOARD_COMMENT(QBOARD_COMMENT_NO) on delete cascade enable;   


   COMMENT ON COLUMN "TRAV"."QBOARD_COMMENT"."QBOARD_COMMENT_NO" IS '게시판댓글 고유번호';
   COMMENT ON COLUMN "TRAV"."QBOARD_COMMENT"."QBOARD_COMMENT_LEVEL" IS '댓글/대댓글여부[댓글:1, 대댓글:2]';
   COMMENT ON COLUMN "TRAV"."QBOARD_COMMENT"."QBOARD_COMMENT_WRITER" IS '댓글 작성자';
   COMMENT ON COLUMN "TRAV"."QBOARD_COMMENT"."QBOARD_COMMENT_CONTENT" IS '게시판댓글내용';
   COMMENT ON COLUMN "TRAV"."QBOARD_COMMENT"."QBOARD_REF" IS '게시글 참조번호';
   COMMENT ON COLUMN "TRAV"."QBOARD_COMMENT"."QBOARD_COMMENT_REF" IS '게시판댓글 참조번호(대댓글인 경우)';
   COMMENT ON COLUMN "TRAV"."QBOARD_COMMENT"."QBOARD_COMMENT_DATE" IS '게시판댓글 작성일';
   COMMENT ON TABLE "TRAV"."QBOARD_COMMENT"  IS '게시판 댓글 테이블';

   commit;

