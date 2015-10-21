create table t_class_member (
   id varchar(100) not null,
    member_no int auto_increment not null,
    password varchar(200) not null,
    email varchar(100) not null,
    name varchar(50) not null,
    grade int default 0 not null,
    primary key(member_no,id)
);