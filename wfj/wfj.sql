set names utf8;
drop database if exists wfj;
create database wfj charset=utf8;


use wfj;

#用户信息表---名称  id,用户表id,用户信息名称,是否显示
drop table if exists user_info;
create table user_info(
    usid int primary key auto_increment,
    uid int,
    info_type varchar(16),
    users_info varchar(8),
    isShow int default 0
);

#用户表 id，姓名，性别，出生日期，住址，身份证号，手机号，微信号，真实姓名，登录密码，工作地址，职位，邮箱，学历，履历，健康状况，政治面貌，

drop table if exists users;
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

drop table if exists login;
create table login(
    uid int primary key auto_increment,
    uname varchar(16),
    upwd varchar(16)
);


insert into login(uid,uname,upwd) values(null,"admin","111111");

insert into users(uname,sex,birthday,addr,phone,user_name,upwd,email) values("admin",1,"1990-11-11","北京市海淀区","13322221111","张三","111111","123@163.com");



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

insert into user_info(usid,uid,info_type,users_info,isShow) values(null,2,"uname","姓名",1);
insert into user_info(usid,uid,info_type,users_info,isShow) values(null,2,"sex","性别",1);
insert into user_info(usid,uid,info_type,users_info,isShow) values(null,2,"birthday","出生日期",1);
insert into user_info(usid,uid,info_type,users_info,isShow) values(null,2,"addr","住址",1);
insert into user_info(usid,uid,info_type,users_info,isShow) values(null,2,"cards","身份证号",0);
insert into user_info(usid,uid,info_type,users_info,isShow) values(null,2,"phone","手机号",1);
insert into user_info(usid,uid,info_type,users_info,isShow) values(null,2,"wechat","微信号",0);
insert into user_info(usid,uid,info_type,users_info,isShow) values(null,2,"user_name","真实姓名",0);
insert into user_info(usid,uid,info_type,users_info,isShow) values(null,2,"job_addr","工作地址",0);
insert into user_info(usid,uid,info_type,users_info,isShow) values(null,2,"position","职位",0);
insert into user_info(usid,uid,info_type,users_info,isShow) values(null,2,"email","邮箱",1);
insert into user_info(usid,uid,info_type,users_info,isShow) values(null,2,"education","学历",0);
insert into user_info(usid,uid,info_type,users_info,isShow) values(null,2,"record","履历",0);
insert into user_info(usid,uid,info_type,users_info,isShow) values(null,2,"situation","身体状况",0);
insert into user_info(usid,uid,info_type,users_info,isShow) values(null,2,"political","政治面貌",0);









#证件信息（图片），
create table cards(
    cid int primary key auto_increment,
    uid int,
    card_img varchar(64)
);

#商品列表 商品id、标题、副标题、价格、详情、
drop table if exists product;
create table product(
    pid int primary key auto_increment,
    title varchar(64),
    subtitle varchar(128),
    old_price decimal(10,2),
    price decimal(10,2),
    detail varchar(256)
);

#商品图片 编号id、商品编号、图片路径
drop table if exists pro_img;
create table pro_img(
    pgid int primary key auto_increment,
    pid int,
    img_url varchar(64)
);

insert into pro_img(pgid,pid,img_url) values(null,1,'http://127.0.0.1:3000/pro_img/pro_img_01_01.jpg');
insert into pro_img(pgid,pid,img_url) values(null,1,'http://127.0.0.1:3000/pro_img/pro_img_01_02.jpg');
insert into pro_img(pgid,pid,img_url) values(null,1,'http://127.0.0.1:3000/pro_img/pro_img_01_03.jpg');
insert into pro_img(pgid,pid,img_url) values(null,1,'http://127.0.0.1:3000/pro_img/pro_img_01_04.jpg');

insert into pro_img(pgid,pid,img_url) values(null,2,'http://127.0.0.1:3000/pro_img/pro_img_02_01.jpg');
insert into pro_img(pgid,pid,img_url) values(null,2,'http://127.0.0.1:3000/pro_img/pro_img_02_02.jpg');
insert into pro_img(pgid,pid,img_url) values(null,2,'http://127.0.0.1:3000/pro_img/pro_img_02_03.jpg');
insert into pro_img(pgid,pid,img_url) values(null,2,'http://127.0.0.1:3000/pro_img/pro_img_02_04.jpg');

insert into pro_img(pgid,pid,img_url) values(null,3,'http://127.0.0.1:3000/pro_img/pro_img_03_01.jpg');
insert into pro_img(pgid,pid,img_url) values(null,3,'http://127.0.0.1:3000/pro_img/pro_img_03_02.jpg');
insert into pro_img(pgid,pid,img_url) values(null,3,'http://127.0.0.1:3000/pro_img/pro_img_03_03.jpg');
insert into pro_img(pgid,pid,img_url) values(null,3,'http://127.0.0.1:3000/pro_img/pro_img_03_04.jpg');
insert into pro_img(pgid,pid,img_url) values(null,3,'http://127.0.0.1:3000/pro_img/pro_img_03_05.jpg');

insert into pro_img(pgid,pid,img_url) values(null,4,'http://127.0.0.1:3000/pro_img/pro_img_04_01.jpg');
insert into pro_img(pgid,pid,img_url) values(null,4,'http://127.0.0.1:3000/pro_img/pro_img_04_02.jpg');
insert into pro_img(pgid,pid,img_url) values(null,4,'http://127.0.0.1:3000/pro_img/pro_img_04_03.jpg');
insert into pro_img(pgid,pid,img_url) values(null,4,'http://127.0.0.1:3000/pro_img/pro_img_04_04.jpg');
insert into pro_img(pgid,pid,img_url) values(null,4,'http://127.0.0.1:3000/pro_img/pro_img_04_05.jpg');


