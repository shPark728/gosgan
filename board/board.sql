SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS reply;
DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS post_file;
DROP TABLE IF EXISTS board;
DROP TABLE IF EXISTS board_policy;
DROP TABLE IF EXISTS user;




/* Create Tables */

CREATE TABLE board
(
	board_no int NOT NULL,
	board_view_count int NOT NULL,
	post_created_date datetime NOT NULL,
	post_updated_date datetime,
	post_title varchar(255),
	-- 글 내용
	board_content longtext COMMENT '글 내용',
	-- 비밀글
	post_state int COMMENT '비밀글',
	board_policy_no int NOT NULL,
	-- 아이디
	user_id varchar(20) NOT NULL COMMENT '아이디',
	PRIMARY KEY (board_no)
);


CREATE TABLE board_policy
(
	board_policy_no int NOT NULL,
	board_state int NOT NULL,
	board_read_membership int NOT NULL,
	board_write_membership int NOT NULL,
	board_title varchar(255),
	board_order_no int NOT NULL,
	board_created_date datetime,
	board_updated_date datetime,
	PRIMARY KEY (board_policy_no)
);


CREATE TABLE comment
(
	comment_no int NOT NULL,
	comment_contents text,
	-- 비밀글
	comment_secret int NOT NULL COMMENT '비밀글',
	comment_created_date datetime,
	comment_updated_date datetime,
	comment_del int,
	board_no int NOT NULL,
	-- 아이디
	user_id varchar(20) NOT NULL COMMENT '아이디',
	PRIMARY KEY (comment_no)
);


CREATE TABLE post_file
(
	file_no int NOT NULL,
	file_name varchar(50),
	file_route varchar(255) NOT NULL,
	file_extension varchar(10) NOT NULL,
	file_size int NOT NULL,
	file_updated_date datetime,
	file_created_date datetime,
	board_no int NOT NULL,
	PRIMARY KEY (file_no)
);


CREATE TABLE reply
(
	-- 답댓글 번호
	-- 
	reply_no int NOT NULL COMMENT '답댓글 번호
',
	-- 답댓글 내용
	-- 
	reply_contents text COMMENT '답댓글 내용
',
	-- 답댓글 등록일
	-- 
	reply_created_date datetime COMMENT '답댓글 등록일
',
	reply_updated_date datetime,
	-- 답댓글 비밀여부
	reply_secret int NOT NULL COMMENT '답댓글 비밀여부',
	reply_del int,
	comment_no int NOT NULL,
	-- 아이디
	user_id varchar(20) NOT NULL COMMENT '아이디',
	PRIMARY KEY (reply_no)
);


CREATE TABLE user
(
	-- 아이디
	user_id varchar(20) NOT NULL COMMENT '아이디',
	-- 비밀번호
	user_password varchar(20) NOT NULL COMMENT '비밀번호',
	-- 닉네임
	user_nickname varchar(10) NOT NULL COMMENT '닉네임',
	-- 이메일
	user_email varchar(50) NOT NULL COMMENT '이메일',
	-- 가입일
	user_sign_up_date datetime COMMENT '가입일',
	-- 최근 접속일
	user_sign_in_date datetime COMMENT '최근 접속일',
	-- 권한
	user_membership int NOT NULL COMMENT '권한',
	-- 활동 상태
	user_state int NOT NULL COMMENT '활동 상태',
	user_created_date datetime,
	user_updated_date datetime,
	PRIMARY KEY (user_id)
);



/* Create Foreign Keys */

ALTER TABLE comment
	ADD FOREIGN KEY (board_no)
	REFERENCES board (board_no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE post_file
	ADD FOREIGN KEY (board_no)
	REFERENCES board (board_no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE board
	ADD FOREIGN KEY (board_policy_no)
	REFERENCES board_policy (board_policy_no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE reply
	ADD FOREIGN KEY (comment_no)
	REFERENCES comment (comment_no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE board
	ADD FOREIGN KEY (user_id)
	REFERENCES user (user_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE comment
	ADD FOREIGN KEY (user_id)
	REFERENCES user (user_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE reply
	ADD FOREIGN KEY (user_id)
	REFERENCES user (user_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



