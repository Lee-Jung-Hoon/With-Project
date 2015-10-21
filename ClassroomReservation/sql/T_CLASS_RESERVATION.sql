create table t_class_reservation(
    res_no int auto_increment primary key not null,
    id varchar(100) not null,
    member_no int not null,
    class_no int not null,
    reg_date datetime default now() not null,
    start_time varchar(50) not null,
    rsv_day varchar(50) not null,
    using_time int not null,
    res_for varchar(100),
    status int default '1' not null
);