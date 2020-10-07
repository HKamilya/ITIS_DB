# 1. вывод всех студентов id группы которых равен 1
select *
from students
where group_id = 1;

# 2. вывод двух первых преподавателей
select *
from teachers
limit 2;

# 3. вывод названий групп к которым не прикреплены преподаватели с id=1 и id=2
select name
from `groups`
where teacher_id != 1
  and teacher_id != 2;

# 4. вывод групп по названию
select name
from `groups`
order by name;

# 5. вывод 3 последних групп
select name
from `groups`
order by id desc
limit 3;

# 6. сортировка студентов по группам в порядке убывания
select *
from students
order by group_id;

# 7. группировка студентов по группам
select group_id
from students
group by group_id;

# 8. поиск всех учителей с именем Анна
select *
from teachers
where name = 'Anna';

# 9. вывод трех студентов начиная со второго
select *
from students
limit 1, 3;

# 10. вывод групп количество студентов в которых меньше 20
select group_id
from students
group by group_id
having count(id) < 20;
