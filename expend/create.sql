CREATE TABLE IF NOT EXISTS crp_expenditures (
    cycle text,
    id text,
    trans_id text,
    crp_filer_id text,
    recip_code text,
    pac_short text,
    crp_recip_name text,
    exp_code text,
    amount numeric,
    expenditure_date date,
    city text,
    state text,
    zip text,
    cmte_id_ef text,
    candid text,
    type text,
    descrip text,
    pg text,
    elec_other text,
    ent_type text,
    source text
);

DELETE FROM crp_expenditures;

GRANT ALL ON TABLE crp_expenditures TO redash_default;
GRANT ALL ON TABLE crp_expenditures TO politics;
