DELETE FROM penguins AS p
USING (
    WITH OutlierBounds AS (
        SELECT
            species,
            PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY body_mass_g::DECIMAL) AS Q1,
            PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY body_mass_g::DECIMAL) AS Q3
        FROM penguins
        GROUP BY species
    ),

    IQR_Fences AS (
        SELECT
            species,
            (Q1 - 1.5 * (Q3 - Q1)) AS LowerFence,
            (Q3 + 1.5 * (Q3 - Q1)) AS UpperFence
        FROM
            OutlierBounds
    )

    SELECT
        species,
        LowerFence,
        UpperFence
    FROM IQR_Fences
) AS f
WHERE
    p.species = f.species AND
    (p.body_mass_g < f.LowerFence OR p.body_mass_g > f.UpperFence);