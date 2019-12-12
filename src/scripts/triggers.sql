CREATE OR REPLACE FUNCTION update_world_mpi() RETURNS trigger AS $$
DECLARE 
	updated_region VARCHAR := '';
BEGIN
	IF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN
	   		updated_region := (SELECT world_region_name FROM mpi_subnational WHERE iso = NEW.iso);
	
	ELSIF TG_OP = 'DELETE' THEN
	        updated_region := (SELECT world_region_name FROM mpi_subnational WHERE iso = OLD.iso);
	END IF;

	IF updated_region != '' THEN 
		UPDATE world_agg SET
		mean_urban_mpi = (SELECT AVG(n.mpi_urban) 
			FROM mpi_national AS n 
			JOIN mpi_subnational as s ON s.iso = n.iso 
			WHERE s.world_region_name = updated_region),
		mean_rural_mpi = (SELECT AVG(n.mpi_rural) 
			FROM mpi_national AS n 
			JOIN mpi_subnational as s ON s.iso = n.iso 
			WHERE s.world_region_name = updated_region)
		WHERE region_name = updated_region;
	END IF;

  RETURN NEW;
END $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_world_nb() RETURNS trigger AS $$
BEGIN
	IF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN  
	UPDATE world_agg SET country_nb = (SELECT COUNT(DISTINCT(iso)) 
  										FROM mpi_subnational 
  										WHERE world_region_name = NEW.world_region_name) 
  	WHERE region_name = NEW.world_region_name; 
  	END IF;	

  	IF TG_OP = 'DELETE' OR TG_OP = 'UPDATE' THEN
  	UPDATE world_agg SET country_nb = (SELECT COUNT(DISTINCT(iso)) 
  										FROM mpi_subnational 
  										WHERE world_region_name = OLD.world_region_name) 
  	WHERE region_name = OLD.world_region_name;
  	END IF;

RETURN NEW;
END $$ LANGUAGE plpgsql;


CREATE TRIGGER mpi_national_trig AFTER INSERT OR DELETE OR UPDATE ON mpi_national
FOR EACH ROW
EXECUTE PROCEDURE update_world_mpi();


CREATE TRIGGER mpi_subnational_trig AFTER INSERT OR DELETE OR UPDATE ON mpi_subnational
FOR EACH ROW
EXECUTE PROCEDURE update_world_nb();