insert into pro_img(pgid,pid,img_url) values(null,5,'http://127.0.0.1:3000/pro_img/pro_img_01_01.jpg');
insert into pro_img(pgid,pid,img_url) values(null,5,'http://127.0.0.1:3000/pro_img/pro_img_01_02.jpg');
insert into pro_img(pgid,pid,img_url) values(null,5,'http://127.0.0.1:3000/pro_img/pro_img_01_03.jpg');
insert into pro_img(pgid,pid,img_url) values(null,5,'http://127.0.0.1:3000/pro_img/pro_img_01_04.jpg');

insert into pro_img(pgid,pid,img_url) values(null,6,'http://127.0.0.1:3000/pro_img/pro_img_02_01.jpg');
insert into pro_img(pgid,pid,img_url) values(null,6,'http://127.0.0.1:3000/pro_img/pro_img_02_02.jpg');
insert into pro_img(pgid,pid,img_url) values(null,6,'http://127.0.0.1:3000/pro_img/pro_img_02_03.jpg');
insert into pro_img(pgid,pid,img_url) values(null,6,'http://127.0.0.1:3000/pro_img/pro_img_02_04.jpg');

insert into pro_img(pgid,pid,img_url) values(null,7,'http://127.0.0.1:3000/pro_img/pro_img_03_01.jpg');
insert into pro_img(pgid,pid,img_url) values(null,7,'http://127.0.0.1:3000/pro_img/pro_img_03_02.jpg');
insert into pro_img(pgid,pid,img_url) values(null,7,'http://127.0.0.1:3000/pro_img/pro_img_03_03.jpg');
insert into pro_img(pgid,pid,img_url) values(null,7,'http://127.0.0.1:3000/pro_img/pro_img_03_04.jpg');
insert into pro_img(pgid,pid,img_url) values(null,7,'http://127.0.0.1:3000/pro_img/pro_img_03_05.jpg');

insert into pro_img(pgid,pid,img_url) values(null,8,'http://127.0.0.1:3000/pro_img/pro_img_04_01.jpg');
insert into pro_img(pgid,pid,img_url) values(null,8,'http://127.0.0.1:3000/pro_img/pro_img_04_02.jpg');
insert into pro_img(pgid,pid,img_url) values(null,8,'http://127.0.0.1:3000/pro_img/pro_img_04_03.jpg');
insert into pro_img(pgid,pid,img_url) values(null,8,'http://127.0.0.1:3000/pro_img/pro_img_04_04.jpg');
insert into pro_img(pgid,pid,img_url) values(null,8,'http://127.0.0.1:3000/pro_img/pro_img_04_05.jpg');

insert into pro_img(pgid,pid,img_url) values(null,9,'http://127.0.0.1:3000/pro_img/pro_img_01_01.jpg');
insert into pro_img(pgid,pid,img_url) values(null,9,'http://127.0.0.1:3000/pro_img/pro_img_01_02.jpg');
insert into pro_img(pgid,pid,img_url) values(null,9,'http://127.0.0.1:3000/pro_img/pro_img_01_03.jpg');
insert into pro_img(pgid,pid,img_url) values(null,9,'http://127.0.0.1:3000/pro_img/pro_img_01_04.jpg');

insert into pro_img(pgid,pid,img_url) values(null,10,'http://127.0.0.1:3000/pro_img/pro_img_02_01.jpg');
insert into pro_img(pgid,pid,img_url) values(null,10,'http://127.0.0.1:3000/pro_img/pro_img_02_02.jpg');
insert into pro_img(pgid,pid,img_url) values(null,10,'http://127.0.0.1:3000/pro_img/pro_img_02_03.jpg');
insert into pro_img(pgid,pid,img_url) values(null,10,'http://127.0.0.1:3000/pro_img/pro_img_02_04.jpg');

insert into pro_img(pgid,pid,img_url) values(null,11,'http://127.0.0.1:3000/pro_img/pro_img_03_01.jpg');
insert into pro_img(pgid,pid,img_url) values(null,11,'http://127.0.0.1:3000/pro_img/pro_img_03_02.jpg');
insert into pro_img(pgid,pid,img_url) values(null,11,'http://127.0.0.1:3000/pro_img/pro_img_03_03.jpg');
insert into pro_img(pgid,pid,img_url) values(null,11,'http://127.0.0.1:3000/pro_img/pro_img_03_04.jpg');
insert into pro_img(pgid,pid,img_url) values(null,11,'http://127.0.0.1:3000/pro_img/pro_img_03_05.jpg');

insert into pro_img(pgid,pid,img_url) values(null,12,'http://127.0.0.1:3000/pro_img/pro_img_04_01.jpg');
insert into pro_img(pgid,pid,img_url) values(null,12,'http://127.0.0.1:3000/pro_img/pro_img_04_02.jpg');
insert into pro_img(pgid,pid,img_url) values(null,12,'http://127.0.0.1:3000/pro_img/pro_img_04_03.jpg');
insert into pro_img(pgid,pid,img_url) values(null,12,'http://127.0.0.1:3000/pro_img/pro_img_04_04.jpg');
insert into pro_img(pgid,pid,img_url) values(null,12,'http://127.0.0.1:3000/pro_img/pro_img_04_05.jpg');

insert into pro_img(pgid,pid,img_url) values(null,13,'http://127.0.0.1:3000/pro_img/pro_img_01_01.jpg');
insert into pro_img(pgid,pid,img_url) values(null,13,'http://127.0.0.1:3000/pro_img/pro_img_01_02.jpg');
insert into pro_img(pgid,pid,img_url) values(null,13,'http://127.0.0.1:3000/pro_img/pro_img_01_03.jpg');
insert into pro_img(pgid,pid,img_url) values(null,13,'http://127.0.0.1:3000/pro_img/pro_img_01_04.jpg');

insert into pro_img(pgid,pid,img_url) values(null,14,'http://127.0.0.1:3000/pro_img/pro_img_02_01.jpg');
insert into pro_img(pgid,pid,img_url) values(null,14,'http://127.0.0.1:3000/pro_img/pro_img_02_02.jpg');
insert into pro_img(pgid,pid,img_url) values(null,14,'http://127.0.0.1:3000/pro_img/pro_img_02_03.jpg');
insert into pro_img(pgid,pid,img_url) values(null,14,'http://127.0.0.1:3000/pro_img/pro_img_02_04.jpg');

