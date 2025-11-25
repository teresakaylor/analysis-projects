UPDATE penguins
SET species = split_part(species, ' ', 1);