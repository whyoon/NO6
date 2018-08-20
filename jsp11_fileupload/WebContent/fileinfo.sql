--fileinfo.sql
create table fileinfo
(
	filenum number(5) primary key,
	writer varchar2(20),
	title varchar2(20),
	content varchar2(100),
	orgfilename varchar2(150),	-- 업로드한 파일명
	savefilename varchar2(150),	-- 저장된 파일명
	filesize number(9)	-- 파일크기
);
create sequence fileinfo_seq;