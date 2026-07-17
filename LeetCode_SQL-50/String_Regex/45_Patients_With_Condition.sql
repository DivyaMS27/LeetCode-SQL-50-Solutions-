-- Problem: 1527. Patients With a Condition
-- Difficulty: Easy
-- Table: Patients(patient_id, patient_name, conditions)
-- Definitions:
--   patient_id   = primary key (unique ID for each patient)
--   patient_name = name of the patient
--   conditions   = string containing 0 or more condition codes separated by spaces
-- Goal: Find patients diagnosed with Type I Diabetes.
--       Type I Diabetes codes always start with prefix 'DIAB1'.
--       Return patient_id, patient_name, and conditions.
-- Approach:
--   1. Use LIKE 'DIAB1%' → matches if DIAB1 is the first condition
--   2. Use LIKE '% DIAB1%' → matches if DIAB1 appears after a space (not first)
--   3. Combine both conditions with OR
--   4. Return patient_id, patient_name, conditions

SELECT patient_id,
       patient_name,
       conditions
FROM Patients
WHERE conditions LIKE 'DIAB1%'
   OR conditions LIKE '% DIAB1%';
