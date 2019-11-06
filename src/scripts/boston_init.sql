SET client_encoding = 'ISO_8859_1';
CREATE TABLE IF NOT EXISTS boston_crimes(
	id SERIAL,
	incident_number VARCHAR (50) NOT NULL, 
	offense_code VARCHAR (20) NOT NULL,
	offense_code_group VARCHAR (50) NOT NULL,
	offense_description VARCHAR (100) NOT NULL,
	district VARCHAR (5) NULL,
	reporting_area SMALLINT NULL,
	shooting VARCHAR (50) NULL,
	occurred_on_date TIMESTAMP NOT NULL,
	year SMALLINT NOT NULL,
	month SMALLINT NOT NULL,
	day_of_week VARCHAR (20) NOT NULL,
	hour SMALLINT NOT NULL,
	ucr_part VARCHAR (20) NULL,
	street VARCHAR (50) NULL,
	latitude REAL NULL,
	longitude REAL NULL,
	location VARCHAR (50) NULL
);

COPY boston_crimes(incident_number,offense_code,offense_code_group,offense_description,district,reporting_area,shooting,occurred_on_date,year,month,day_of_week,hour,ucr_part,street,latitude,longitude,location)
FROM '/data/boston-crime-data/crime.csv' DELIMITER ',' NULL '' CSV HEADER ;
