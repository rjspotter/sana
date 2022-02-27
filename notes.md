# Case Study

## Setup

- need to be superuser on a local postgresql
- create a database called `sana`
- replace all instances of hardcoded file path `/home/rjspotter/code/sana` with `pwd`
- run the files in the src directory in order e.g. `psql -h localhost -f src/000_schema.sql sana`

## Explainations

### Modeling

- Using a Hub and Spoke architecture

- Decided to separate the concepts of Member, Patient, and Person
  - It's more flexible this way
  - Since there's no direct link between Member and Patient in the data going
    through a 3rd concept allows you to refactor that concept later
  - Especially since that 3rd concept is a little fuzzy

- The surrogate (hub_id) key for Person is "Latin Normative" i.e. assumes that
  only letters and numbers are useful in identifying people

- The surrogage key for Person is also not collision-proof so these results can
  only be considered "probabalisticly true"

- Does not account for duplicate or late arriving data

- hubs, links, and (non-conformed) satellites can be processed in parallel

### Reporting

- "average per-claim cost across all members" doesn't specify which average so I
  gave mean, median, and mode

- "most expensive patients" stops as the concept of a patient but could join in
  the concept of a person if we needed to display name et al


### Misc.

- Unit Rate is blank so I dropped it from the warehouse.
