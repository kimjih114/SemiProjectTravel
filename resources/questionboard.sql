
--문의게시글고유번호 시퀀스
create sequence seq_qboard_no;

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

--문의 게시판 insert 
insert into qboard values(1,'admin','안녕하세요,관리자 입니다.',sysdate,0,0,null,null,0);

select *from qboard;
--삭제게시글테이블
create table qboard_deleted(
        qboard_no number,
        qboard_writer varchar2(15),
        qboard_content varchar2(2000),
        qboard_date date,
        qboard_readcnt number,
        qboard_travel_ref number,
        qboard_deleted_date date
);

--삭제게시글 트리거
create or replace trigger trig_qboard_deleted
        before 
        delete on qboard
        for each row
begin 
        insert into qboard_deleted
        values(:old.qboard_no, :old.qboard_writer, :old.qboard_content, :old.qboard_date, :old.qboard_readcnt, :old.qboard_travel_ref);
end;


