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

CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(200),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY(id)
);

CREATE TABLE specializations(
	id INT GENERATED ALWAYS AS IDENTITY,
    species_id INT,
    vet_id INT,
    FOREIGN KEY (species_id) REFERENCES species(id),
    FOREIGN KEY (vet_id) REFERENCES vets(id)
);

CREATE TABLE visits(
	id INT GENERATED ALWAYS AS IDENTITY,
	date_of_visit DATE,
    animal_id INT,
    vet_id INT,
    FOREIGN KEY (animal_id) REFERENCES animals(id),
    FOREIGN KEY (animal_id) REFERENCES animals(id)
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

BEGIN TRANSACTION;
CREATE INDEX owners_email_index ON owners(email);
