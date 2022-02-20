DROP TABLE IF EXISTS case_study.sat_claim_item_aggregates;
CREATE TABLE case_study.sat_claim_item_aggregates AS (
  WITH finally AS (
    SELECT
      hub,
      hub_id,
      sum(cost) AS total_cost
    FROM
      case_study.sat_claim_line_items
    GROUP BY 1, 2
  )
  SELECT
    sha256(case_study.gen_random_uuid()::text::bytea) AS id,
    *
  FROM
  finally
);

DROP TABLE IF EXISTS case_study.sat_group_claim_aggregates;
CREATE TABLE case_study.sat_group_claim_aggregates AS (
  WITH finally AS (
    SELECT
      case_study.lnk_groups_members.groups_id AS hub_id,
      SUM(claim_totals.total_cost) AS claim_total
    FROM
      case_study.lnk_groups_members
    INNER JOIN case_study.lnk_members_people
      ON case_study.lnk_groups_members.members_id = case_study.lnk_members_people.members_id
    INNER JOIN case_study.lnk_claims_people
      ON case_study.lnk_members_people.people_id = case_study.lnk_claims_people.people_id
    INNER JOIN case_study.sat_claim_item_aggregates AS claim_totals
      ON case_study.lnk_claims_people.claims_id = claim_totals.hub_id
    GROUP BY 1
  )
  SELECT
    sha256(case_study.gen_random_uuid()::text::bytea) AS id,
    'hub_groups' AS hub,
    *
  FROM
    finally
);


DROP TABLE IF EXISTS case_study.sat_patients_claim_aggregates;
CREATE TABLE case_study.sat_patients_claim_aggregates AS (
  WITH finally AS (
    SELECT
      case_study.lnk_claims_patients.patients_id AS hub_id,
      SUM(claim_totals.total_cost) AS claim_total
    FROM
      case_study.lnk_claims_patients
    INNER JOIN case_study.sat_claim_item_aggregates AS claim_totals
      ON case_study.lnk_claims_patients.claims_id = claim_totals.hub_id
    GROUP BY 1
  )
  SELECT
    sha256(case_study.gen_random_uuid()::text::bytea) AS id,
    'hub_patients' AS hub,
    *
  FROM
    finally
);
