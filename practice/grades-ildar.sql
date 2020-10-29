select concat(student.name, ' ', student.surname, ' ', student.lastname) as FIO, `group`.name as group_name, `group`.year
from student
left join `group`
on student.group_id = `group`.id ;

select concat(student.name, ' ', student.surname, ' ', student.lastname) as FIO, `group`.name
from student
left join `group`
on student.group_id = `group`.id
where `group`.name = 11705 ;

select students_grade.grade, students_grade.grade_date, concat(student.name, ' ', student.surname, ' ', student.lastname) as FIO, subject.name
from students_grade
left join student
on students_grade.student_id = student.id
left join subject
on students_grade.subject_id = subject.id ;

select concat(student.name, ' ', student.surname, ' ', student.lastname) as FIO, students_grade.grade, `group`.name as group_name, students_grade.grade_date
from student
left join students_grade
on student.id = students_grade.student_id
left join `group`
on student.group_id = `group`.id