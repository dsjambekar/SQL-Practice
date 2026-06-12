-- 1. Temporarily disable checks to maximize upload speed
SET unique_checks = 0; 
SET foreign_key_checks = 0; 
SET autocommit = 0; 

-- 2. Execute bulk load
LOAD DATA LOCAL INFILE 'C:/Users/Dhanashree/Documents/MSBA/SQL/Healthcare/healthcare_dataset.csv'
INTO TABLE healthcare_records
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(
    name,
    age,
    gender,
    blood_type,
    medical_condition,
    @admission_date,
    doctor,
    hospital,
    insurance_provider,
    billing_amount,
    room_number,
    admission_type,
    @discharge_date,
    medication,
    test_results
)
SET
    date_of_admission = STR_TO_DATE(@admission_date,'%m/%d/%Y'),
    discharge_date = STR_TO_DATE(@discharge_date,'%m/%d/%Y');

-- 3. Commit data and re-enable performance checks
COMMIT;
SET unique_checks = 1; 
SET foreign_key_checks = 1; 
SET autocommit = 1;
