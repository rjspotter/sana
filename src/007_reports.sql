DROP TABLE IF EXISTS case_study.rep_per_claim_cost;
CREATE TABLE case_study.rep_per_claim_cost AS (
  SELECT
    avg(total_cost) AS mean,
    percentile_disc(0.5) within group (order by total_cost) AS median,
    mode() within group (order by total_cost) AS mode
  FROM
    case_study.sat_claim_item_aggregates
);


DROP TABLE IF EXISTS case_study.rep_most_expensive_companies;
CREATE TABLE case_study.rep_most_expensive_companies AS (
  SELECT
    groups.group_name,
    agg.claim_total
  FROM
    case_study.sat_group_claim_aggregates AS agg
  INNER JOIN case_study.hub_groups AS groups
    ON agg.hub_id = groups.id
  ORDER BY 2 DESC
);


DROP TABLE IF EXISTS case_study.rep_most_expensive_patients;
CREATE TABLE case_study.rep_most_expensive_patients AS (
  SELECT
    hub.patient_id,
    sat.claim_total
  FROM
    case_study.sat_patients_claim_aggregates AS sat
  INNER JOIN
    case_study.hub_patients AS hub
    ON sat.hub_id = hub.id
  ORDER BY 2 DESC
);
