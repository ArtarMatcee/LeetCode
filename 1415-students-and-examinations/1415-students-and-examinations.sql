/* Write your T-SQL query statement below */

SELECT s.student_id, s.student_name, sub.subject_name, COUNT(E.subject_name) AS attended_exams
FROM Students s
CROSS APPLY Subjects sub
LEFT OUTER JOIN Examinations E 
    ON s.student_id = E.student_id AND sub.subject_name = E.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name
    