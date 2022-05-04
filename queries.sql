SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN 'JANUARY 1, 2016' AND 'DECEMBER 31, 2019';
SELECT * FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name <> 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN TRANSACTION;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN TRANSACTION;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species = 'unspecified';
COMMIT TRANSACTION;
SELECT * FROM animals;

BEGIN TRANSACTION;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth > 'JANUARY 1, 2022';
SAVEPOINT removeByAge;
UPDATE animals SET weight_kg = weight_kg * (-1);
ROLLBACK TO SAVEPOINT removeByAge;
UPDATE animals SET weight_kg = weight_kg * (-1) WHERE weight_kg < 0;
COMMIT TRANSACTION;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered,AVG(escape_attempts) FROM animals GROUP BY neutered;
SELECT species,MIN(weight_kg),MAX(weight_kg) FROM animals GROUP BY species;
SELECT species,AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN 'JANUARY 1, 1990' AND 'DECEMBER 31, 2000' GROUP BY species;

SELECT * FROM animals JOIN owners ON owners_id = owners.id WHERE full_name = 'Melody Pond';
SELECT * FROM animals JOIN species ON species_id = species.id WHERE species.name = 'Pokemon';
SELECT owners.full_name FROM owners FULL OUTER JOIN animals ON owners.id = animals.id;
SELECT species.name, COUNT(*) FROM species LEFT JOIN animals ON species.id = animals.species_id GROUP BY species.name;
SELECT * FROM animals INNER JOIN owners ON animals.owners_id = owners.id WHERE owners.full_name = 'Jennifer Orwell'  AND animals.species_id = (SELECT id from species WHERE name = 'Digimon');
SELECT * FROM animals INNER JOIN owners ON animals.owners_id = owners.id WHERE owners.full_name = 'Dean Winchester'  AND animals.escape_attempts = 0;
SELECT owners.full_name, COUNT(*) FROM owners LEFT JOIN animals ON owners.id =  animals.owners_id GROUP BY owners.full_name ORDER BY COUNT DESC LIMIT 1;
