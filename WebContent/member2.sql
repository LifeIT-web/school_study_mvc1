create table member2 (
	member_id varchar2(15),
	member_pw varchar2(20),
	member_name varchar2(20),
	member_age number,
	member_gender varchar2(6),
	member_email varchar2(30),
	PRIMARY KEY (member_id)
);

drop table member2 purge;
drop table memberboard purge;

select * from member2;
select * from memberboard;

create table memberboard (
	board_num number,
	board_id varchar2(20),
	board_subject varchar2(50),
	board_content varchar2(2000),
	board_file varchar2(50),
	board_re_ref number, -- 답글달기
	board_re_lev number, -- 
	board_re_seq number, -- no
	board_readcount number,
	board_date date,
	primary key (board_num)
	
);

insert into memberboard 
values (1, 'korea', '안녕', '안녕하세요 유하입니다.', null, 1, 2, 3, 1, sysdate);



alter table memberboard add constraint pk_board_id foreign key(board_id) 
references member2(member_id) on delete cascade; 

-- memberboard board_id 가 외래키가 되겟다
-- 기본키 지울때 연결된 외래키까지 지워주는 키
-- on delete cascade 의미 파악 중요



