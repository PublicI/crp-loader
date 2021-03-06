CREATE TABLE IF NOT EXISTS crp_contributions (
    cycle text,
    fectransid text,
    contribid text,
    contrib text,
    recipid text,
    orgname text,
    ultorg text,
    realcode text,
    date date,
    amount integer,
    street text,
    city text,
    state text,
    zip text,
    recipcode text,
    type text,
    cmteid text,
    otherid text,
    gender text,
    microfilm text,
    occupation text,
    employer text,
    source text
);

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

CREATE TABLE IF NOT EXISTS crp_committees (
    cycle text,
    cmteid text,
    pacshort text,
    affiliate text,
    ultorg text,
    recipid text,
    recipcode text,
    feccandid text,
    party text,
    primcode text,
    source text,
    sensitive text,
    "foreign" text,
    active text
);

CREATE TABLE IF NOT EXISTS crp_comm_to_cand_contributions (
    cycle text,
    fecrecno text,
    pacid text,
    cid text,
    amount integer,
    date date,
    realcode text,
    type text,
    di text,
    feccandid text
);

CREATE TABLE IF NOT EXISTS crp_comm_to_comm_contributions (
    cycle text,
    fecrecno text,
    filerid text,
    donorcmte text,
    contriblendtrans text,
    city text,
    state text,
    zip text,
    fecoccemp text,
    primcode text,
    date date,
    amount decimal(12,2),
    recipid text,
    party text,
    otherid text,
    recipcode text,
    recipprimcode text,
    amend text,
    report text,
    pg text,
    microfilm text,
    type text,
    realcode text,
    source text
);

CREATE TABLE IF NOT EXISTS crp_candidates (
    cycle text,
    feccandid text,
    cid text,
    firstlastp text,
    party text,
    distidrunfor text,
    distidcurr text,
    currcand text,
    cyclecand text,
    crpico text,
    recipcode text,
    nopacs text
);

CREATE INDEX IF NOT EXISTS crp_contributions_contribid_idx ON crp_contributions USING btree (contribid);
CREATE INDEX IF NOT EXISTS crp_contributions_cycle_idx ON crp_contributions USING btree (cycle);
CREATE INDEX IF NOT EXISTS crp_contributions_recipid_idx ON crp_contributions USING btree (recipid);

CREATE INDEX IF NOT EXISTS crp_expenditures_crp_filer_id ON crp_expenditures USING btree (crp_filer_id);
CREATE INDEX IF NOT EXISTS crp_expenditures_exp_code ON crp_expenditures USING btree (exp_code);
CREATE INDEX IF NOT EXISTS crp_expenditures_cycle ON crp_expenditures USING btree (cycle);

