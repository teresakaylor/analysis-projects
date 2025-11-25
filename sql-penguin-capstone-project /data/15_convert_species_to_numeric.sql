ALTER TABLE penguins
ADD COLUMN adelie_bin INTEGER;

UPDATE penguins
SET adelie_bin =
CASE
WHEN species = 'Adelie' THEN 1
ELSE 0
END;


ALTER TABLE penguins
ADD COLUMN chinstrap_bin INTEGER;

UPDATE penguins
SET chinstrap_bin =
CASE
WHEN species = 'Chinstrap' THEN 1
ELSE 0
END;


ALTER TABLE penguins
ADD COLUMN gentoo_bin INTEGER;

UPDATE penguins
SET gentoo_bin =
CASE
WHEN species = 'Gentoo' THEN 1
ELSE 0
END;

