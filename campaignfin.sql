DROP TABLE crp_contributions;

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

GRANT ALL ON TABLE crp_contributions TO redash_default;
GRANT ALL ON TABLE crp_contributions TO politics;

DROP TABLE crp_committees;

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

GRANT ALL ON TABLE crp_committees TO redash_default;
GRANT ALL ON TABLE crp_committees TO politics;
