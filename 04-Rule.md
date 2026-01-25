# RULE

## Purpose

This document defines the conceptual rule-based logic used to compute student risk, trigger alerts, and support early intervention.

The rule engine is intentionally:

* Non-ML
* Explainable
* Deterministic
* Human-auditable

It is designed to support humane, data-informed decision-making rather than automated punishment or promotion decisions.

---

## Design Principles

1. **Explainability First**
   Every risk score and alert must be traceable to concrete events (attendance or grades).

2. **Human-in-the-loop**
   No rule produces irreversible outcomes. All outputs are advisory.

3. **Care over Control**
   Rules are designed to trigger support actions, not sanctions.

4. **Simplicity over Optimization**
   Rules favor interpretability over statistical sophistication.

---

## Core Inputs

The rule engine consumes the following data sources:

* attendance_records
* assessment_records
* students (context only)
* interventions (for decay modulation)

---

## Risk Components

Overall student risk is composed of two equally weighted components:

* Attendance Risk (50%)
* Academic Risk (50%)

This reflects the system’s ethical stance that:

* Persistent absence and academic deterioration are equally critical
* Neither signal alone should dominate intervention decisions

---

## Attendance Risk Logic

### Definitions

* Absent Day: attendance_records.status = 'absent'
* Excused absence does not contribute to risk

---

### Soft Warning Trigger

If a student is absent for **≥ 3 consecutive school days**:

* Generate a `soft_warning` alert
* Notify homeroom teacher
* Notify parent

---

### Critical Alert Trigger

If a student is absent for **≥ 6 consecutive school days**:

* Generate a `critical_alert`
* Notify homeroom teacher
* Notify parent
* Recommend home visit intervention

---

### Attendance Risk Score

Attendance risk is computed as:

```
attendance_risk = min(100, total_absent_days_last_30 * 10)
```

Where:

* Only unexcused absences are counted
* The score is capped at 100

---

## Academic Risk Logic

### Definitions

* A low score is defined as < 60% of max_score

---

### Academic Risk Score

```
low_score_ratio = number_of_low_scores_last_30 / total_assessments_last_30
academic_risk = low_score_ratio * 100
```

---

### Academic Soft Warning

If a student receives **≥ 3 low scores** within 30 days:

* Generate a `soft_warning`
* Notify homeroom teacher

---

### Academic Critical Alert

If a student receives **≥ 5 low scores** within 30 days:

* Generate a `critical_alert`
* Notify homeroom teacher

---

## Overall Risk Score

```
overall_risk_score = (attendance_risk * 0.5) + (academic_risk * 0.5)
```

---

## Risk Level Classification

| Overall Risk Score | Risk Level |
| ------------------ | ---------- |
| 0–39               | Low        |
| 40–69              | Medium     |
| 70–100             | High       |

---

## Decay Logic

Risk decays gradually over **14 days** after improvement.

If:

* attendance returns to present
* and/or academic performance improves

Then:

```
decayed_risk = current_risk * (1 - (days_since_improvement / 14))
```

Risk never decays below the most recent minimum baseline without human review.

---

## Intervention Modulation

If an intervention is logged:

* Reduce overall risk by 10–20% depending on outcome
* Freeze decay for 3 days to observe response

---

## Explainability Notes Generation

Each risk calculation generates a human-readable explanation:

Example:

> “Attendance risk increased due to 5 unexcused absences in the past 10 days. Academic risk increased due to 4 low quiz scores in Mathematics. Overall risk classified as HIGH.”

---

## Ethical Guardrails

* No automatic grade promotion or retention
* No automatic dropout labeling
* No permanent high-risk tagging
* All alerts advisory only

---

## Notes for Prototype Implementation

* Implementable in Python or SQL
* No machine learning required
* All thresholds configurable

---
