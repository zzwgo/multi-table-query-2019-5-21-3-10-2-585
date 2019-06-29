# 1.查询同时存在1课程和2课程的情况

SELECT a.*,b.score 课程1分数,c.score 课程2分数 
from student a,student_course b,student_course c 
where a.id=b.studentId and a.id=c.studentId and b.courseId='1' and c.courseId='2' 

# 2.查询同时存在1课程和2课程的情况

SELECT a.*,b.score 课程1分数,c.score 课程2分数 
from student a 
LEFT JOIN student_course b on a.id=b.studentId and b.courseId='1'
LEFT JOIN student_course c on a.id=c.studentId and c.courseId='2'

# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩

SELECT a.id,a.`name`,AVG(b.score) as '平均分'
from student a,student_course b
where a.id=b.studentId
GROUP BY a.id,a.name
HAVING avg(b.score)>=60
ORDER BY a.id

# 4.查询在student_course表中不存在成绩的学生信息的SQL语句

SELECT a.*,b.courseId, isnull(b.score) as '是否为空'
from student a left join student_course b
on a.id=b.studentId
GROUP BY a.id,a.name
ORDER BY a.id

# 5.查询所有有成绩的SQL

SELECT a.*,b.score
from student a,student_course b
where a.id=b.studentId
GROUP BY a.id,a.name
ORDER BY a.id

# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
select a.* 
from student a , student_course b 
where a.id = b.studentId and b.courseId = '1' 
and 
exists (Select 1 from student_course b, student_course b1 where b.studentId = b1.studentId 
and b1.courseId = '2') 

# 7.检索1课程分数小于60，按分数降序排列的学生信息
SELECT a.* 
FROM student a,student_course b
where a.id=b.studentId and b.courseId='1' and b.score<60
ORDER BY b.score DESC

# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列

SELECT b.id,b.name ,avg(a.score) as '平均分'
from student_course a,course b
where a.courseId=b.id
GROUP BY a.courseId
ORDER BY avg(a.score) desc,a.courseId asc
# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
SELECT c.name,a.`name`,b.score
from student a, student_course b,course c
where a.id=b.studentId and b.courseId =c.id and  c.name='数学' and b.score<60


