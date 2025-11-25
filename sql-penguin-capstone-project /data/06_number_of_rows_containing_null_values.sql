SELECT COUNT(*)
FROM penguins
WHERE
    studyname IS NULL OR
    sample_number IS NULL OR
    species IS NULL OR
    region IS NULL Or
    island IS NULL OR
    stage IS NULL OR
    individual_id IS NULL OR
    clutch_completion IS NULL OR
    date_egg IS NULL OR
    culmen_length_mm IS NULL OR
    culmen_depth_mm IS NULL OR
    flipper_length_mm IS NULL OR
    body_mass_g IS NULL OR
    sex IS NULL OR
    delta_15_n_o_oo IS NULL OR
    delta_13_c_o_oo IS NULL;
