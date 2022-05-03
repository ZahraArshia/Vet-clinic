CREATE DATABASE vet_clinic
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

CREATE TABLE IF NOT EXISTS public.animals(
	Id SERIAL PRIMARY KEY,
	name VARCHAR,
	date_of_birth DATE,
	escape_attempts INT DEFAULT 0,
	neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL
);

SELECT * FROM animals;
