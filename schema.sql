CREATE DATABASE vet_clinic
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

CREATE TABLE IF NOT EXISTS public.animals(
	id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(100),
	date_of_birth DATE,
	escape_attempts INT DEFAULT 0,
	neutered BOOLEAN,
    	weight_kg DECIMAL
);

ALTER TABLE animals
ADD COLUMN species VARCHAR(200);
