DROP TABLE IF EXISTS crime_data;
DROP TABLE IF EXISTS climate_data;
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


CREATE TABLE climate_data (

	-- Observation station
	STATION	TEXT,

	--Station location
	STATION_LOC TEXT,

	LATITUDE DOUBLE PRECISION,

	LONGITUDE DOUBLE PRECISION,

	ELEVATION DOUBLE PRECISION,

	RECORD_DATE DATE,

	-- Average wind speed
	AWND DOUBLE PRECISION,
	AWND_ATTRIBUTES TEXT,

	-- Number of days included in the multiday precipitation total (MDPR)
	DAPR DOUBLE PRECISION,
	DAPR_ATTRIBUTES TEXT,

	-- Evaporation
	EVAP DOUBLE PRECISION,
	EVAP_ATTRIBUTES TEXT,

	-- Multiday total precipitation
	MDPR DOUBLE PRECISION,
	MDPR_ATTRIBUTES TEXT,

	-- Peak gust time
	PGTM TIME,
	PGTM_ATTRIBUTES TEXT,

	-- Precipitation
	PRCP DOUBLE PRECISION,
	PRCP_ATTRIBUTES TEXT,

	-- Daily percent of possible sunshine
	PSUN DOUBLE PRECISION,
	PSUN_ATTRIBUTES TEXT,
	
	SN52 DOUBLE PRECISION,
	SN52_ATTRIBUTES TEXT,

	-- Snowfall
	SNOW DOUBLE PRECISION,
	SNOW_ATTRIBUTES TEXT,

	-- Snowfall depth
	SNWD DOUBLE PRECISION,
	SNWD_ATTRIBUTES TEXT,
	SX52 DOUBLE PRECISION,
	SX52_ATTRIBUTES TEXT,
	
	-- Average temperature
	TAVG DOUBLE PRECISION,
	TAVG_ATTRIBUTES TEXT,

	-- Maximum temperature
	TMAX DOUBLE PRECISION,
	TMAX_ATTRIBUTES TEXT,
	
	-- Minimum temperature
	TMIN DOUBLE PRECISION,
	TMIN_ATTRIBUTES TEXT,

	-- Temperature at the time of observation
	TOBS DOUBLE PRECISION,
	TOBS_ATTRIBUTES TEXT,

	-- Direction of fastest 2-minute wind
	WDF2 DOUBLE PRECISION,
	WDF2_ATTRIBUTES TEXT,

	-- Direction of fastest 5-second wind
	WDF5 DOUBLE PRECISION,
	WDF5_ATTRIBUTES TEXT,

	-- Water equivalent of accumulated snowfall
	WESD DOUBLE PRECISION,
	WESD_ATTRIBUTES TEXT,

	-- Water equivalent of snowfall
	WESF DOUBLE PRECISION,
	WESF_ATTRIBUTES TEXT,

	-- Fastest 2-minute wind speed
	WSF2 DOUBLE PRECISION,
	WSF2_ATTRIBUTES TEXT,

	-- Fastest 5-second wind speed
	WSF5 DOUBLE PRECISION,
	WSF5_ATTRIBUTES TEXT,

	-- Fog, ice fog, or freezing and heavy fog
	WT01 DOUBLE PRECISION,
	WT01_ATTRIBUTES TEXT,
	
	-- Heavy fog or heaving/freezing fog
	WT02 DOUBLE PRECISION,
	WT02_ATTRIBUTES TEXT,

	-- Thunder
	WT03 DOUBLE PRECISION,
	WT03_ATTRIBUTES TEXT,
	
	WT04 DOUBLE PRECISION,
	WT04_ATTRIBUTES TEXT,

	-- Hail
	WT05 DOUBLE PRECISION,
	WT05_ATTRIBUTES TEXT,
	WT06 DOUBLE PRECISION,
	WT06_ATTRIBUTES TEXT,

	-- Smoke or haze
	WT08 DOUBLE PRECISION,
	WT08_ATTRIBUTES TEXT,
	WT09 DOUBLE PRECISION,
	WT09_ATTRIBUTES TEXT,
	WT10 DOUBLE PRECISION,
	WT10_ATTRIBUTES TEXT,

	-- High or damaging winds
	WT11 DOUBLE PRECISION,
	WT11_ATTRIBUTES TEXT,
	WT18 DOUBLE PRECISION,
	WT18_ATTRIBUTES TEXT
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
	climate_file_path TEXT[];
	
	load_query TEXT;

	
-- Additionally, you may need to grant user permissions for PostgreSQL to access the CSV files.
-- 	1. Locate the folder: DataSets
--  2. Right click and select 'Properties'
--  3. Navigate to 'Security'
--  4. Click 'Edit' then 'Add'
--  5. Type 'Everyone' then hit enter
--  6. Select 'Read & Execute' and 'Read'
--  7. Hit 'Apply'


-- loads crime data from the following CSV files
BEGIN
	
	crime_file_path := FORMAT('C:\Users\%s\Downloads\DataSets\CrimeData\Crime_Data_from_2020_to_Present.csv', UserName);
	complaint_file_path := FORMAT('C:\Users\%s\Downloads\DataSets\ConsumerComplaintsData\CGB_-_Consumer_Complaints_Data.csv', UserName);

	climate_file_path[1] := FORMAT('C:\Users\%s\Downloads\DataSets\ClimateData\4169072.csv', UserName);
	climate_file_path[2] := FORMAT('C:\Users\%s\Downloads\DataSets\ClimateData\4169047.csv', UserName);
	climate_file_path[3] := FORMAT('C:\Users\%s\Downloads\DataSets\ClimateData\4169048.csv', UserName);
	climate_file_path[4] := FORMAT('C:\Users\%s\Downloads\DataSets\ClimateData\4169049.csv', UserName);
	climate_file_path[5] := FORMAT('C:\Users\%s\Downloads\DataSets\ClimateData\4169050.csv', UserName);
	climate_file_path[6] := FORMAT('C:\Users\%s\Downloads\DataSets\ClimateData\4169052.csv', UserName);
	climate_file_path[7] := FORMAT('C:\Users\%s\Downloads\DataSets\ClimateData\4169058.csv', UserName);
	climate_file_path[8] := FORMAT('C:\Users\%s\Downloads\DataSets\ClimateData\4169062.csv', UserName);
	climate_file_path[9] := FORMAT('C:\Users\%s\Downloads\DataSets\ClimateData\4169064.csv', UserName);
	climate_file_path[10] := FORMAT('C:\Users\%s\Downloads\DataSets\ClimateData\4169067.csv', UserName);
	climate_file_path[11] := FORMAT('C:\Users\%s\Downloads\DataSets\ClimateData\4169068.csv', UserName);
	climate_file_path[12] := FORMAT('C:\Users\%s\Downloads\DataSets\ClimateData\4169070.csv', UserName);
	
	
	load_query := 'COPY crime_data FROM ' || quote_literal(crime_file_path) || 'NULL '''' DELIMITER '','' CSV HEADER';
	EXECUTE load_query;
	RAISE NOTICE 'Completed Crime Data Load';
	
	load_query := 'COPY complaint_data FROM ' || quote_literal(complaint_file_path) || 'NULL '''' DELIMITER '','' CSV HEADER';
	EXECUTE load_query;
	RAISE NOTICE 'Completed Consumer Complaint Data Load';

	FOR i IN 1..12 LOOP
		load_query := 'COPY climate_data FROM ' || quote_literal(climate_file_path[i]) || 'NULL '''' DELIMITER '','' CSV HEADER';
		EXECUTE load_query;
		RAISE NOTICE 'Completed Climate Data Load';
	END LOOP;
	
END $$;
