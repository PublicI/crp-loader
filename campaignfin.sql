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

CREATE INDEX crp_contributions_contribid_idx ON crp_contributions USING btree (contribid);
CREATE INDEX crp_contributions_cycle_idx ON crp_contributions USING btree (cycle);
CREATE INDEX crp_contributions_recipid_idx ON crp_contributions USING btree (recipid);

GRANT ALL ON TABLE crp_contributions TO redash_default;
GRANT ALL ON TABLE crp_contributions TO politics;
