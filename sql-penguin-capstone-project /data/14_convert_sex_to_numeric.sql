ALTER TABLE penguins
ADD COLUMN sex_bin INTEGER;

UPDATE penguins
SET sex_bin =
CASE
WHEN sex = 'FEMALE' THEN 0
WHEN sex = 'MALE' THEN 1
END;