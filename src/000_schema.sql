DROP SCHEMA if EXISTS case_study CASCADE;
CREATE SCHEMA case_study;

DROP TABLE IF EXISTS case_study.raw_claims;
CREATE TABLE case_study.raw_claims (
  "Claim Number" varchar(256),
  "Patient ID" varchar(256),
  "Patient First Name" varchar(256),
  "Patient Last Name" varchar(256),
  "Patient DOB" varchar(256),
  "In Network" varchar(256),
  "Claim Type" varchar(256)
);

DROP TABLE IF EXISTS case_study.raw_claim_line_items;
CREATE TABLE case_study.raw_claim_line_items (
  "Claim Number" varchar(256),
  "Date of Service" varchar(256),
  "Procedure Code" varchar(256),
  "Benefit Code" varchar(256),
  "Cost" varchar(256),
  "Quantity" varchar(256),
  "Unit Rate" varchar(256),
  "Emergency" varchar(256)
);

DROP TABLE IF EXISTS case_study.raw_patients;
CREATE TABLE case_study.raw_patients (
  "Member ID" varchar(256),
  "First Name" varchar(256),
  "Last Name" varchar(256),
  "DOB" varchar(256),
  "Group Name" varchar(256)
);
