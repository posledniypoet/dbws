create table Groups
(
    id   serial,
    name char(6) not null,

    primary key (id)
);

create table Persons
(
    id         serial,
    first_name varchar(30) not null,
    last_name  varchar(30) not null,
    birthday   date,
    email      varchar(50),

    primary key (id),

    unique (email)
);

create table Lectors
(
    id              int,
    scientific_name varchar(30) not null,

    primary key (id),

    foreign key (id) references Persons (id)
);

create table Students
(
    id              int,
    group_id        int,
    student_id_card serial,
    have_contract   bool not null,

    primary key (id),

    unique (student_id_card),

    foreign key (id) references Persons (id),
    foreign key (group_id) references Groups (id)
);

create table Subjects
(
    id        serial,
    name      varchar(50) not null,
    lector_id int,

    primary key (id),

    foreign key (lector_id) references Lectors (id)
);

create table Marks
(
    student_id int,
    subject_id int,
    mark       char not null,
    date_registered date not null,

    primary key (student_id, subject_id),

    foreign key (student_id) references Students (id),
    foreign key (subject_id) references Subjects (id)
);

create table RELOAD_JOBS_TAB
(
    ID                    INTEGER(20)                  not null
        primary key AUTO_INCREMENT,
    START_DATE              DATE        default sysdate() not null,
    LAST_UPDATE_DATE               DATE       default sysdate() not null,
    STATUS                VARCHAR(20) not null,
    constraint STATUS_CH
        check (STATUS IN ('DONE', 'STARTED', 'WAITING', 'ERROR')),
    TYPE                  VARCHAR(5) not null,
    constraint TYPE_CH
        check (TYPE IN ('DATE', 'ID')),
    MESSAGE_ID            INTEGER(20)      not null
);

create table RELOAD_JOBS_DATE_TAB
(
    ID                    INTEGER(20)                 not null
        primary key AUTO_INCREMENT,
    DATE_FROM              DATE         not null,
    DATE_TO              DATE         not null,
    TRANSACTIONS_RELOAD_ID       INTEGER(20)          not null
);

create table RELOAD_JOBS_ID_TAB
(
    ID                    INTEGER(20)                  not null
        primary key AUTO_INCREMENT,
    REQUEST_ID              INTEGER(20)        not null,
    TRANSACTIONS_RELOAD_ID       INTEGER(20)          not null
);

create table RELOAD_MESSAGE_TAB
(
    ID                    VARCHAR(20)                  not null
        primary key,
    RECEIVING_DATE               DATE        default sysdate() not null
);
