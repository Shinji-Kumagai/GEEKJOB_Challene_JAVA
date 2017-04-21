-- 課題 １
use challenge_db;
create table profiles (
    profilesID int primary key auto_increment,
    name varchar(255),
    tell varchar(255),
    age int,
    birthday date
);

-- database の 文字コードと このファイルの文字コードがあっていない場合  Data too long for column 'name' at row 1 のエラーが出る
insert into profiles (name, tell, age, birthday) values
    ('田中 実', '012-345-6789', 30, '1994-02-01'),
    ('鈴木 茂', '090-1122-3344', 37, '1987-08-12'),
    ('鈴木 実', '080-5566-7788', 24, '2000-12-24'),
    ('佐藤 清', '012-0987-6543', 19, '2005-08-01'),
    ('高橋 清', '090-9900-1234', 24, '2000-12-24') ;


-- 課題 ２
select * from profiles where profilesID = 3;

-- 課題 ３
select * from profiles where name = "高橋 清";

-- 課題 ４
select * from profiles where age = 24;

-- 課題 ５
select * from profiles where age > 24;

-- 課題 ６
select * from profiles where name like "%実%";

-- 課題 ７
update profiles set name = "吉田 茂" where profilesID = 2;
select * from profiles where profilesID = 2;

-- 課題 ８
delete from profiles where birthday = "2000-12-24";
select * from profiles;

-- 課題 ９
create table station (
    stationID int primary key auto_increment,
    stationName varchar(255)
);

create table department (
    departmentID int primary key auto_increment,
    departmentName varchar(255)
);

create table user (
    profilesID int primary key auto_increment,
    name varchar(255),
    tell varchar(255),
    age int,
    birthday date,
    departmentID int,
    stationID int,
    foreign key (`departmentID`) references `department` (`departmentID`),
    foreign key (`stationID`) references `station` (`stationID`)
);

insert into station (stationName) values
    ('九段下'),
    ('永田町'),
    ('渋谷'),
    ('神保町'),
    ('上井草')
    ;

insert into department (departmentName) values
    ('開発部'),
    ('営業部'),
    ('総務部')
    ;

insert into user (name, tell, age, birthday, departmentID, stationID) values
    ('田中 実', '012-345-6789', 30, '1994-02-01', 3, 1),
    ('鈴木 茂', '090-1122-3344', 37, '1987-08-12', 3, 4),
    ('鈴木 実', '080-5566-7788', 24, '2000-12-24', 2, 5),
    ('佐藤 清', '012-0987-6543', 19, '2005-08-01', 1, 5),
    ('高橋 清', '090-9900-1234', 24, '2000-12-24', 3, 5)
    ;

select * from user;
select * from department;
select * from station;

-- drop table user;
-- drop table department, station;
