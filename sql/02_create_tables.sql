CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(10),
    date_of_birth DATE,
    contact_number VARCHAR(20),
    address VARCHAR(255),
    registration_date DATE,
    insurance_provider VARCHAR(100),
    insurance_number VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialization VARCHAR(100),
    phone_number VARCHAR(20),
    years_experience INT,
    hospital_branch VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_time TIME,
    reason_for_visit VARCHAR(255),
    status VARCHAR(50),

    FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id),

    FOREIGN KEY (doctor_id)
        REFERENCES doctors(doctor_id)
);

CREATE TABLE treatments (
    treatment_id INT PRIMARY KEY,
    appointment_id INT,
    treatment_type VARCHAR(100),
    description TEXT,
    cost DECIMAL(10,2),
    treatment_date DATE,

    FOREIGN KEY (appointment_id)
        REFERENCES appointments(appointment_id)
);

CREATE TABLE billing (
    bill_id INT PRIMARY KEY,
    patient_id INT,
    treatment_id INT,
    bill_date DATE,
    amount DECIMAL(10,2),
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),

    FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id),

    FOREIGN KEY (treatment_id)
        REFERENCES treatments(treatment_id)
);