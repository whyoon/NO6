--fileinfo.sql
create table fileinfo
(
	filenum number(5) primary key,
	writer varchar2(20),
	title varchar2(20),
	content varchar2(100),
	orgfilename varchar2(150),	-- ���ε��� ���ϸ�
	savefilename varchar2(150),	-- ����� ���ϸ�
	filesize number(9)	-- ����ũ��
);
create sequence fileinfo_seq;