insert into pro_img(pgid,pid,img_url) values(null,15,'http://127.0.0.1:3000/pro_img/pro_img_03_01.jpg');
insert into pro_img(pgid,pid,img_url) values(null,15,'http://127.0.0.1:3000/pro_img/pro_img_03_02.jpg');
insert into pro_img(pgid,pid,img_url) values(null,15,'http://127.0.0.1:3000/pro_img/pro_img_03_03.jpg');
insert into pro_img(pgid,pid,img_url) values(null,15,'http://127.0.0.1:3000/pro_img/pro_img_03_04.jpg');
insert into pro_img(pgid,pid,img_url) values(null,15,'http://127.0.0.1:3000/pro_img/pro_img_03_05.jpg');

insert into pro_img(pgid,pid,img_url) values(null,16,'http://127.0.0.1:3000/pro_img/pro_img_04_01.jpg');
insert into pro_img(pgid,pid,img_url) values(null,16,'http://127.0.0.1:3000/pro_img/pro_img_04_02.jpg');
insert into pro_img(pgid,pid,img_url) values(null,16,'http://127.0.0.1:3000/pro_img/pro_img_04_03.jpg');
insert into pro_img(pgid,pid,img_url) values(null,16,'http://127.0.0.1:3000/pro_img/pro_img_04_04.jpg');
insert into pro_img(pgid,pid,img_url) values(null,16,'http://127.0.0.1:3000/pro_img/pro_img_04_05.jpg');

insert into pro_img(pgid,pid,img_url) values(null,17,'http://127.0.0.1:3000/pro_img/pro_img_01_01.jpg');
insert into pro_img(pgid,pid,img_url) values(null,17,'http://127.0.0.1:3000/pro_img/pro_img_01_02.jpg');
insert into pro_img(pgid,pid,img_url) values(null,17,'http://127.0.0.1:3000/pro_img/pro_img_01_03.jpg');
insert into pro_img(pgid,pid,img_url) values(null,17,'http://127.0.0.1:3000/pro_img/pro_img_01_04.jpg');

insert into pro_img(pgid,pid,img_url) values(null,18,'http://127.0.0.1:3000/pro_img/pro_img_02_01.jpg');
insert into pro_img(pgid,pid,img_url) values(null,18,'http://127.0.0.1:3000/pro_img/pro_img_02_02.jpg');
insert into pro_img(pgid,pid,img_url) values(null,18,'http://127.0.0.1:3000/pro_img/pro_img_02_03.jpg');
insert into pro_img(pgid,pid,img_url) values(null,18,'http://127.0.0.1:3000/pro_img/pro_img_02_04.jpg');

insert into pro_img(pgid,pid,img_url) values(null,19,'http://127.0.0.1:3000/pro_img/pro_img_03_01.jpg');
insert into pro_img(pgid,pid,img_url) values(null,19,'http://127.0.0.1:3000/pro_img/pro_img_03_02.jpg');
insert into pro_img(pgid,pid,img_url) values(null,19,'http://127.0.0.1:3000/pro_img/pro_img_03_03.jpg');
insert into pro_img(pgid,pid,img_url) values(null,19,'http://127.0.0.1:3000/pro_img/pro_img_03_04.jpg');
insert into pro_img(pgid,pid,img_url) values(null,19,'http://127.0.0.1:3000/pro_img/pro_img_03_05.jpg');

insert into pro_img(pgid,pid,img_url) values(null,20,'http://127.0.0.1:3000/pro_img/pro_img_04_01.jpg');
insert into pro_img(pgid,pid,img_url) values(null,20,'http://127.0.0.1:3000/pro_img/pro_img_04_02.jpg');
insert into pro_img(pgid,pid,img_url) values(null,20,'http://127.0.0.1:3000/pro_img/pro_img_04_03.jpg');
insert into pro_img(pgid,pid,img_url) values(null,20,'http://127.0.0.1:3000/pro_img/pro_img_04_04.jpg');
insert into pro_img(pgid,pid,img_url) values(null,20,'http://127.0.0.1:3000/pro_img/pro_img_04_05.jpg');

insert into pro_img(pgid,pid,img_url) values(null,21,'http://127.0.0.1:3000/pro_img/pro_img_01_01.jpg');
insert into pro_img(pgid,pid,img_url) values(null,21,'http://127.0.0.1:3000/pro_img/pro_img_01_02.jpg');
insert into pro_img(pgid,pid,img_url) values(null,21,'http://127.0.0.1:3000/pro_img/pro_img_01_03.jpg');
insert into pro_img(pgid,pid,img_url) values(null,21,'http://127.0.0.1:3000/pro_img/pro_img_01_04.jpg');

insert into pro_img(pgid,pid,img_url) values(null,22,'http://127.0.0.1:3000/pro_img/pro_img_02_01.jpg');
insert into pro_img(pgid,pid,img_url) values(null,22,'http://127.0.0.1:3000/pro_img/pro_img_02_02.jpg');
insert into pro_img(pgid,pid,img_url) values(null,22,'http://127.0.0.1:3000/pro_img/pro_img_02_03.jpg');
insert into pro_img(pgid,pid,img_url) values(null,22,'http://127.0.0.1:3000/pro_img/pro_img_02_04.jpg');

insert into pro_img(pgid,pid,img_url) values(null,23,'http://127.0.0.1:3000/pro_img/pro_img_03_01.jpg');
insert into pro_img(pgid,pid,img_url) values(null,23,'http://127.0.0.1:3000/pro_img/pro_img_03_02.jpg');
insert into pro_img(pgid,pid,img_url) values(null,23,'http://127.0.0.1:3000/pro_img/pro_img_03_03.jpg');
insert into pro_img(pgid,pid,img_url) values(null,23,'http://127.0.0.1:3000/pro_img/pro_img_03_04.jpg');
insert into pro_img(pgid,pid,img_url) values(null,23,'http://127.0.0.1:3000/pro_img/pro_img_03_05.jpg');

