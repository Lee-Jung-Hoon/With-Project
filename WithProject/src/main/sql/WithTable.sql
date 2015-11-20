create table T_WITH_STUDYGROUP(
GROUP_NO int not null auto_increment primary key,
GROUP_NAME varchar(200) not null,
GROUP_DETAIL varchar(4000) not null,
GROUP_MAXPERSON int not null,
GROUP_NOWPERSON int not null,
GROUP_ACTIVELONGITUDE double not null,
GROUP_ACTIVELATITUDE double not null,
GROUP_ACTIVEPLACE varchar(200) not null,
GROUP_EMAIL varchar(200) not null,
GROUP_TEL varchar(100) not null,
GROUP_CONFIRMTYPE varchar(50) not null,
GROUP_REPIMAGEPATH varchar(200) not null,
GROUP_RECRUITSTARTDATE date not null,
GROUP_RECRUITENDDATE date not null,
GROUP_REGDATE datetime default current_timestamp,
MEMBER_NO int not null
);

create table T_WITH_JOINSTUDYGROUP(
	join_no int not null primary key auto_increment,
    MEMBER_NO int,
    GROUP_NO int,
    GROUP_GRADE int,
    GROUP_JOINDATE datetime default current_timestamp
); 


create table T_WITH_STUDYGROUP_COMMENT (
MEMBER_NO INT NOT NULL,
GROUP_NO INT	NOT NULL,
COMMENT_NO INT	NOT NULL primary key auto_increment,
COMMENT_CONTENT	VARCHAR(800)	NOT NULL,
REG_DATE DATETIME	NOT NULL default current_timestamp);




CREATE TABLE T_WITH_STUDYGROUP_CALENDAR
(
ID INT	NOT NULL AUTO_INCREMENT PRIMARY KEY,
TITLE VARCHAR(200)	NOT NULL,
START_DATE VARCHAR(50)	NOT NULL,
END_DATE VARCHAR(50)	NOT NULL,
CALENDAR_DETAIL	VARCHAR(2000)	NOT NULL,
COLOR VARCHAR(20)	NULL,
TEXT_COLOR VARCHAR(20)	NULL,
GROUP_NO INT	NOT NULL,
MEMBER_NO INT	NOT NULL
);


create table T_WITH_STUDYGROUP_MONEYBOOK(
M_NO INT NOT NULL auto_increment primary key, 
GROUP_NO INT NOT NULL,
MEMBER_NO INT NOT NULL,
M_DATE DATETIME	NOT NULL,
M_MEMO VARCHAR(400)	NOT NULL,
M_MONEY INT	NOT NULL,
M_LEFT VARCHAR(100)	NOT NULL,
M_RIGHT VARCHAR(100) NOT NULL);