DROP TABLE IF EXISTS case_study.lnk_claims_people;
CREATE TABLE case_study.lnk_claims_people AS (
  WITH finally AS (
    SELECT
      sha256(claim_id::bytea) AS claims_id,
      sha256(
        (COALESCE(patient_first_name::text, '') ||
        COALESCE(patient_last_name::text, '') ||
        COALESCE(patient_dob::text, ''))::bytea)
        AS people_id
    FROM
      case_study.stg_claims
  )
  SELECT DISTINCT * FROM finally
);


DROP TABLE IF EXISTS case_study.lnk_members_people;
CREATE TABLE case_study.lnk_members_people AS (
  WITH finally AS (
    SELECT
      sha256(member_id::text::bytea) AS members_id,
      sha256(
        (COALESCE(patient_first_name::text, '') ||
        COALESCE(patient_last_name::text, '') ||
        COALESCE(patient_dob::text, ''))::bytea)
        AS people_id
    FROM
      case_study.stg_patients
  )
  SELECT DISTINCT * FROM finally
);


DROP TABLE IF EXISTS case_study.lnk_groups_members;
CREATE TABLE case_study.lnk_groups_members AS (
  WITH finally AS (
    SELECT
      sha256(group_name::bytea) AS groups_id,
      sha256(member_id::text::bytea) AS members_id
    FROM
      case_study.stg_patients
  )
  SELECT DISTINCT * FROM finally
);

DROP TABLE IF EXISTS case_study.lnk_claims_patients;
CREATE TABLE case_study.lnk_claims_patients AS (
  WITH finally AS (
    SELECT
      sha256(claim_id::bytea) AS claims_id,
      sha256(patient_id::text::bytea) AS patients_id
    FROM
      case_study.stg_claims
  )
  SELECT DISTINCT * FROM finally
);
