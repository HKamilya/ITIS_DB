1. группировать студентов по группам
select group_id
from students
group by group_id;

2.Вывести id из таблицы groups, имеющих учителей с id = 4
select id
from groups
where teacher_id = 4;

3.вывести 5 студентов, начиная с 10-го
select *
from students
limit 9, 5;

4.Вывести сгрупированный по id список учителей с именем Иван
select id
from teachers
where name = 'Дмитрий'
group by id;

5. Вывести количество групп, в которых более 15 студентов
select count(group_id)
from students
group by group_id
having count(id) > 15;

6. Вывести отсортированные по алфавиту имена пользователей, у которыз id > 10.
select name
from user
where id > 10
order by name;

7. Вывести названия групп с преподавателем, имеющим id 6
select name
from `groups`
where teacher_id = 6

8.Вывести список из первых 5 студентов 7 группы
select id
from students
where group_id = 7
limit 5;

9. Вывести названия 2 первых с конца групп
select name
from `groups`
order by id desc
limit 2;

10.Вывести отсортированный по убыванию список id учителей из таблицы групп, количество учителей в которых не превышает 2 человек
select teacher_id
from groups
group by teacher_id
having count(teacher_id) <= 2
order by teacher_id desc;
