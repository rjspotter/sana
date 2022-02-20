CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA case_study;

DROP TABLE IF EXISTS case_study.stg_claims;
CREATE TABLE case_study.stg_claims AS (
  SELECT
    case_study.gen_random_uuid() AS id,
    "Claim Number" AS claim_id,
    "Patient ID"::integer AS patient_id,
    "Patient First Name" AS patient_first_name,
    "Patient Last Name" AS patient_last_name,
    to_date("Patient DOB", 'YYYYMMDD') AS patient_dob,
    "In Network"::BOOLEAN AS is_in_network,
    "Claim Type" AS claim_type,
    CURRENT_TIMESTAMP AS loaded_at
  FROM
    case_study.raw_claims
);


DROP TABLE IF EXISTS case_study.stg_claim_line_items;
CREATE TABLE case_study.stg_claim_line_items AS (
  SELECT
    case_study.gen_random_uuid() AS id,
    "Claim Number" AS claim_id,
    to_date("Date of Service", 'YYYY-MM-DD') AS service_date,
    "Procedure Code" AS procedure_code,
    "Benefit Code" AS benefit_code,
    ("Cost"::DECIMAL / 100) AS cost,
    "Quantity"::INTEGER AS quantity,
    -- "Unit Rate",
    "Emergency"::BOOLEAN AS is_emergency,
    CURRENT_TIMESTAMP AS loaded_at
  FROM
    case_study.raw_claim_line_items
);


DROP TABLE IF EXISTS case_study.stg_patients;
CREATE TABLE case_study.stg_patients AS (
  SELECT
    case_study.gen_random_uuid() AS id,
    "Member ID"::INTEGER AS member_id,
    "First Name" AS patient_first_name,
    "Last Name" AS patient_last_name,
    to_date("DOB", 'YYYY-MM-DD') AS patient_dob,
    "Group Name" AS group_name,
    CURRENT_TIMESTAMP AS loaded_at
  FROM
    case_study.raw_patients
);
