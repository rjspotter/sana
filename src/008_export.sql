COPY case_study.rep_per_claim_cost TO '/home/rjspotter/code/sana/export/per_claim_cost.csv' DELIMITER ',' CSV HEADER;

COPY case_study.rep_most_expensive_companies TO '/home/rjspotter/code/sana/export/most_expensive_companies.csv' DELIMITER ',' CSV HEADER;

COPY case_study.rep_most_expensive_patients TO '/home/rjspotter/code/sana/export/most_expensive_patients.csv' DELIMITER ',' CSV HEADER;
