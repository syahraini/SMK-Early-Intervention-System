# INTERVENTION FLOW

## Purpose

This document defines the humane, human-centered workflow that connects alerts to real-world actions.

It formalizes how homeroom teachers, parents, and school staff respond to student risk signals.

The intervention flow is designed to:

* Enable early, supportive action
* Prevent silent student disengagement
* Preserve human judgment at every step
* Avoid punitive or automated consequences

---

## Design Principles

1. **Human Judgment First**
   The system recommends actions but never mandates outcomes.

2. **Care-Oriented Framing**
   All interventions are framed as support, not discipline.

3. **Early, Light-Touch Action**
   Prefer early communication over late escalation.

4. **Auditability**
   Every meaningful action is logged for transparency.

---

## Actors

* Student
* Parent / Guardian
* Homeroom Teacher
* Subject Teacher
* Operator
* Principal (oversight only)

---

## Alert → Action Flow

### 1. Soft Warning Flow (Attendance or Academic)

**Trigger:**

* ≥ 3 consecutive unexcused absences
* OR ≥ 3 low assessment scores in 30 days

**System Actions:**

* Generate `soft_warning` alert
* Notify homeroom teacher
* Send message to parent via system

**Recommended Human Actions:**

* Homeroom teacher reviews student history
* Homeroom teacher sends supportive message to parent
* Optional: brief in-class or online check-in with student

**Documentation:**

* Alert status: open → acknowledged
* Notes logged (optional)

---

### 2. Critical Alert Flow

**Trigger:**

* ≥ 6 consecutive unexcused absences
* OR ≥ 5 low assessment scores in 30 days

**System Actions:**

* Generate `critical_alert`
* Notify homeroom teacher
* Send message to parent via system

**Recommended Human Actions:**

* Homeroom teacher reviews full student context
* Phone call or in-person discussion with student
* Conditional recommendation: home visit

  * Based on teacher judgment
  * Based on parent response
  * Based on severity and persistence

**Documentation:**

* Alert status: open → acknowledged
* Intervention record created

---

## Intervention Types

| Type             | Description                       |
| ---------------- | --------------------------------- |
| parent_call      | Phone or WhatsApp discussion      |
| counseling       | Supportive conversation at school |
| home_visit       | Visit to student's residence      |
| academic_support | Tutoring or remediation           |

---

## Parent Communication Flow

1. System sends alert message
2. Parent may reply in system
3. Homeroom teacher reviews reply
4. Follow-up message or call if needed

All messages are logged in `parent_communications`.

---

## Escalation Logic

* If no improvement after 7 days of a critical alert:

  * Recommend case review with principal
  * Consider multi-party meeting

---

## Resolution Criteria

An alert is marked as resolved if:

* Attendance returns to normal for 7 consecutive days
* OR academic performance improves
* OR a successful intervention outcome is logged

---

## Ethical Guardrails

* No automatic disciplinary action
* No automatic grade retention
* No automatic dropout labeling
* No public risk ranking

---

## Notes for Prototype Implementation

* All recommendations are optional
* All actions require human confirmation
* All steps logged for audit

---

