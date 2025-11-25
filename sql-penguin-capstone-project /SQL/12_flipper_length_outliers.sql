WITH OutlierBounds AS (
    SELECT
        species,
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY flipper_length_mm::DECIMAL) AS Q1,
        PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY flipper_length_mm::DECIMAL) AS Q3
    FROM penguins
    GROUP BY species
),

IQR_Fences AS (
    SELECT
        species,
        Q1,
        Q3,
        (Q3 - Q1) AS IQR,
        -- Calculate Lower Fence: Q1 - (1.5 * IQR)
        (Q1 - 1.5 * (Q3 - Q1)) AS LowerFence,
        -- Calculate Upper Fence: Q3 + (1.5 * IQR)
        (Q3 + 1.5 * (Q3 - Q1)) AS UpperFence
    FROM OutlierBounds
)

SELECT
    p.species, p.flipper_length_mm, p.sex, 
    f.LowerFence, f.UpperFence
FROM penguins AS p
INNER JOIN
    IQR_Fences AS f ON p.species = f.species
WHERE p.flipper_length_mm < f.LowerFence OR p.flipper_length_mm > f.UpperFence;