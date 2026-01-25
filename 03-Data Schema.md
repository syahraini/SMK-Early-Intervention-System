# DATA_SCHEMA.md

## Purpose

This document defines the conceptual data model for the Student Early-Intervention Decision Support System.
The schema is intentionally lightweight, explainable, and suitable for low-resource school environments.

It is designed to:

* Support early detection of student disengagement and academic risk
* Enable transparent, rule-based risk scoring
* Provide auditability for interventions and decisions
* Facilitate humane, data-informed (not data-dictated) decisions

> **Note:** All schemas and example values are illustrative only and use synthetic data. No real student data is stored or required.

---

## Design Principles

1. **Human-in-the-loop by default**
   Data supports decisions; it does not make them.

2. **Minimal but sufficient**
   Only data that directly enables early intervention and student support is collected.

3. **Explainability over optimization**
   Every field must have a clear operational or ethical purpose.

4. **Privacy-aware**
   No sensitive personal data beyond what is strictly required for school operations.

5. **Low-tech compatibility**
   Designed to be populated by an operator or basic forms, not requiring advanced IT literacy.

---

## Core Tables

### 1. students

Stores basic student identity and enrollment context.

| Field Name          | Type    | Description                                    |
| ------------------- | ------- | ---------------------------------------------- |
| student_id          | string  | Unique internal student identifier             |
| full_name           | string  | Student full name                              |
| gender              | string  | Optional gender field                          |
| date_of_birth       | date    | Used only for age grouping                     |
| grade_level         | integer | Current grade (e.g., 10, 11, 12)               |
| major_department    | string  | Vocational track (e.g., Fisheries, Accounting) |
| homeroom_teacher_id | string  | Assigned homeroom teacher                      |
| enrollment_status   | string  | active / graduated / dropped_out               |
| enrollment_date     | date    | Date of enrollment                             |
| living_arrangement  | string  | with_parents / boarding / living_alone         |
| guardian_name       | string  | Parent or guardian name                        |
| guardian_contact    | string  | Phone or WhatsApp number                       |

**Why this matters:**

* Enables cohort-level monitoring
* Supports contextual interpretation of risk
* Allows humane follow-up (home visits, guardian contact)

---

### 2. attendance_records

Logs daily attendance events.

| Field Name    | Type   | Description                 |
| ------------- | ------ | --------------------------- |
| attendance_id | string | Unique attendance record ID |
| student_id    | string | Foreign key to students     |
| date          | date   | Attendance date             |
| status        | string | present / absent / excused  |
| recorded_by   | string | Operator or teacher ID      |
| remarks       | string | Optional notes              |

**Why this matters:**

* Primary early-warning signal
* Supports soft vs critical alerts
* Enables decay-based risk modeling

---

### 3. assessment_records

Stores academic performance events.

| Field Name      | Type   | Description                         |
| --------------- | ------ | ----------------------------------- |
| assessment_id   | string | Unique assessment ID                |
| student_id      | string | Foreign key to students             |
| subject_name    | string | Subject (e.g., Math, Fisheries)     |
| assessment_type | string | quiz / assignment / midterm / final |
| score           | float  | Numeric score                       |
| max_score       | float  | Maximum possible score              |
| assessment_date | date   | Date of assessment                  |
| recorded_by     | string | Subject teacher ID                  |

**Why this matters:**

* Detects gradual academic disengagement
* Enables subject-level risk visibility
* Supports homeroom intervention context

---

### 4. risk_state

Stores the current computed risk profile per student.

| Field Name         | Type     | Description             |
| ------------------ | -------- | ----------------------- |
| student_id         | string   | Foreign key to students |
| attendance_risk    | float    | 0–100 normalized        |
| academic_risk      | float    | 0–100 normalized        |
| overall_risk_score | float    | Weighted composite      |
| risk_level         | string   | low / medium / high     |
| last_updated       | datetime | Last calculation time   |
| explanation_notes  | string   | Human-readable reason   |

**Why this matters:**

* Central explainable risk representation
* Prevents black-box decisions
* Enables ethical audit

---

### 5. alerts

Logs generated alerts.

| Field Name      | Type     | Description                    |
| --------------- | -------- | ------------------------------ |
| alert_id        | string   | Unique alert ID                |
| student_id      | string   | Foreign key                    |
| alert_type      | string   | soft_warning / critical_alert  |
| trigger_reason  | string   | Attendance / grades / combined |
| generated_date  | datetime | Alert time                     |
| status          | string   | open / acknowledged / resolved |
| acknowledged_by | string   | Homeroom teacher ID            |

**Why this matters:**

* Enables early intervention timing
* Creates accountability
* Supports response auditing

---

### 6. interventions

Logs human interventions.

| Field Name        | Type   | Description                           |
| ----------------- | ------ | ------------------------------------- |
| intervention_id   | string | Unique ID                             |
| student_id        | string | Foreign key                           |
| intervention_type | string | home_visit / counseling / parent_call |
| performed_by      | string | Teacher or staff ID                   |
| date              | date   | Intervention date                     |
| outcome           | string | Improved / unchanged / worsened       |
| notes             | string | Qualitative context                   |

**Why this matters:**

* Tracks care actions, not punishment
* Enables learning what works
* Ethical accountability layer

---

### 7. parent_communications

Stores parent responses and messages.

| Field Name   | Type     | Description                               |
| ------------ | -------- | ----------------------------------------- |
| message_id   | string   | Unique ID                                 |
| student_id   | string   | Foreign key                               |
| sent_by      | string   | System / homeroom teacher                 |
| message_type | string   | soft_warning / critical_alert / follow_up |
| message_text | string   | Message body                              |
| sent_date    | datetime | Timestamp                                 |
| parent_reply | string   | Optional response                         |
| reply_date   | datetime | Timestamp                                 |

**Why this matters:**

* Enables transparent communication
* Creates a single audit trail
* Supports parent–school collaboration

---

### 8. users

System users and roles.

| Field Name | Type    | Description                                               |
| ---------- | ------- | --------------------------------------------------------- |
| user_id    | string  | Unique ID                                                 |
| full_name  | string  | User name                                                 |
| role       | string  | homeroom_teacher / subject_teacher / operator / principal |
| active     | boolean | Active status                                             |

**Why this matters:**

* Enables access control
* Supports role-based views

---

### 9. audit_log

Logs critical system events.

| Field Name   | Type     | Description                                         |
| ------------ | -------- | --------------------------------------------------- |
| event_id     | string   | Unique ID                                           |
| event_type   | string   | risk_recalc / alert_generated / intervention_logged |
| performed_by | string   | User or system                                      |
| event_time   | datetime | Timestamp                                           |
| metadata     | string   | JSON or text                                        |

**Why this matters:**

* Enables transparency
* Supports governance review
* Prevents silent misuse

---

## Data Relationships (Conceptual)

* students 1—* attendance_records
* students 1—* assessment_records
* students 1—1 risk_state
* students 1—* alerts
* students 1—* interventions
* students 1—* parent_communications

---

## Ethical Constraints

* No behavioral surveillance fields
* No non-academic personal profiling
* No third-party data ingestion
* No permanent punitive labels

---

## Notes for Prototype Implementation

* All IDs may be UUIDs
* All timestamps stored in UTC
* Synthetic data only
* CSV or SQLite storage sufficient

---

