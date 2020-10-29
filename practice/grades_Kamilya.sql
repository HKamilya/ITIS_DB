SELECT CONCAT(student.name," ", student.surname," ", student.lastname)as fullname, group.name, group.year from `group`  LEFT JOIN `student`  ON student.group_id = group.id;

SELECT CONCAT(student.name," ", student.surname," ", student.lastname)as fullname, group.name from `group`  LEFT JOIN `student`  ON student.group_id = group.id where group.name='11705';

SELECT students_grade.grade as grade, students_grade.grade_date as date, CONCAT(student.name," ", student.surname," ", student.lastname)as fullname, subject.name as subject_name from `students_grade` left join `student` on students_grade.student_id= student.id left join `subject` on students_grade.subject_id=subject.id;

SELECT CONCAT(student.name," ", student.surname," ", student.lastname)as fullname, students_grade.grade as grade, group.name as group_name, students_grade.grade_date as date from `students_grade` left join `student` on students_grade.student_id= student.id left join `subject` on students_grade.subject_id=subject.id left join `group` on group.id=student.group_id where group.name='11705';

