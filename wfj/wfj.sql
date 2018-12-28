set names utf8;
drop database if exists wfj;
create database wfj charset=utf8;


use wfj;

#用户信息表---名称  id,用户表id,用户信息名称,是否显示
create table user_info(
    usid int primary key auto_increment,
    uid int,
    info_type varchar(16),
    users_info varchar(8),
    isShow int
);
#证件信息（图片），
create table cards(
    cid int primary key auto_increment,
    uid int,
    card_img varchar(64)
);


drop table if exists users;
#用户表 id，姓名，性别，出生日期，住址，身份证号，手机号，微信号，真实姓名，登录密码，工作地址，职位，邮箱，学历，履历，健康状况，政治面貌，
create table users(
    uid int primary key auto_increment,
    uname varchar(16),
    sex int,
    birthday varchar(64),
    addr varchar(64),
    cards varchar(18),
    phone char(11),
    wechat varchar(32),
    user_name varchar(8),
    upwd varchar(16),
    job_addr varchar(64),
    position varchar(8),
    email varchar(32),
    education varchar(8),
    record varchar(64),
    situation varchar(8),
    political varchar(8)
);

insert into users(uname,sex,birthday,addr,phone,user_name,upwd,email) values("admin",1,"1990-11-11","北京市海淀区","13322221111","张三","111111","123@163.com");
insert into users(uname,sex,birthday,addr,phone,user_name,upwd,email) values("admin1",0,"1990-11-11","北京市海淀区","13322221122","张三1","111111","1231@163.com");
insert into users(uname,sex,birthday,addr,phone,user_name,upwd,email) values("admin2",0,"1990-11-12","北京市海淀区","13322221133","张三2","111111","1232@163.com");



insert into user_info(usid,uid,info_type,users_info,isShow) values(null,1,"uname","姓名",1);
insert into user_info(usid,uid,info_type,users_info,isShow) values(null,1,"sex","性别",1);
insert into user_info(usid,uid,info_type,users_info,isShow) values(null,1,"birthday","出生日期",1);
insert into user_info(usid,uid,info_type,users_info,isShow) values(null,1,"addr","住址",1);
insert into user_info(usid,uid,info_type,users_info,isShow) values(null,1,"cards","身份证号",0);
insert into user_info(usid,uid,info_type,users_info,isShow) values(null,1,"phone","手机号",1);
insert into user_info(usid,uid,info_type,users_info,isShow) values(null,1,"wechat","微信号",0);
insert into user_info(usid,uid,info_type,users_info,isShow) values(null,1,"user_name","真实姓名",0);
insert into user_info(usid,uid,info_type,users_info,isShow) values(null,1,"job_addr","工作地址",0);
insert into user_info(usid,uid,info_type,users_info,isShow) values(null,1,"position","职位",0);
insert into user_info(usid,uid,info_type,users_info,isShow) values(null,1,"email","邮箱",1);
insert into user_info(usid,uid,info_type,users_info,isShow) values(null,1,"education","学历",0);
insert into user_info(usid,uid,info_type,users_info,isShow) values(null,1,"record","履历",0);
insert into user_info(usid,uid,info_type,users_info,isShow) values(null,1,"situation","身体状况",0);
insert into user_info(usid,uid,info_type,users_info,isShow) values(null,1,"political","政治面貌",0);










