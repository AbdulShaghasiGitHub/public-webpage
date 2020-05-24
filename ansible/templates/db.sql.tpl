drop database if exists cloud;
create database cloud;
use cloud;

create table users(
	unique_id serial primary key,
	firstname varchar(20),
	lastname varchar(20),
	email varchar(40),
	username varchar(20),
	password char(40)
);