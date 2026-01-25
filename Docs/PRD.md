# Product Requirements Document  
Early Intervention System for Marginalized Vocational Schools

---

## 1. Problem Statement

Many under-resourced vocational schools serving low-income and rural communities face a silent failure mode:  
students gradually disengage, attendance collapses, grades deteriorate — and yet promotion and intervention decisions are still made based on fragmented data, intuition, and compassion rather than structured evidence.

As a result:

- Students are promoted despite chronic disengagement  
- Drop-out risks are detected too late to reverse  
- Graduates leave school without being skill-ready  
- Teachers intervene only after problems become severe  
- Parents are informed too late or inconsistently

There is currently no unified, humane, and data-informed system to support early detection, structured intervention, and transparent academic decision-making.

---

## 2. Target Users & Personas

### 2.1 Homeroom Teacher (Primary User)

- Responsible for student welfare and promotion decisions  
- Lacks real-time visibility into attendance and performance  
- Often detects problems too late  
- Emotionally burdened by borderline cases

Needs:
- Early warning signals  
- Unified student profiles  
- Structured intervention workflow  
- Transparent decision support

---

### 2.2 Subject Teacher (Secondary User)

- Responsible for grading and classroom performance  
- Limited visibility into students’ broader context  
- No structured channel to escalate concerns

Needs:
- Simple performance input  
- Visibility into subject-level trends  
- Ability to flag concerning behavior

---

### 2.3 Parent / Guardian

- Often unaware of attendance or academic decline  
- Informed too late about serious issues  
- Limited communication channel with teachers

Needs:
- Early attendance alerts  
- Clear communication  
- Reassurance that the system exists for care, not punishment

---

### 2.4 School Leadership

- Makes promotion and governance decisions  
- Lacks structured data to guide policy  
- Relies heavily on anecdotal evidence

Needs:
- Aggregate risk visibility  
- Intervention effectiveness metrics  
- Governance-level decision support

---

## 3. Product Goals

The system is designed to:

- Detect student disengagement early  
- Enable humane, low-stakes intervention  
- Support transparent promotion decisions  
- Improve parent–school communication  
- Reduce silent dropout  
- Preserve dignity and care-centered education

---

## 4. Non-Goals

The system explicitly does NOT:

- Automate promotion or expulsion  
- Rank or shame students  
- Replace teacher judgment  
- Enforce disciplinary punishment  
- Act as a surveillance mechanism

---

## 5. Core Features

### 5.1 Unified Student Profile
- Attendance history  
- Academic performance  
- Risk score  
- Alert history  
- Intervention log

---

### 5.2 Attendance Tracking
- Daily attendance input  
- Consecutive absence detection  
- Soft & critical alert triggers

---

### 5.3 Academic Performance Monitoring
- Subject-level grades  
- Grade trend detection  
- Sudden drop alerts

---

### 5.4 Risk Scoring Engine
- Combines attendance and grades  
- Generates advisory risk score  
- Decays slowly with improvement

---

### 5.5 Alert System
- Soft alert (3 days absence)  
- Critical alert (6 days absence)  
- Grade-based alerts  
- Explainable trigger logic

---

### 5.6 Intervention Workflow
- Alert review  
- Parent communication  
- Home visit recommendation  
- Support action planning  
- Outcome logging

---

### 5.7 Parent Communication Interface
- Attendance alerts  
- Teacher messages  
- Parent replies  
- Message audit log

---

## 6. User Stories

### Homeroom Teacher

- As a homeroom teacher, I want to see all at-risk students in one dashboard so that I can intervene early.  
- As a homeroom teacher, I want to understand why a student is flagged so that I can trust the alert.  
- As a homeroom teacher, I want to log intervention actions so that decisions are transparent.

---

### Subject Teacher

- As a subject teacher, I want to input grades easily so that student performance is recorded consistently.  
- As a subject teacher, I want to flag concerning behavior so that the homeroom teacher is informed.

---

### Parent

- As a parent, I want to receive attendance alerts so that I know when my child misses school.  
- As a parent, I want to reply to teacher messages so that communication is documented.

---

## 7. Functional Requirements

- Input attendance records  
- Input subject grades  
- Calculate risk scores  
- Generate alerts  
- Display dashboards  
- Log interventions  
- Send and receive parent messages  
- Enforce role-based access

---

## 8. Non-Functional Requirements

- Explainability of alerts  
- Role-based data privacy  
- Audit logging  
- Reliability  
- Low cognitive load UX  
- Offline-tolerant input (future)

---

## 9. Success Metrics

- Reduction in late-stage interventions  
- Improved attendance consistency  
- Reduction in chronic absenteeism  
- Teacher satisfaction  
- Parent engagement rate  
- Reduction in skill-poor graduation

---

## 10. Ethical & Governance Constraints

- Advisory-only outputs  
- Human override on all decisions  
- No automated punishment  
- No stigmatizing labels  
- Transparent rule logic  
- Data minimization

---

## 11. Out of Scope (V1)

- Automated promotion decisions  
- Machine learning prediction models  
- Student ranking  
- Disciplinary automation  
- Facial recognition or tracking


---

## 12. Open Questions

- Optimal weighting of attendance vs grades  
- Teacher workload limits  
- Parent communication norms  
- Data retention policy

---
