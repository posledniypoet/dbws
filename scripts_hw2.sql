create table if not exists `groups`
(
    id   int AUTO_INCREMENT,
    name char(6) not null,

    primary key (id)
);

create table if not exists Persons
(
    id         int AUTO_INCREMENT,
    first_name varchar(30) not null,
    last_name  varchar(30) not null,
    birthday   date,
    email      varchar(50),

    primary key (id),

    unique (email)
);

create table if not exists Lectors
(
    id              int,
    scientific_name varchar(30) not null,

    primary key (id),

    foreign key (id) references Persons (id)
);

create table if not exists Students
(
    id              int,
    group_id        int,
    student_id_card int,
    have_contract   bool not null,

    primary key (id),

    unique (student_id_card),

    foreign key (id) references Persons (id),
    foreign key (group_id) references `groups` (id)
);

create table if not exists Subjects
(
    id        int AUTO_INCREMENT,
    name      varchar(50) not null,
    lector_id int,

    primary key (id),

    foreign key (lector_id) references Lectors (id)
);

create table if not exists Marks
(
    student_id int,
    subject_id int,
    mark       char not null,
    date_registered date not null,

    primary key (student_id, subject_id),

    foreign key (student_id) references Students (id),
    foreign key (subject_id) references Subjects (id)
);

create table if not exists RELOAD_JOBS_TAB
(
    ID                    INTEGER(20)                  not null
        primary key AUTO_INCREMENT,
    START_DATE              TIMESTAMP default now() not null,
    LAST_UPDATE_DATE               TIMESTAMP       default now() not null,
    STATUS                VARCHAR(20) not null,
    constraint STATUS_CH
        check (STATUS IN ('DONE', 'STARTED', 'WAITING', 'ERROR')),
    TYPE                  VARCHAR(5) not null,
    constraint TYPE_CH
        check (TYPE IN ('DATE', 'ID')),
    MESSAGE_ID            INTEGER(20)      not null
);

create table if not exists RELOAD_JOBS_DATE_TAB
(
    ID                    INTEGER(20)                 not null
        primary key AUTO_INCREMENT,
    DATE_FROM              DATE         not null,
    DATE_TO              DATE         not null,
    TRANSACTIONS_RELOAD_ID       INTEGER(20)          not null
);

create table if not exists RELOAD_JOBS_ID_TAB
(
    ID                    INTEGER(20)                  not null
        primary key AUTO_INCREMENT,
    REQUEST_ID              INTEGER(20)        not null,
    TRANSACTIONS_RELOAD_ID       INTEGER(20)          not null
);

create table if not exists RELOAD_MESSAGE_TAB
(
    ID                    VARCHAR(20)                  not null
        primary key,
    RECEIVING_DATE               TIMESTAMP        default now() not null
);
