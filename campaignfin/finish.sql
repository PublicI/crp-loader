UPDATE crp_contributions SET type = trim(type) WHERE type != trim(type);
CREATE INDEX IF NOT EXISTS crp_contributions_contribid_idx ON crp_contributions USING btree (contribid);
CREATE INDEX IF NOT EXISTS crp_contributions_cycle_idx ON crp_contributions USING btree (cycle);
CREATE INDEX IF NOT EXISTS crp_contributions_recipid_idx ON crp_contributions USING btree (recipid);
