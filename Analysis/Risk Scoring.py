def calculate_risk(attendance_rate, avg_grade, consecutive_absences):
    risk = 0

    if attendance_rate < 80:
        risk += 30

    if avg_grade < 60:
        risk += 30

    if consecutive_absences >= 3:
        risk += 20

    if consecutive_absences >= 6:
        risk += 40

    return min(risk, 100)
