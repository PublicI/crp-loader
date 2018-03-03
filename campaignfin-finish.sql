UPDATE crp_contributions SET type = trim(type);
CREATE INDEX crp_contributions_contribid_idx ON crp_contributions USING btree (contribid);
CREATE INDEX crp_contributions_cycle_idx ON crp_contributions USING btree (cycle);
CREATE INDEX crp_contributions_recipid_idx ON crp_contributions USING btree (recipid);
