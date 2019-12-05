SET client_encoding = 'UTF-8';
CREATE TABLE IF NOT EXISTS mpi_national(
	iso CHAR(3) PRIMARY KEY NOT NULL,
	country_name VARCHAR(80) NOT NULL UNIQUE,
	mpi_urban REAL NOT NULL,
	headcount_ratio_urban REAL NOT NULL,
	intensity_urban REAL NOT NULL,
	mpi_rural REAL NOT NULL,
	headcount_ratio REAL NOT NULL,
	intensity_rural REAL NOT NULL
	); 

COPY mpi_national(iso,country_name,mpi_urban,headcount_ratio_urban,intensity_urban,mpi_rural,headcount_ratio,intensity_rural)
FROM '/data/mpi/MPI_national.csv' DELIMITER ',' NULL '' CSV HEADER ;

CREATE TABLE IF NOT EXISTS mpi_subnational(
	iso CHAR(3) REFERENCES mpi_national(iso),
	country_name VARCHAR(80) NOT NULL,
	subregion_name VARCHAR(60) NOT NULL,
	world_region_name VARCHAR(30) NOT NULL, 
	mpi_national REAL NOT NULL,
	mpi_regional REAL NOT NULL,
	headcount_ratio_regional REAL NOT NULL,
	intensity_regional REAL NULL 
	);

COPY mpi_subnational(iso,country_name,subregion_name,world_region_name,mpi_national,mpi_regional,headcount_ratio_regional,intensity_regional)
FROM '/data/mpi/MPI_subnational.csv' DELIMITER ',' NULL '' CSV HEADER ;
