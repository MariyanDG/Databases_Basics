--3.Update
/* Kaloqn Stoqnov (a current owner, present in the database) came to the zoo to adopt all the animals, who don't have an owner. Update the records by putting to those animals the correct OwnerId. */

SELECT * FROM Animals;

UPDATE Animals
SET OwnerId = 4
WHERE OwnerId IS NULL;