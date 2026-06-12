/* Visualizations
Top medical conditions bar chart
Condition by gender stacked bar chart
Heatmap of age group vs. condition */

# What are the most common medical conditions?
SELECT
	medical_condition, 
    COUNT(patient_id) as no_of_patients
FROM healthcare_records
GROUP BY medical_condition
ORDER BY no_of_patients DESC;

# Which medical conditions occur most frequently by gender?
SELECT
	medical_condition,
    gender,
    COUNT(patient_id) as no_of_patients
FROM healthcare_records
GROUP BY medical_condition, gender
ORDER BY no_of_patients DESC;

# Which age groups are most affected by specific conditions?
SELECT 
	medical_condition,
    CASE
        WHEN age < 20 THEN '0-19'
        WHEN age < 40 THEN '20-39'
        WHEN age < 60 THEN '40-59'
        ELSE '60+'
    END AS age_group,
    COUNT(patient_id) as no_of_patients
FROM healthcare_records
GROUP BY medical_condition, age_group
ORDER BY no_of_patients DESC;

# Are certain blood types associated with specific medical conditions?
SELECT 
	medical_condition,
    blood_type,
    COUNT(patient_id) as no_of_patients
FROM healthcare_records
GROUP BY medical_condition, blood_type
ORDER BY no_of_patients DESC;

# What percentage of admissions are related to each condition?
SELECT 
	medical_condition, 
    ROUND(
		COUNT(patient_id) * 100.0 /
        (SELECT COUNT(*) FROM healthcare_records),
        2
	) AS percentage
FROM healthcare_records
GROUP BY medical_condition
ORDER BY percentage DESC;
# Using 100.0 avoids integer division issues.

