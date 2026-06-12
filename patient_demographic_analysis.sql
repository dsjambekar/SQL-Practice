/* Questions
Visualizations
Age histogram
Gender pie chart
Blood type bar chart
Age group distribution */

# What is the average patient age?
SELECT 
	ROUND(AVG(age),2) AS average_age
FROM healthcare_records;

# What is the age distribution of patients?
# Which age groups have the highest hospitalization rates?
SELECT 
	CASE
        WHEN age < 20 THEN '0-19'
        WHEN age < 40 THEN '20-39'
        WHEN age < 60 THEN '40-59'
        ELSE '60+'
    END AS age_group,
    COUNT(patient_id) AS "no_of_patients"
FROM healthcare_records
GROUP BY age_group
ORDER BY no_of_patients DESC 
LIMIT 10;

#What percentage of patients are male vs. female?
SELECT 
	gender, 
    ROUND(
		COUNT(patient_id) * 100.0/
        (SELECT COUNT(*) FROM healthcare_records),
        2)
	AS percentage
FROM healthcare_records
GROUP BY gender;

#Which blood types are most common?
SELECT
	blood_type,
    COUNT(patient_id) AS no_of_patients
FROM healthcare_records
GROUP BY blood_type
ORDER BY no_of_patients DESC 
LIMIT 10;


