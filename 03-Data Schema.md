# Data Schema

## 1. Entities
- Students  
- AttendanceRecords  
- Grades  
- Alerts  
- Interventions  
- Teachers  
- Parents

## 2. Student Table
- student_id  
- name  
- grade_level  
- homeroom_teacher_id  
- parent_contact  
- risk_score (derived)

## 3. Attendance Table
- record_id  
- student_id  
- date  
- status (present/absent/late)

## 4. Grades Table
- record_id  
- student_id  
- subject  
- score  
- date

## 5. Alerts Table
- alert_id  
- student_id  
- type (soft/critical)  
- trigger_reason  
- date_created  
- status

## 6. Interventions Table
- intervention_id  
- student_id  
- action_type  
- notes  
- date  
- outcome

## 7. Privacy Notes
- What fields are sensitive  
- Who can see what
