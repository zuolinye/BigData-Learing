-- Create table 学生信息
create table STUDENT
(
  STUDENT_NO     VARCHAR2(10) not null,
  STUDENT_NAME   VARCHAR2(20),
  STUDENT_AGE    NUMBER(2),
  STUDENT_GENDER VARCHAR2(5)
);
-- Add comments to the table 
comment on table STUDENT
  is '学生信息表';
-- Add comments to the columns 
comment on column STUDENT.STUDENT_NO
  is '学号';
comment on column STUDENT.STUDENT_NAME
  is '姓名';
comment on column STUDENT.STUDENT_AGE
  is '年龄';
comment on column STUDENT.STUDENT_GENDER
  is '性别';
-- Create/Recreate primary, unique and foreign key constraints 
alter table STUDENT add primary key (STUDENT_NO);

-- Create table 教师信息表
create table TEACHER
(
  TEACHER_NO   VARCHAR2(10) not null,
  TEACHER_NAME VARCHAR2(20),
  MANAGER_NO   VARCHAR2(10)
);
-- Add comments to the table 
comment on table TEACHER
  is '教师信息表';
-- Add comments to the columns 
comment on column TEACHER.TEACHER_NO
  is '教师编号';
comment on column TEACHER.TEACHER_NAME
  is '教师名称';
comment on column TEACHER.MANAGER_NO
  is '上级编号';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TEACHER add primary key (TEACHER_NO);

-- Create table 课程信息表
create table COURSE
(
  COURSE_NO   VARCHAR2(10) not null,
  COURSE_NAME VARCHAR2(20),
  TEACHER_NO  VARCHAR2(20) not null
);
-- Add comments to the table 
comment on table COURSE
  is '课程信息表';
-- Add comments to the columns 
comment on column COURSE.COURSE_NO
  is '课程号';
comment on column COURSE.COURSE_NAME
  is '课程名称';
comment on column COURSE.TEACHER_NO
  is '教师编号';
-- Create/Recreate primary, unique and foreign key constraints 
alter table COURSE add constraint PK_COURSE primary key (COURSE_NO, TEACHER_NO);

-- Create table 成绩信息表
create table GRADE
(
  STUDENT_NO VARCHAR2(10) not null,
  COURSE_NO  VARCHAR2(10) not null,
  CORE       NUMBER(4,2)
);
-- Add comments to the table 
comment on table GRADE
  is '学生成绩表';
-- Add comments to the columns 
comment on column GRADE.STUDENT_NO
  is '学号';
comment on column GRADE.COURSE_NO
  is '课程号';
comment on column GRADE.CORE
  is '分数';
-- Create/Recreate primary, unique and foreign key constraints 
alter table GRADE add constraint PK_SC primary key (STUDENT_NO, COURSE_NO);


/*******初始化学生表的数据******/
insert into STUDENT values ('s001','张三',23,'男');
insert into STUDENT values ('s002','李四',23,'男');
insert into STUDENT values ('s003','吴鹏',25,'男');
insert into STUDENT values ('s004','琴沁',20,'女');
insert into STUDENT values ('s005','王丽',20,'女');
insert into STUDENT values ('s006','李波',21,'男');
insert into STUDENT values ('s007','刘玉',21,'男');
insert into STUDENT values ('s008','萧蓉',21,'女');
insert into STUDENT values ('s009','陈萧晓',23,'女');
insert into STUDENT values ('s010','陈美',22,'女');
commit;
/******************初始化教师表***********************/
insert into TEACHER values ('t001', '刘阳','');
insert into TEACHER values ('t002', '谌燕','t001');
insert into TEACHER values ('t003', '胡明星','t002');
commit;
/***************初始化课程表****************************/
insert into COURSE values ('c001','J2SE','t002');
insert into COURSE values ('c002','Java Web','t002');
insert into COURSE values ('c003','SSH','t001');
insert into COURSE values ('c004','Oracle','t001');
insert into COURSE values ('c005','SQL SERVER 2005','t003');
insert into COURSE values ('c006','C#','t003');
insert into COURSE values ('c007','JavaScript','t002');
insert into COURSE values ('c008','DIV+CSS','t001');
insert into COURSE values ('c009','PHP','t003');
insert into COURSE values ('c010','EJB3.0','t002');
commit;
/***************初始化成绩表***********************/
insert into GRADE values ('s001','c001',58.9);
insert into GRADE values ('s002','c001',80.9);
insert into GRADE values ('s003','c001',81.9);
insert into GRADE values ('s004','c001',60.9);
insert into GRADE values ('s001','c002',82.9);
insert into GRADE values ('s002','c002',72.9);
insert into GRADE values ('s003','c002',81.9);
insert into GRADE values ('s001','c003','59');
commit;
