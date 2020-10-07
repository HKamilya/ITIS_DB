-- 1)Вывести список первых двух id из таблицы students, которые находятся в 3 группе.
select id
from students
where group_id = 3
limit 2;

-- 2)Вывести с 5 по 8 позицию уникальных group_id из таблицы students.
select distinct group_id
from students
limit 4, 4;

-- 3)Вывести id учителей по имени 'Дмитрий' из таблицы teachers, сгрупировав по id.
select id
from teachers
where name = 'Дмитрий'
group by id;

-- 4)Вывести количество учителей по имени 'Елена' из таблицы teachers
select count(name)
from teachers
where name = "Елена";

-- 5)Вывести id и name юзеров и учителей, так чтобы было 2 первых юзера из таблицы user и с 4 по 6 позицию учителей из таблицы teachers, отсортировав полученую таблицу по имени с конца алфавита.
    (select id, name from user limit 2)
    union
    (select id, name from teachers limit 3, 3)
    order by name desc;

-- 6)Вывести отсортированные по алфавиту имена юзеров, id которых меньше 4.
select name
from user
where id < 4
order by name;

-- 7)Вывести первые 10 уникальных названий групп, имеющих одного учителя, которго не зовут 'Амир'.
select distinct g.name
from groups g
         join teachers t on g.teacher_id = t.id and t.name != 'Амир'
limit 10;

-- 8)Вывести id из таблицы groups, имеющих учителей с id = 3 или 5.
select id
from groups
where teacher_id = 3
   or teacher_id = 5;

-- 9)Вывести отсортированный по возрастанию список id учителей из таблицы groups, количество учителей в которых не превышает 3 человек
select teacher_id
from groups
group by teacher_id
having count(teacher_id) <= 3
order by teacher_id;

-- 10)Вывести список из уникальных названий групп кроме 'DataBase' и учителей в них
select distinct name, teacher_id
from groups
group by name, teacher_id
having name != 'DataBase';
