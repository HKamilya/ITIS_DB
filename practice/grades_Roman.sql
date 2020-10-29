select concat(s.name, " ", s.surname, " ", s.lastname) as fullname, g.name, g.year
from ` student ` s join `
group ` g
on s.group_id = g.id;

select concat(s.name, " ", s.surname, " ", s.lastname) as fullname, g.name
from ` student ` s inner join `
group ` g
on s.group_id = g.id
where g.name = '11705';

select g.grade, g.grade_date, concat(s.name, " ", s.surname, " ", s.lastname) as fullname, sub.name
from ` student ` s left join ` students_grade ` g
on g.student_id = s.id left join ` subject ` sub on g.subject_id = sub.id;

select concat(s.name, " ", s.surname, " ", s.lastname) as fullname, g.grade, group.name, g.grade_date
from ` student ` s left join ` students_grade ` g
on g.student_id = s.id left join `
group `
on
group.id = s.group_id
where
group.name = '11705';