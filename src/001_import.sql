COPY case_study.raw_claims ("Claim Number", "Patient ID", "Patient First Name", "Patient Last Name", "Patient DOB", "In Network", "Claim Type")
FROM
'/home/rjspotter/code/sana/data/claims.csv'
Delimiter ','
CSV HEADER
;

COPY case_study.raw_claim_line_items ("Claim Number", "Date of Service", "Procedure Code", "Benefit Code", "Cost", "Quantity", "Unit Rate", "Emergency")
FROM
'/home/rjspotter/code/sana/data/claim_line_items.csv'
Delimiter ','
CSV HEADER
;

copy case_study.raw_patients ("Member ID", "First Name", "Last Name", "DOB", "Group Name")
FROM
'/home/rjspotter/code/sana/data/patients.csv'
Delimiter ','
CSV HEADER
;
