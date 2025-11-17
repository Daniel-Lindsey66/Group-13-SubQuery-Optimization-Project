DROP TABLE IF EXISTS doctors;

CREATE TABLE doctors (
	 doctor_id INTEGER,
	 specialization TEXT,
	 doctor_name TEXT,
	 patient_count INTEGER,
	 age INTEGER
);

INSERT INTO doctors VALUES(1, 'Cardiologist', 'David', 20, 45);
INSERT INTO doctors VALUES(2, 'Neurologist', 'Shane', 10, 52);
INSERT INTO doctors VALUES(3, 'General Practitioner', 'Elizabeth', 32, 43);
INSERT INTO doctors VALUES(4, 'General Practitioner', 'Jessica', 19, 29);
INSERT INTO doctors VALUES(5, 'General Practitioner', 'Ross', 57, 37);

-- Example 1: (1-Level) Nested Query
SELECT *
FROM doctors
WHERE age > (
	SELECT AVG(age)
	FROM doctors
);

-- Example 1: Unnested Query
SELECT *
FROM doctors d
JOIN (
	SELECT AVG(age) as avg_age
	FROM doctors
) agg
ON d.age > agg.avg_age

-- Example 2: (1-Level) Nested Correlated Query
SELECT doctor_id, doctor_name, patient_count  
FROM doctors  
WHERE patient_count > (  
	SELECT AVG(patient_count)  
	FROM doctors  
	WHERE specialization = doctors.specialization  
);  


-- Exmple 2: Unnested Query
SELECT doctor_id, doctor_name, patient_count  
FROM doctors d
JOIN (
	SELECT specialization, AVG(patient_count) AS avg_patient_count
	FROM doctors
	GROUP BY specialization
) AS specialization s
ON d.specialization = s.specialization
WHERE d.patient_count > s.avg_patient_count



-- Example 3: (2-Level) Nested Correlated Query
SELECT doctor_id, doctor_name, patient_count  
FROM doctors d1
WHERE patient_count > (  
	SELECT AVG(patient_count)  
	FROM doctors d2
	WHERE d1.specialization = d2.specialization 
	AND d2.age IN (
		SELECT age
		FROM doctors d3
		WHERE age >= 30 and age <= 50
	)
);  


-- Example 3: Unnested and decorrelated Query
SELECT doctor_id, doctor_name, patient_count
FROM doctors d
JOIN (
	SELECT specialization, AVG(patient_count) as avg_patient_count
	FROM doctors 
	WHERE age >= 30 and age <= 50
	GROUP BY specialization
) agg
ON d.specialization = agg.specialization
WHERE d.patient_count > avg_patient_count