insert into pro_img(pgid,pid,img_url) values(null,24,'http://127.0.0.1:3000/pro_img/pro_img_04_01.jpg');
insert into pro_img(pgid,pid,img_url) values(null,24,'http://127.0.0.1:3000/pro_img/pro_img_04_02.jpg');
insert into pro_img(pgid,pid,img_url) values(null,24,'http://127.0.0.1:3000/pro_img/pro_img_04_03.jpg');
insert into pro_img(pgid,pid,img_url) values(null,24,'http://127.0.0.1:3000/pro_img/pro_img_04_04.jpg');
insert into pro_img(pgid,pid,img_url) values(null,24,'http://127.0.0.1:3000/pro_img/pro_img_04_05.jpg');

insert into pro_img(pgid,pid,img_url) values(null,25,'http://127.0.0.1:3000/pro_img/pro_img_01_01.jpg');
insert into pro_img(pgid,pid,img_url) values(null,25,'http://127.0.0.1:3000/pro_img/pro_img_01_02.jpg');
insert into pro_img(pgid,pid,img_url) values(null,25,'http://127.0.0.1:3000/pro_img/pro_img_01_03.jpg');
insert into pro_img(pgid,pid,img_url) values(null,25,'http://127.0.0.1:3000/pro_img/pro_img_01_04.jpg');

insert into pro_img(pgid,pid,img_url) values(null,26,'http://127.0.0.1:3000/pro_img/pro_img_02_01.jpg');
insert into pro_img(pgid,pid,img_url) values(null,26,'http://127.0.0.1:3000/pro_img/pro_img_02_02.jpg');
insert into pro_img(pgid,pid,img_url) values(null,26,'http://127.0.0.1:3000/pro_img/pro_img_02_03.jpg');
insert into pro_img(pgid,pid,img_url) values(null,26,'http://127.0.0.1:3000/pro_img/pro_img_02_04.jpg');

insert into pro_img(pgid,pid,img_url) values(null,27,'http://127.0.0.1:3000/pro_img/pro_img_03_01.jpg');
insert into pro_img(pgid,pid,img_url) values(null,27,'http://127.0.0.1:3000/pro_img/pro_img_03_02.jpg');
insert into pro_img(pgid,pid,img_url) values(null,27,'http://127.0.0.1:3000/pro_img/pro_img_03_03.jpg');
insert into pro_img(pgid,pid,img_url) values(null,27,'http://127.0.0.1:3000/pro_img/pro_img_03_04.jpg');
insert into pro_img(pgid,pid,img_url) values(null,27,'http://127.0.0.1:3000/pro_img/pro_img_03_05.jpg');

insert into pro_img(pgid,pid,img_url) values(null,28,'http://127.0.0.1:3000/pro_img/pro_img_04_01.jpg');
insert into pro_img(pgid,pid,img_url) values(null,28,'http://127.0.0.1:3000/pro_img/pro_img_04_02.jpg');
insert into pro_img(pgid,pid,img_url) values(null,28,'http://127.0.0.1:3000/pro_img/pro_img_04_03.jpg');
insert into pro_img(pgid,pid,img_url) values(null,28,'http://127.0.0.1:3000/pro_img/pro_img_04_04.jpg');
insert into pro_img(pgid,pid,img_url) values(null,28,'http://127.0.0.1:3000/pro_img/pro_img_04_05.jpg');



