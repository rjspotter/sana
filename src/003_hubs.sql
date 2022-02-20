DROP TABLE IF EXISTS case_study.hub_claims;
CREATE TABLE case_study.hub_claims AS (
  SELECT DISTINCT
    sha256(claim_id::bytea) AS id,
    claim_id
  FROM
    case_study.stg_claims
);

DROP TABLE IF EXISTS case_study.hub_members;
CREATE TABLE case_study.hub_members AS (
  SELECT DISTINCT
    sha256(member_id::text::bytea) AS id,
    member_id
  FROM
    case_study.stg_patients
);

DROP TABLE IF EXISTS case_study.hub_groups;
CREATE TABLE case_study.hub_groups AS (
  SELECT DISTINCT
    sha256(group_name::bytea) AS id,
    group_name
  FROM
    case_study.stg_patients
);


DROP TABLE IF EXISTS case_study.hub_patients;
CREATE TABLE case_study.hub_patients AS (
  SELECT DISTINCT
    sha256(patient_id::text::bytea) AS id,
    patient_id
  FROM
    case_study.stg_claims
);

DROP TABLE IF EXISTS case_study.hub_people;
CREATE TABLE case_study.hub_people AS (
  WITH claims_people AS (
    SELECT
      sha256(
        (COALESCE(patient_first_name::text, '') ||
        COALESCE(patient_last_name::text, '') ||
        COALESCE(patient_dob::text, ''))::bytea)
        AS id,
      patient_first_name,
      patient_last_name,
      patient_dob
    FROM
      case_study.stg_claims
  ),
  patients_people AS (
    SELECT
      sha256(
        (COALESCE(patient_first_name::text, '') ||
        COALESCE(patient_last_name::text, '') ||
        COALESCE(patient_dob::text, ''))::bytea)
        AS id,
      patient_first_name,
      patient_last_name,
      patient_dob
    FROM
      case_study.stg_patients
  ),
  finally AS (
    SELECT * FROM claims_people
    UNION ALL
    SELECT * FROM patients_people
  )
  SELECT DISTINCT * FROM finally
);
