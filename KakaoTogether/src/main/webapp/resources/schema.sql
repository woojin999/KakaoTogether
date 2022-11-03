CREATE USER 'kakaouser'@'%' IDENTIFIED BY 'mysql';

CREATE DATABASE `kakaodb`;

GRANT Alter ON kakaodb.* TO 'kakaouser'@'%';
GRANT Create ON kakaodb.* TO 'kakaouser'@'%';
GRANT Create view ON kakaodb.* TO 'kakaouser'@'%';
GRANT Delete ON kakaodb.* TO 'kakaouser'@'%';
GRANT Drop ON kakaodb.* TO 'kakaouser'@'%';
GRANT Grant option ON kakaodb.* TO 'kakaouser'@'%';
GRANT Index ON kakaodb.* TO 'kakaouser'@'%';
GRANT Insert ON kakaodb.* TO 'kakaouser'@'%';
GRANT References ON kakaodb.* TO 'kakaouser'@'%';
GRANT Select ON kakaodb.* TO 'kakaouser'@'%';
GRANT Show view ON kakaodb.* TO 'kakaouser'@'%';
GRANT Trigger ON kakaodb.* TO 'kakaouser'@'%';
GRANT Update ON kakaodb.* TO 'kakaouser'@'%';
GRANT Alter routine ON kakaodb.* TO 'kakaouser'@'%';
GRANT Create routine ON kakaodb.* TO 'kakaouser'@'%';
GRANT Create temporary tables ON kakaodb.* TO 'kakaouser'@'%';
GRANT Execute ON kakaodb.* TO 'kakaouser'@'%';
GRANT Lock tables ON kakaodb.* TO 'kakaouser'@'%';
GRANT Grant option ON kakaodb.* TO 'kakaouser'@'%';


DROP TABLE IF EXISTS board;
CREATE TABLE board (
	bno	bigint NOT NULL auto_increment,
	mno	bigint NOT NULL,
	title varchar(100) NOT NULL,
	sub_title varchar(100) NOT NULL,
	writer varchar(100) NOT NULL,
	topic varchar(100) NOT NULL,
	`desc` text NOT NULL,
	price bigint default 0,
	keyword1 varchar(100) default null,
	keyword2 varchar(100) default null,
	keyword3 varchar(100) default null,
	reg_at datetime default current_timestamp,
	end_date varchar(100) NOT NULL,
	final_price bigint not null,
	board_img	varchar(3000) default NULL,
	primary key(bno)
)default CHARSET=utf8mb4;


DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
	mno	bigint NOT null auto_increment,
	user_id varchar(100)	NOT NULL,
	pwd	varchar(100) NOT NULL,
	user_name	varchar(100) NOT NULL,
	phone varchar(100) default NULL,
	email	varchar(100) NOT NULL,
	postnum varchar(100) default NULL,
	addr varchar(100) default NULL,
	reg_at datetime	default current_timestamp,
	member_img varchar(1000) default '0',
	primary key(mno)
) default CHARSET=utf8mb4;


DROP TABLE IF exists donation;
CREATE TABLE donation (
	dno	bigint NOT null auto_increment,
	mno	bigint NOT null,
	bno	bigint NOT null,
	donation bigint not null,
	comment text NOT NULL,
	donation_at varchar(100) default current_timestamp,
	primary key(dno)
) default CHARSET=utf8mb4;


DROP TABLE IF EXISTS image_file;
CREATE TABLE image_file (
	uuid	varchar(256)	NOT NULL,
	save_dir	varchar(1000)	NOT NULL,
	image_name	varchar(1000)	NOT NULL,
	bno	bigint	NOT NULL,
	mno	bigint	NOT NULL,
	primary key(uuid)
) default CHARSET=utf8mb4;