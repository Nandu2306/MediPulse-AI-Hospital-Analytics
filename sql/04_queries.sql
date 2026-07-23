-- View all patients
SELECT * FROM patients;

-- View first 10 appointments
SELECT * FROM appointments
LIMIT 10;

-- View all doctors
SELECT * FROM doctors;

-- View all treatments
SELECT * FROM treatments;

-- View all billing records
SELECT * FROM billing;


-- Female patients
SELECT *
FROM patients
WHERE gender = 'F';

-- Experienced doctors
SELECT *
FROM doctors
WHERE years_experience > 10;

-- Paid bills
SELECT *
FROM billing
WHERE payment_status = 'Paid';

-- Pending appointments
SELECT *
FROM appointments
WHERE status = 'Scheduled';

-- Highest billing amount
SELECT *
FROM billing
ORDER BY amount DESC;

-- Doctors by experience


-- Total patients
SELECT COUNT(*) AS Total_Patients
FROM patients;

-- Total doctors
SELECT COUNT(*) AS Total_Doctors
FROM doctors;

-- Average treatment cost
SELECT AVG(cost) AS Average_Cost
FROM treatments;

-- Highest bill
SELECT MAX(amount) AS Highest_Bill
FROM billing;

-- Lowest bill
SELECT MIN(amount) AS Lowest_Bill
FROM billing;

-- Total revenue
SELECT SUM(amount) AS Total_Revenue
FROM billing;


-- Patients by gender



-- Doctors by specialization
SELECT specialization,
COUNT(*) AS Total_Doctors
FROM doctors
GROUP BY specialization;

-- Payment methods
SELECT payment_method,
COUNT(*) AS Total
FROM billing
GROUP BY payment_method;



SELECT
    a.appointment_id,
    p.first_name,
    p.last_name,
    d.first_name AS doctor_first_name,
    d.last_name AS doctor_last_name,
    a.appointment_date,
    a.status
FROM appointments a
INNER JOIN patients p
ON a.patient_id = p.patient_id
INNER JOIN doctors d
ON a.doctor_id = d.doctor_id;

SELECT
    t.treatment_id,
    p.first_name,
    p.last_name,
    t.treatment_type,
    t.cost
FROM treatments t
INNER JOIN appointments a
ON t.appointment_id = a.appointment_id
INNER JOIN patients p
ON a.patient_id = p.patient_id;

SELECT
    b.bill_id,
    p.first_name,
    p.last_name,
    b.amount,
    b.payment_status
FROM billing b
INNER JOIN patients p
ON b.patient_id = p.patient_id;

SELECT
SUM(amount) AS Total_Revenue
FROM billing;

SELECT
payment_method,
SUM(amount) AS Revenue
FROM billing
GROUP BY payment_method;

SELECT
specialization,
COUNT(*) AS Total_Doctors
FROM doctors
GROUP BY specialization;


SELECT *
FROM billing
WHERE payment_status='Paid';

SELECT *
FROM billing
WHERE payment_status='Failed';

SELECT *
FROM billing
WHERE payment_status='Pending';
SELECT *
FROM billing
ORDER BY amount DESC
LIMIT 10;