SELECT COUNT(*)
FROM penguins
WHERE
    species IS NULL OR
    island IS NULL OR
    culmen_length_mm IS NULL OR
    culmen_depth_mm IS NULL OR
    flipper_length_mm IS NULL OR
    body_mass_g IS NULL OR
    sex IS NULL;