CREATE TABLE IF NOT EXISTS world_agg(
	region_name VARCHAR(60) NOT NULL,
	country_nb INTEGER NOT NULL,
	mean_urban_mpi REAL NOT NULL, 
	mean_rural_mpi REAL NOT NULL
);

INSERT INTO world_agg
SELECT s.world_region_name, COUNT(DISTINCT(n.iso)), AVG(n.mpi_urban), AVG(n.mpi_rural)
FROM mpi_national AS n
INNER JOIN mpi_subnational AS s ON s.iso = n.iso
GROUP BY s.world_region_name;
