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

DROP TABLE crp_comm_to_cand_contributions;

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

GRANT ALL ON TABLE crp_comm_to_cand_contributions TO redash_default;
GRANT ALL ON TABLE crp_comm_to_cand_contributions TO politics;

DROP TABLE crp_comm_to_comm_contributions;

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

GRANT ALL ON TABLE crp_comm_to_cand_contributions TO redash_default;
GRANT ALL ON TABLE crp_comm_to_cand_contributions TO politics;

DROP TABLE crp_candidates;

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

GRANT ALL ON TABLE crp_candidates TO redash_default;
GRANT ALL ON TABLE crp_candidates TO politics;
