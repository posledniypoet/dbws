insert into `groups` (name)
values ('M34391'),
       ('M34381'),
       ('M34371');

insert into Persons(first_name, last_name)
values ('Aleksandr', 'Kalinichev'),
       ('Jeka', 'Chernatskyi'),
       ('Lesha', 'Alasheev'),
       ('Pavel', 'Trifonov'),
       ('Georgiy', 'Korneev');

insert into Students (id, group_id, student_id_card, have_contract)
values (1, 1, 1, false),
       (2, 2, 2, true),
       (3, 3, 3, false);

insert into Lectors (id, scientific_name)
values (4, 'doctor'),
       (5, 'master');

insert into Persons(first_name, last_name)
values ('Vitya', 'Slotin'),
       ('Petya', 'Pravin');

insert into Students (id, group_id, student_id_card, have_contract)
values (4, 2, 4, false),
       (5, 2, 5, true);

# Base select
select student_id_card, first_name, last_name
from Students,
     Persons
where Students.id = Persons.id;

# Select with join (full student info from some group)
SELECT Persons.id, first_name, last_name, student_id_card, gr.name
FROM Persons
         INNER JOIN Students S on Persons.id = S.id
         INNER JOIN `groups` gr on S.group_id = gr.id
where group_id = '2';

#Aggreagte function count( counting number of people sith same first_name)
SELECT id, first_name, last_name, COUNT(first_name)
FROM persons
GROUP BY id;

#Group by
SELECT COUNT(group_id), name
from Students
         inner join `groups` gr on Students.group_id = gr.id
group by group_id
having count(group_id) > 1
