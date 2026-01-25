-- 1. Students with 3+ consecutive absences
SELECT student_id, COUNT(*) as absent_days
FROM attendance
WHERE status = 'absent'
GROUP BY student_id
HAVING COUNT(*) >= 3;

-- 2. Students with critical alerts
SELECT *
FROM alerts
WHERE type = 'critical' AND status = 'active';

-- 3. Grade drops > 30%
SELECT student_id, subject, 
       MAX(score) - MIN(score) as drop_amount
FROM grades
GROUP BY student_id, subject
HAVING drop_amount > 30;

-- 4. High-risk students
SELECT student_id, risk_score
FROM students
WHERE risk_score > 70;