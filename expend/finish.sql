CREATE INDEX IF NOT EXISTS crp_expenditures_crp_filer_id ON crp_expenditures USING btree (crp_filer_id);
CREATE INDEX IF NOT EXISTS crp_expenditures_exp_code ON crp_expenditures USING btree (exp_code);
CREATE INDEX IF NOT EXISTS crp_expenditures_cycle ON crp_expenditures USING btree (cycle);
