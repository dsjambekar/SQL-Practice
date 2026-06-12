CREATE TABLE healthcare_records (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    
    name VARCHAR(100) NOT NULL,
    age INT,
    gender VARCHAR(10),
    blood_type VARCHAR(5),
    medical_condition VARCHAR(100),
    
    date_of_admission DATE,
    
    doctor VARCHAR(100),
    hospital VARCHAR(150),
    insurance_provider VARCHAR(100),
    
    billing_amount DECIMAL(10,2),
    
    room_number INT,
    admission_type VARCHAR(20),
    
    discharge_date DATE,
    
    medication VARCHAR(100),
    test_results VARCHAR(20),
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);