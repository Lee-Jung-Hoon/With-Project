create table T_CLASS_CLASSROOMINFO(
	class_no int primary key auto_increment,
    floor int not null,
    class_name varchar(100) not null,
    class_top double not null,
    class_left double not null,
    class_person int not null,
    class_detail varchar(4000)
);

