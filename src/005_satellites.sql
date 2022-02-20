DROP TABLE IF EXISTS case_study.sat_claim_types;
CREATE TABLE case_study.sat_claim_types AS (
  SELECT
    sha256(id::text::bytea) AS id,
    'hub_claims' AS hub,
    sha256(claim_id::bytea) AS hub_id,
    claim_type,
    is_in_network,
    loaded_at
  FROM
    case_study.stg_claims
);


DROP TABLE IF EXISTS case_study.sat_claim_line_items;
CREATE TABLE case_study.sat_claim_line_items AS (
  SELECT
    sha256(id::text::bytea) AS id,
    'hub_claims' AS hub,
    sha256(claim_id::bytea) AS hub_id,
    service_date,
    procedure_code,
    benefit_code,
    cost,
    quantity,
    is_emergency,
    loaded_at
  FROM
    case_study.stg_claim_line_items
);
