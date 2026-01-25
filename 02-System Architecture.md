# SYSTEM ARCHITECTURE

## 1. Overview

This document describes the high-level system architecture for the Early Intervention & Student Risk Monitoring System. The system is designed as a lightweight, privacy-conscious decision-support tool for under-resourced vocational schools. Its primary goal is to enable early detection of student disengagement and support timely, humane interventions by teachers and homeroom staff.

The system is intentionally modular, auditable, and explainable. It avoids black-box AI and instead uses transparent rules and scoring logic that can be inspected, modified, and governed by school leadership.

---

## 2. Design Principles

1. **Human-in-the-Loop**: The system never makes promotion, expulsion, or disciplinary decisions automatically.
2. **Explainability First**: Every risk score and alert must be traceable to underlying rules and data points.
3. **Low-Tech Tolerance**: The system supports partial manual input and operator-assisted data entry.
4. **Privacy by Design**: Only minimum necessary data is stored and processed.
5. **Progressive Enhancement**: Can operate as a basic rules engine before future ML adoption.

---

## 3. High-Level Architecture

```
[ Teachers ]      [ Operator ]        [ Parents ]
     |                 |                   |
     v                 v                   v
+----------------+  +----------------+  +----------------+
| Input Interface|  | Admin Console  |  | Parent Portal  |
+----------------+  +----------------+  +----------------+
         |                  |                   |
         +------------------+-------------------+
                            |
                            v
                    +--------------------+
                    | Application Layer  |
                    | - Rule Engine      |
                    | - Risk Scoring     |
                    | - Alert Manager    |
                    | - Audit Logger     |
                    +--------------------+
                            |
                            v
                    +--------------------+
                    |   Data Layer       |
                    | - Student Table    |
                    | - Attendance       |
                    | - Grades           |
                    | - Interventions    |
                    | - Alerts           |
                    +--------------------+
                            |
                            v
                    +--------------------+
                    | Analytics Layer    |
                    | - Dashboards       |
                    | - Policy Simulation|
                    +--------------------+
```

---

## 4. Core Components

### 4.1 Input Interfaces

* Teacher score input (attendance, quizzes, assignments)
* Operator batch upload / assisted entry
* Parent message replies

Responsibilities:

* Validate data
* Timestamp entries
* Attribute data to source user

---

### 4.2 Application Layer

#### Rule Engine

* Evaluates attendance and grade thresholds
* Applies decay functions
* Triggers soft / critical alerts

#### Risk Scoring Module

* Computes composite risk score
* Stores score snapshots
* Logs contributing factors

#### Alert Manager

* Creates alerts
* Sends notifications
* Tracks acknowledgment

#### Audit Logger

* Logs all rule evaluations
* Stores override decisions

---

### 4.3 Data Layer

Primary entities:

* Students
* Teachers
* Subjects
* Attendance Records
* Grades
* Alerts
* Interventions
* Parent Communications

All tables are versioned and append-only for auditability.

---

### 4.4 Analytics Layer

* Tableau or embedded dashboards
* Risk trend visualization
* Attendance heatmaps
* Intervention effectiveness
* Policy what-if simulation

---

## 5. Data Flow

1. Teacher enters attendance or grade
2. Rule Engine evaluates thresholds
3. Risk score updated
4. Alert triggered if threshold crossed
5. Homeroom teacher notified
6. Intervention logged
7. Parent notified and replies
8. Audit log updated

---

## 6. Deployment Model

Phase 1:

* Local server or lightweight cloud VM
* SQLite or PostgreSQL

Phase 2:

* API service
* Separate analytics DB
* Tableau integration

---

## 7. Access Control Model

Roles:

* Subject Teacher
* Homeroom Teacher
* Operator
* Principal
* Parent

Permissions:

* Subject teachers: see own subject data
* Homeroom teacher: full student view
* Operator: data entry only
* Parents: own child data only

---

## 8. Non-Functional Requirements

* Explainability: 100% traceable scoring
* Availability: 99% school hours
* Latency: < 2 seconds for dashboard
* Data retention: configurable

---

## 9. Future Extensions

* ML-based dropout prediction
* NLP on parent messages
* Mobile app
* Regional benchmarking

---

## 10. Open Risks

* Data quality from manual entry
* Teacher adoption resistance
* Alert fatigue

---

## 11. Summary

This architecture balances realism, ethics, and technical rigor. It is intentionally conservative to maximize trust, usability, and auditability in a low-resource school context.
