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

CREATE TABLE public.owners
(
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name character varying(200),
    age integer,
    PRIMARY KEY (id)
);

CREATE TABLE public.species
(
    id INT GENERATED ALWAYS AS IDENTITY,
    name character varying(200),
    PRIMARY KEY (id)
);

ALTER TABLE animals DROP COLUMN IF EXISTS species;
ALTER TABLE animals ADD COLUMN species_id INT;
ALTER TABLE animals ADD CONSTRAINT species_fkey FOREIGN KEY (species_id) REFERENCES species(id) ON DELETE CASCADE;
ALTER TABLE animals ADD COLUMN owners_id INT;
ALTER TABLE animals ADD CONSTRAINT owners_fkey FOREIGN KEY (owners_id) REFERENCES owners(id) ON DELETE CASCADE;
