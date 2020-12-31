
/* Drop Tables */

DROP TABLE board_1 CASCADE CONSTRAINTS;
DROP TABLE member_1 CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE board_1
(
	b_name varchar2(20) NOT NULL,
	addr varchar2(30),
	sex varchar2(10),
	id varchar2(20) NOT NULL
);


CREATE TABLE member_1
(
	id varchar2(20) NOT NULL,
	name varchar2(30) NOT NULL,
	addr varchar2(40),
	kor number,
	eng number,
	math number,
	total number(10,4),
	avg number(10,4) DEFAULT 0.0,
	PRIMARY KEY (id)
);



/* Create Foreign Keys */

ALTER TABLE board_1
	ADD FOREIGN KEY (id)
	REFERENCES member_1 (id)
;



