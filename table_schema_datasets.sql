DROP TABLE IF EXISTS crime_data;
DROP TABLE IF EXISTS complaint_data;

CREATE TABLE crime_data (
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


CREATE TABLE complaint_data (

	ticket_ID INTEGER,
	ticket_create_date DATE,
	create_date DATE,
	issue_date DATE,
	issue_time TEXT,
	form TEXT,
	submit_method TEXT,
	issue TEXT,
	caller_id TEXT,
	caller_id_num TEXT,
	submit_type TEXT,
	advert_num TEXT,
	city TEXT,
	state TEXT,
	zip TEXT,
	location TEXT
);



-- **NOTE** Please set the 'UserName' variable to reflect your username
DO $$
DECLARE
	UserName CONSTANT TEXT := 'Danie';

	crime_file_path TEXT;
	complaint_file_path TEXT;
	
	load_query TEXT;

	
-- Additionally, you may need to grant user permissions for PostgreSQL to access the CSV files.
-- 	1. Locate the folder: DataSets
--  2. Right click and select 'Properties'
--  3. Navigate to 'Security'
--  4. Click 'Edit' then 'Add'
--  5. Type 'Everyone' then hit enter
--  6. Select 'Read & Execute' and 'Read'
--  7. Hit 'Apply'


-- loads data from the following CSV files
BEGIN
	
	crime_file_path := FORMAT('C:\Users\%s\Downloads\DataSets\CrimeData\Crime_Data_from_2020_to_Present.csv', UserName);
	complaint_file_path := FORMAT('C:\Users\%s\Downloads\DataSets\ConsumerComplaintsData\CGB_-_Consumer_Complaints_Data.csv', UserName);

	load_query := 'COPY crime_data FROM ' || quote_literal(crime_file_path) || 'NULL '''' DELIMITER '','' CSV HEADER';
	EXECUTE load_query;
	RAISE NOTICE 'Completed Crime Data Load';
	
	load_query := 'COPY complaint_data FROM ' || quote_literal(complaint_file_path) || 'NULL '''' DELIMITER '','' CSV HEADER';
	EXECUTE load_query;
	RAISE NOTICE 'Completed Consumer Complaint Data Load';
	
END $$;
