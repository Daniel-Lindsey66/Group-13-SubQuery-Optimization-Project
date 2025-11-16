DROP TABLE IF EXISTS crimedata;

CREATE TABLE crimedata (
    dr_no              BIGINT,
    date_rptd          TIMESTAMP,
    date_occ           TIMESTAMP,
    time_occ           INTEGER,
    area               SMALLINT,
    area_name          TEXT,
    rpt_dist_no        INTEGER,
    part_1_2           SMALLINT,
    crm_cd             INTEGER,
    crm_cd_desc        TEXT,
    mocodes            TEXT,
    vict_age           SMALLINT,
    vict_sex           CHAR(1),
    vict_descent       CHAR(1),
    premis_cd          INTEGER,
    premis_desc        TEXT,
    weapon_used_cd     INTEGER,
    weapon_desc        TEXT,
    status             TEXT,
    status_desc        TEXT,
    crm_cd_1           INTEGER,
    crm_cd_2           INTEGER,
    crm_cd_3           INTEGER,
    crm_cd_4           INTEGER,
    location           TEXT,
    cross_street       TEXT,
    lat                DOUBLE PRECISION,
    lon                DOUBLE PRECISION
);

-- **NOTE** Please change absolute file path to reflect your username
-- load crime data from CSV file
copy crimedata FROM 'C:\Users\USERNAME_GOES_HERE\Downloads\DataSets\CrimeData\Crime_Data_from_2020_to_Present.csv' DELIMITER ',' CSV HEADER; 