insert into product(pid,title,subtitle,old_price,price,detail) values(null,'【13号64GB领券减100元】华为HONOR/荣耀 荣耀8X全面屏手机屏占比高达91%*智能手机官网游戏青春学生官方旗舰','1月13日本链接64GB版领券立省100元',1399.00,1289.00,'品牌名称： honor/荣耀 产品参数：证书编号：2018011606104531 证书状态：有效 产品名称：TD-LTE数字移动电话机3C 规格型号：JSN-AL00（开关电源适配器：HW-050200C01-输出：5VDC/2A-开关电源 产品名称：honor/荣耀 荣耀8X型号： 荣耀8X机身颜色:幻夜黑、魅海蓝、梦幻紫、魅焰红、幻影蓝 运行内存RAM: 4GB/6GB 存储容量:4+64GB/6+64GB/6+128GB 网络模式:双卡双待 CPU型号: Kirin/710*包含Kirin710和Kirin710F');
insert into product(pid,title,subtitle,old_price,price,detail) values(null,'【14号64GB领券减100元】华为HONOR/荣耀 荣耀8X全面屏手机屏占比高达91%*智能手机官网游戏青春学生官方旗舰','1月13日本链接64GB版领券立省100元',1399.00,1289.00,'品牌名称： honor/荣耀 产品参数：证书编号：2018011606104531 证书状态：有效 产品名称：TD-LTE数字移动电话机3C 规格型号：JSN-AL00（开关电源适配器：HW-050200C01-输出：5VDC/2A-开关电源 产品名称：honor/荣耀 荣耀8X型号： 荣耀8X机身颜色:幻夜黑、魅海蓝、梦幻紫、魅焰红、幻影蓝 运行内存RAM: 4GB/6GB 存储容量:4+64GB/6+64GB/6+128GB 网络模式:双卡双待 CPU型号: Kirin/710*包含Kirin710和Kirin710F');
insert into product(pid,title,subtitle,old_price,price,detail) values(null,'【15号64GB领券减100元】华为HONOR/荣耀 荣耀8X全面屏手机屏占比高达91%*智能手机官网游戏青春学生官方旗舰','1月13日本链接64GB版领券立省100元',1399.00,1289.00,'品牌名称： honor/荣耀 产品参数：证书编号：2018011606104531 证书状态：有效 产品名称：TD-LTE数字移动电话机3C 规格型号：JSN-AL00（开关电源适配器：HW-050200C01-输出：5VDC/2A-开关电源 产品名称：honor/荣耀 荣耀8X型号： 荣耀8X机身颜色:幻夜黑、魅海蓝、梦幻紫、魅焰红、幻影蓝 运行内存RAM: 4GB/6GB 存储容量:4+64GB/6+64GB/6+128GB 网络模式:双卡双待 CPU型号: Kirin/710*包含Kirin710和Kirin710F');
insert into product(pid,title,subtitle,old_price,price,detail) values(null,'【16号64GB领券减100元】华为HONOR/荣耀 荣耀8X全面屏手机屏占比高达91%*智能手机官网游戏青春学生官方旗舰','1月13日本链接64GB版领券立省100元',1399.00,1289.00,'品牌名称： honor/荣耀 产品参数：证书编号：2018011606104531 证书状态：有效 产品名称：TD-LTE数字移动电话机3C 规格型号：JSN-AL00（开关电源适配器：HW-050200C01-输出：5VDC/2A-开关电源 产品名称：honor/荣耀 荣耀8X型号： 荣耀8X机身颜色:幻夜黑、魅海蓝、梦幻紫、魅焰红、幻影蓝 运行内存RAM: 4GB/6GB 存储容量:4+64GB/6+64GB/6+128GB 网络模式:双卡双待 CPU型号: Kirin/710*包含Kirin710和Kirin710F');
insert into product(pid,title,subtitle,old_price,price,detail) values(null,'【17号64GB领券减100元】华为HONOR/荣耀 荣耀8X全面屏手机屏占比高达91%*智能手机官网游戏青春学生官方旗舰','1月13日本链接64GB版领券立省100元',1399.00,1289.00,'品牌名称： honor/荣耀 产品参数：证书编号：2018011606104531 证书状态：有效 产品名称：TD-LTE数字移动电话机3C 规格型号：JSN-AL00（开关电源适配器：HW-050200C01-输出：5VDC/2A-开关电源 产品名称：honor/荣耀 荣耀8X型号： 荣耀8X机身颜色:幻夜黑、魅海蓝、梦幻紫、魅焰红、幻影蓝 运行内存RAM: 4GB/6GB 存储容量:4+64GB/6+64GB/6+128GB 网络模式:双卡双待 CPU型号: Kirin/710*包含Kirin710和Kirin710F');
insert into product(pid,title,subtitle,old_price,price,detail) values(null,'【18号64GB领券减100元】华为HONOR/荣耀 荣耀8X全面屏手机屏占比高达91%*智能手机官网游戏青春学生官方旗舰','1月13日本链接64GB版领券立省100元',1399.00,1289.00,'品牌名称： honor/荣耀 产品参数：证书编号：2018011606104531 证书状态：有效 产品名称：TD-LTE数字移动电话机3C 规格型号：JSN-AL00（开关电源适配器：HW-050200C01-输出：5VDC/2A-开关电源 产品名称：honor/荣耀 荣耀8X型号： 荣耀8X机身颜色:幻夜黑、魅海蓝、梦幻紫、魅焰红、幻影蓝 运行内存RAM: 4GB/6GB 存储容量:4+64GB/6+64GB/6+128GB 网络模式:双卡双待 CPU型号: Kirin/710*包含Kirin710和Kirin710F');
insert into product(pid,title,subtitle,old_price,price,detail) values(null,'【19号64GB领券减100元】华为HONOR/荣耀 荣耀8X全面屏手机屏占比高达91%*智能手机官网游戏青春学生官方旗舰','1月13日本链接64GB版领券立省100元',1399.00,1289.00,'品牌名称： honor/荣耀 产品参数：证书编号：2018011606104531 证书状态：有效 产品名称：TD-LTE数字移动电话机3C 规格型号：JSN-AL00（开关电源适配器：HW-050200C01-输出：5VDC/2A-开关电源 产品名称：honor/荣耀 荣耀8X型号： 荣耀8X机身颜色:幻夜黑、魅海蓝、梦幻紫、魅焰红、幻影蓝 运行内存RAM: 4GB/6GB 存储容量:4+64GB/6+64GB/6+128GB 网络模式:双卡双待 CPU型号: Kirin/710*包含Kirin710和Kirin710F');
insert into product(pid,title,subtitle,old_price,price,detail) values(null,'【20号64GB领券减100元】华为HONOR/荣耀 荣耀8X全面屏手机屏占比高达91%*智能手机官网游戏青春学生官方旗舰','1月13日本链接64GB版领券立省100元',1399.00,1289.00,'品牌名称： honor/荣耀 产品参数：证书编号：2018011606104531 证书状态：有效 产品名称：TD-LTE数字移动电话机3C 规格型号：JSN-AL00（开关电源适配器：HW-050200C01-输出：5VDC/2A-开关电源 产品名称：honor/荣耀 荣耀8X型号： 荣耀8X机身颜色:幻夜黑、魅海蓝、梦幻紫、魅焰红、幻影蓝 运行内存RAM: 4GB/6GB 存储容量:4+64GB/6+64GB/6+128GB 网络模式:双卡双待 CPU型号: Kirin/710*包含Kirin710和Kirin710F');
insert into product(pid,title,subtitle,old_price,price,detail) values(null,'【21号64GB领券减100元】华为HONOR/荣耀 荣耀8X全面屏手机屏占比高达91%*智能手机官网游戏青春学生官方旗舰','1月13日本链接64GB版领券立省100元',1399.00,1289.00,'品牌名称： honor/荣耀 产品参数：证书编号：2018011606104531 证书状态：有效 产品名称：TD-LTE数字移动电话机3C 规格型号：JSN-AL00（开关电源适配器：HW-050200C01-输出：5VDC/2A-开关电源 产品名称：honor/荣耀 荣耀8X型号： 荣耀8X机身颜色:幻夜黑、魅海蓝、梦幻紫、魅焰红、幻影蓝 运行内存RAM: 4GB/6GB 存储容量:4+64GB/6+64GB/6+128GB 网络模式:双卡双待 CPU型号: Kirin/710*包含Kirin710和Kirin710F');
insert into product(pid,title,subtitle,old_price,price,detail) values(null,'【22号64GB领券减100元】华为HONOR/荣耀 荣耀8X全面屏手机屏占比高达91%*智能手机官网游戏青春学生官方旗舰','1月13日本链接64GB版领券立省100元',1399.00,1289.00,'品牌名称： honor/荣耀 产品参数：证书编号：2018011606104531 证书状态：有效 产品名称：TD-LTE数字移动电话机3C 规格型号：JSN-AL00（开关电源适配器：HW-050200C01-输出：5VDC/2A-开关电源 产品名称：honor/荣耀 荣耀8X型号： 荣耀8X机身颜色:幻夜黑、魅海蓝、梦幻紫、魅焰红、幻影蓝 运行内存RAM: 4GB/6GB 存储容量:4+64GB/6+64GB/6+128GB 网络模式:双卡双待 CPU型号: Kirin/710*包含Kirin710和Kirin710F');
insert into product(pid,title,subtitle,old_price,price,detail) values(null,'【23号64GB领券减100元】华为HONOR/荣耀 荣耀8X全面屏手机屏占比高达91%*智能手机官网游戏青春学生官方旗舰','1月13日本链接64GB版领券立省100元',1399.00,1289.00,'品牌名称： honor/荣耀 产品参数：证书编号：2018011606104531 证书状态：有效 产品名称：TD-LTE数字移动电话机3C 规格型号：JSN-AL00（开关电源适配器：HW-050200C01-输出：5VDC/2A-开关电源 产品名称：honor/荣耀 荣耀8X型号： 荣耀8X机身颜色:幻夜黑、魅海蓝、梦幻紫、魅焰红、幻影蓝 运行内存RAM: 4GB/6GB 存储容量:4+64GB/6+64GB/6+128GB 网络模式:双卡双待 CPU型号: Kirin/710*包含Kirin710和Kirin710F');
insert into product(pid,title,subtitle,old_price,price,detail) values(null,'【24号64GB领券减100元】华为HONOR/荣耀 荣耀8X全面屏手机屏占比高达91%*智能手机官网游戏青春学生官方旗舰','1月13日本链接64GB版领券立省100元',1399.00,1289.00,'品牌名称： honor/荣耀 产品参数：证书编号：2018011606104531 证书状态：有效 产品名称：TD-LTE数字移动电话机3C 规格型号：JSN-AL00（开关电源适配器：HW-050200C01-输出：5VDC/2A-开关电源 产品名称：honor/荣耀 荣耀8X型号： 荣耀8X机身颜色:幻夜黑、魅海蓝、梦幻紫、魅焰红、幻影蓝 运行内存RAM: 4GB/6GB 存储容量:4+64GB/6+64GB/6+128GB 网络模式:双卡双待 CPU型号: Kirin/710*包含Kirin710和Kirin710F');
insert into product(pid,title,subtitle,old_price,price,detail) values(null,'【25号64GB领券减100元】华为HONOR/荣耀 荣耀8X全面屏手机屏占比高达91%*智能手机官网游戏青春学生官方旗舰','1月13日本链接64GB版领券立省100元',1399.00,1289.00,'品牌名称： honor/荣耀 产品参数：证书编号：2018011606104531 证书状态：有效 产品名称：TD-LTE数字移动电话机3C 规格型号：JSN-AL00（开关电源适配器：HW-050200C01-输出：5VDC/2A-开关电源 产品名称：honor/荣耀 荣耀8X型号： 荣耀8X机身颜色:幻夜黑、魅海蓝、梦幻紫、魅焰红、幻影蓝 运行内存RAM: 4GB/6GB 存储容量:4+64GB/6+64GB/6+128GB 网络模式:双卡双待 CPU型号: Kirin/710*包含Kirin710和Kirin710F');
insert into product(pid,title,subtitle,old_price,price,detail) values(null,'【26号64GB领券减100元】华为HONOR/荣耀 荣耀8X全面屏手机屏占比高达91%*智能手机官网游戏青春学生官方旗舰','1月13日本链接64GB版领券立省100元',1399.00,1289.00,'品牌名称： honor/荣耀 产品参数：证书编号：2018011606104531 证书状态：有效 产品名称：TD-LTE数字移动电话机3C 规格型号：JSN-AL00（开关电源适配器：HW-050200C01-输出：5VDC/2A-开关电源 产品名称：honor/荣耀 荣耀8X型号： 荣耀8X机身颜色:幻夜黑、魅海蓝、梦幻紫、魅焰红、幻影蓝 运行内存RAM: 4GB/6GB 存储容量:4+64GB/6+64GB/6+128GB 网络模式:双卡双待 CPU型号: Kirin/710*包含Kirin710和Kirin710F');
insert into product(pid,title,subtitle,old_price,price,detail) values(null,'【27号64GB领券减100元】华为HONOR/荣耀 荣耀8X全面屏手机屏占比高达91%*智能手机官网游戏青春学生官方旗舰','1月13日本链接64GB版领券立省100元',1399.00,1289.00,'品牌名称： honor/荣耀 产品参数：证书编号：2018011606104531 证书状态：有效 产品名称：TD-LTE数字移动电话机3C 规格型号：JSN-AL00（开关电源适配器：HW-050200C01-输出：5VDC/2A-开关电源 产品名称：honor/荣耀 荣耀8X型号： 荣耀8X机身颜色:幻夜黑、魅海蓝、梦幻紫、魅焰红、幻影蓝 运行内存RAM: 4GB/6GB 存储容量:4+64GB/6+64GB/6+128GB 网络模式:双卡双待 CPU型号: Kirin/710*包含Kirin710和Kirin710F');
insert into product(pid,title,subtitle,old_price,price,detail) values(null,'【28号64GB领券减100元】华为HONOR/荣耀 荣耀8X全面屏手机屏占比高达91%*智能手机官网游戏青春学生官方旗舰','1月13日本链接64GB版领券立省100元',1399.00,1289.00,'品牌名称： honor/荣耀 产品参数：证书编号：2018011606104531 证书状态：有效 产品名称：TD-LTE数字移动电话机3C 规格型号：JSN-AL00（开关电源适配器：HW-050200C01-输出：5VDC/2A-开关电源 产品名称：honor/荣耀 荣耀8X型号： 荣耀8X机身颜色:幻夜黑、魅海蓝、梦幻紫、魅焰红、幻影蓝 运行内存RAM: 4GB/6GB 存储容量:4+64GB/6+64GB/6+128GB 网络模式:双卡双待 CPU型号: Kirin/710*包含Kirin710和Kirin710F');
insert into product(pid,title,subtitle,old_price,price,detail) values(null,'【29号64GB领券减100元】华为HONOR/荣耀 荣耀8X全面屏手机屏占比高达91%*智能手机官网游戏青春学生官方旗舰','1月13日本链接64GB版领券立省100元',1399.00,1289.00,'品牌名称： honor/荣耀 产品参数：证书编号：2018011606104531 证书状态：有效 产品名称：TD-LTE数字移动电话机3C 规格型号：JSN-AL00（开关电源适配器：HW-050200C01-输出：5VDC/2A-开关电源 产品名称：honor/荣耀 荣耀8X型号： 荣耀8X机身颜色:幻夜黑、魅海蓝、梦幻紫、魅焰红、幻影蓝 运行内存RAM: 4GB/6GB 存储容量:4+64GB/6+64GB/6+128GB 网络模式:双卡双待 CPU型号: Kirin/710*包含Kirin710和Kirin710F');
insert into product(pid,title,subtitle,old_price,price,detail) values(null,'【30号64GB领券减100元】华为HONOR/荣耀 荣耀8X全面屏手机屏占比高达91%*智能手机官网游戏青春学生官方旗舰','1月13日本链接64GB版领券立省100元',1399.00,1289.00,'品牌名称： honor/荣耀 产品参数：证书编号：2018011606104531 证书状态：有效 产品名称：TD-LTE数字移动电话机3C 规格型号：JSN-AL00（开关电源适配器：HW-050200C01-输出：5VDC/2A-开关电源 产品名称：honor/荣耀 荣耀8X型号： 荣耀8X机身颜色:幻夜黑、魅海蓝、梦幻紫、魅焰红、幻影蓝 运行内存RAM: 4GB/6GB 存储容量:4+64GB/6+64GB/6+128GB 网络模式:双卡双待 CPU型号: Kirin/710*包含Kirin710和Kirin710F');
insert into product(pid,title,subtitle,old_price,price,detail) values(null,'【01号64GB领券减100元】华为HONOR/荣耀 荣耀8X全面屏手机屏占比高达91%*智能手机官网游戏青春学生官方旗舰','1月13日本链接64GB版领券立省100元',1399.00,1289.00,'品牌名称： honor/荣耀 产品参数：证书编号：2018011606104531 证书状态：有效 产品名称：TD-LTE数字移动电话机3C 规格型号：JSN-AL00（开关电源适配器：HW-050200C01-输出：5VDC/2A-开关电源 产品名称：honor/荣耀 荣耀8X型号： 荣耀8X机身颜色:幻夜黑、魅海蓝、梦幻紫、魅焰红、幻影蓝 运行内存RAM: 4GB/6GB 存储容量:4+64GB/6+64GB/6+128GB 网络模式:双卡双待 CPU型号: Kirin/710*包含Kirin710和Kirin710F');
insert into product(pid,title,subtitle,old_price,price,detail) values(null,'【02号64GB领券减100元】华为HONOR/荣耀 荣耀8X全面屏手机屏占比高达91%*智能手机官网游戏青春学生官方旗舰','1月13日本链接64GB版领券立省100元',1399.00,1289.00,'品牌名称： honor/荣耀 产品参数：证书编号：2018011606104531 证书状态：有效 产品名称：TD-LTE数字移动电话机3C 规格型号：JSN-AL00（开关电源适配器：HW-050200C01-输出：5VDC/2A-开关电源 产品名称：honor/荣耀 荣耀8X型号： 荣耀8X机身颜色:幻夜黑、魅海蓝、梦幻紫、魅焰红、幻影蓝 运行内存RAM: 4GB/6GB 存储容量:4+64GB/6+64GB/6+128GB 网络模式:双卡双待 CPU型号: Kirin/710*包含Kirin710和Kirin710F');
insert into product(pid,title,subtitle,old_price,price,detail) values(null,'【03号64GB领券减100元】华为HONOR/荣耀 荣耀8X全面屏手机屏占比高达91%*智能手机官网游戏青春学生官方旗舰','1月13日本链接64GB版领券立省100元',1399.00,1289.00,'品牌名称： honor/荣耀 产品参数：证书编号：2018011606104531 证书状态：有效 产品名称：TD-LTE数字移动电话机3C 规格型号：JSN-AL00（开关电源适配器：HW-050200C01-输出：5VDC/2A-开关电源 产品名称：honor/荣耀 荣耀8X型号： 荣耀8X机身颜色:幻夜黑、魅海蓝、梦幻紫、魅焰红、幻影蓝 运行内存RAM: 4GB/6GB 存储容量:4+64GB/6+64GB/6+128GB 网络模式:双卡双待 CPU型号: Kirin/710*包含Kirin710和Kirin710F');
insert into product(pid,title,subtitle,old_price,price,detail) values(null,'【04号64GB领券减100元】华为HONOR/荣耀 荣耀8X全面屏手机屏占比高达91%*智能手机官网游戏青春学生官方旗舰','1月13日本链接64GB版领券立省100元',1399.00,1289.00,'品牌名称： honor/荣耀 产品参数：证书编号：2018011606104531 证书状态：有效 产品名称：TD-LTE数字移动电话机3C 规格型号：JSN-AL00（开关电源适配器：HW-050200C01-输出：5VDC/2A-开关电源 产品名称：honor/荣耀 荣耀8X型号： 荣耀8X机身颜色:幻夜黑、魅海蓝、梦幻紫、魅焰红、幻影蓝 运行内存RAM: 4GB/6GB 存储容量:4+64GB/6+64GB/6+128GB 网络模式:双卡双待 CPU型号: Kirin/710*包含Kirin710和Kirin710F');
insert into product(pid,title,subtitle,old_price,price,detail) values(null,'【05号64GB领券减100元】华为HONOR/荣耀 荣耀8X全面屏手机屏占比高达91%*智能手机官网游戏青春学生官方旗舰','1月13日本链接64GB版领券立省100元',1399.00,1289.00,'品牌名称： honor/荣耀 产品参数：证书编号：2018011606104531 证书状态：有效 产品名称：TD-LTE数字移动电话机3C 规格型号：JSN-AL00（开关电源适配器：HW-050200C01-输出：5VDC/2A-开关电源 产品名称：honor/荣耀 荣耀8X型号： 荣耀8X机身颜色:幻夜黑、魅海蓝、梦幻紫、魅焰红、幻影蓝 运行内存RAM: 4GB/6GB 存储容量:4+64GB/6+64GB/6+128GB 网络模式:双卡双待 CPU型号: Kirin/710*包含Kirin710和Kirin710F');
insert into product(pid,title,subtitle,old_price,price,detail) values(null,'【06号64GB领券减100元】华为HONOR/荣耀 荣耀8X全面屏手机屏占比高达91%*智能手机官网游戏青春学生官方旗舰','1月13日本链接64GB版领券立省100元',1399.00,1289.00,'品牌名称： honor/荣耀 产品参数：证书编号：2018011606104531 证书状态：有效 产品名称：TD-LTE数字移动电话机3C 规格型号：JSN-AL00（开关电源适配器：HW-050200C01-输出：5VDC/2A-开关电源 产品名称：honor/荣耀 荣耀8X型号： 荣耀8X机身颜色:幻夜黑、魅海蓝、梦幻紫、魅焰红、幻影蓝 运行内存RAM: 4GB/6GB 存储容量:4+64GB/6+64GB/6+128GB 网络模式:双卡双待 CPU型号: Kirin/710*包含Kirin710和Kirin710F');
insert into product(pid,title,subtitle,old_price,price,detail) values(null,'【07号64GB领券减100元】华为HONOR/荣耀 荣耀8X全面屏手机屏占比高达91%*智能手机官网游戏青春学生官方旗舰','1月13日本链接64GB版领券立省100元',1399.00,1289.00,'品牌名称： honor/荣耀 产品参数：证书编号：2018011606104531 证书状态：有效 产品名称：TD-LTE数字移动电话机3C 规格型号：JSN-AL00（开关电源适配器：HW-050200C01-输出：5VDC/2A-开关电源 产品名称：honor/荣耀 荣耀8X型号： 荣耀8X机身颜色:幻夜黑、魅海蓝、梦幻紫、魅焰红、幻影蓝 运行内存RAM: 4GB/6GB 存储容量:4+64GB/6+64GB/6+128GB 网络模式:双卡双待 CPU型号: Kirin/710*包含Kirin710和Kirin710F');
insert into product(pid,title,subtitle,old_price,price,detail) values(null,'【08号64GB领券减100元】华为HONOR/荣耀 荣耀8X全面屏手机屏占比高达91%*智能手机官网游戏青春学生官方旗舰','1月13日本链接64GB版领券立省100元',1399.00,1289.00,'品牌名称： honor/荣耀 产品参数：证书编号：2018011606104531 证书状态：有效 产品名称：TD-LTE数字移动电话机3C 规格型号：JSN-AL00（开关电源适配器：HW-050200C01-输出：5VDC/2A-开关电源 产品名称：honor/荣耀 荣耀8X型号： 荣耀8X机身颜色:幻夜黑、魅海蓝、梦幻紫、魅焰红、幻影蓝 运行内存RAM: 4GB/6GB 存储容量:4+64GB/6+64GB/6+128GB 网络模式:双卡双待 CPU型号: Kirin/710*包含Kirin710和Kirin710F');
insert into product(pid,title,subtitle,old_price,price,detail) values(null,'【09号64GB领券减100元】华为HONOR/荣耀 荣耀8X全面屏手机屏占比高达91%*智能手机官网游戏青春学生官方旗舰','1月13日本链接64GB版领券立省100元',1399.00,1289.00,'品牌名称： honor/荣耀 产品参数：证书编号：2018011606104531 证书状态：有效 产品名称：TD-LTE数字移动电话机3C 规格型号：JSN-AL00（开关电源适配器：HW-050200C01-输出：5VDC/2A-开关电源 产品名称：honor/荣耀 荣耀8X型号： 荣耀8X机身颜色:幻夜黑、魅海蓝、梦幻紫、魅焰红、幻影蓝 运行内存RAM: 4GB/6GB 存储容量:4+64GB/6+64GB/6+128GB 网络模式:双卡双待 CPU型号: Kirin/710*包含Kirin710和Kirin710F');
insert into product(pid,title,subtitle,old_price,price,detail) values(null,'【10号64GB领券减100元】华为HONOR/荣耀 荣耀8X全面屏手机屏占比高达91%*智能手机官网游戏青春学生官方旗舰','1月13日本链接64GB版领券立省100元',1399.00,1289.00,'品牌名称： honor/荣耀 产品参数：证书编号：2018011606104531 证书状态：有效 产品名称：TD-LTE数字移动电话机3C 规格型号：JSN-AL00（开关电源适配器：HW-050200C01-输出：5VDC/2A-开关电源 产品名称：honor/荣耀 荣耀8X型号： 荣耀8X机身颜色:幻夜黑、魅海蓝、梦幻紫、魅焰红、幻影蓝 运行内存RAM: 4GB/6GB 存储容量:4+64GB/6+64GB/6+128GB 网络模式:双卡双待 CPU型号: Kirin/710*包含Kirin710和Kirin710F');


#购物车 编号id、用户id、商品id、商品数量、是否付款、是否在购物车显示——如果是直接购买，将不在购物车显示
drop table if exists cart;
create table cart(
    cid int primary key auto_increment,
    uid int,
    pid int,
    count int,
    isPay int, 
    isShow int
)



