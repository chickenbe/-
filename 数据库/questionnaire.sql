/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2024/7/2 14:02:59                            */
/*==============================================================*/


drop table if exists answer_paper;

drop table if exists answer_question;

drop table if exists answer_question_option;

drop table if exists sys_paper;

drop table if exists sys_question;

drop table if exists sys_question_choice;

drop table if exists sys_user;

/*==============================================================*/
/* Table: answer_paper                                          */
/*==============================================================*/
create table answer_paper
(
   answer_id            int not null auto_increment,
   paper_id             int,
   answer_content       char(128),
   primary key (answer_id)
);

/*==============================================================*/
/* Table: answer_question                                       */
/*==============================================================*/
create table answer_question
(
   answer_id            int not null auto_increment,
   question_id          int,
   answer_question_content char(128),
   answer_person_id     int,
   primary key (answer_id)
);

/*==============================================================*/
/* Table: answer_question_option                                */
/*==============================================================*/
create table answer_question_option
(
   answer_question_option_id int not null auto_increment,
   choice_id            int,
   question_id          int,
   answer_person_id     int,
   primary key (answer_question_option_id)
);

/*==============================================================*/
/* Table: sys_paper                                             */
/*==============================================================*/
create table sys_paper
(
   paper_id             int not null auto_increment,
   paper_title          text,
   paper_description    text,
   paper_img            char(128),
   paper_order          int,
   paper_status         char(2),
   paper_start_time     timestamp,
   paper_end_time       timestamp,
   paper_create_time    timestamp,
   paper_update_time    timestamp,
   paper_creator_id     int,
   paper_updator_id     int,
   primary key (paper_id)
);

/*==============================================================*/
/* Table: sys_question                                          */
/*==============================================================*/
create table sys_question
(
   question_id          int not null auto_increment,
   paper_id             int,
   question_title       char(64),
   question_description char(64),
   question_type        char(2),
   question_order       int,
   question_require     char(2),
   primary key (question_id)
);

/*==============================================================*/
/* Table: sys_question_choice                                   */
/*==============================================================*/
create table sys_question_choice
(
   choice_id            int not null auto_increment,
   question_id          int,
   choice_text          char(128),
   choice_order         int,
   choice_content       char(128),
   primary key (choice_id)
);

/*==============================================================*/
/* Table: sys_user                                              */
/*==============================================================*/
create table sys_user
(
   user_id              int not null auto_increment,
   usename              char(64),
   password             char(64),
   phone                char(64),
   email                char(64),
   primary key (user_id)
);

alter table answer_paper add constraint FK_Reference_3 foreign key (paper_id)
      references sys_paper (paper_id) on delete restrict on update restrict;

alter table answer_question add constraint FK_Reference_4 foreign key (question_id)
      references sys_question (question_id) on delete restrict on update restrict;

alter table answer_question_option add constraint FK_Reference_5 foreign key (choice_id)
      references sys_question_choice (choice_id) on delete restrict on update restrict;

alter table answer_question_option add constraint FK_Reference_6 foreign key (question_id)
      references sys_question (question_id) on delete restrict on update restrict;

alter table sys_question add constraint FK_Reference_1 foreign key (paper_id)
      references sys_paper (paper_id) on delete restrict on update restrict;

alter table sys_question_choice add constraint FK_Reference_2 foreign key (question_id)
      references sys_question (question_id) on delete restrict on update restrict;

