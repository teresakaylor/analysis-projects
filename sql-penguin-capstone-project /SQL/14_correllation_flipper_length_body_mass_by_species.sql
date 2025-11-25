SELECT
    'Adelie' AS species,
    ROUND(CORR(flipper_length_mm, body_mass_g)::NUMERIC, 2) AS correlation
FROM penguins
WHERE species = 'Adelie'

UNION ALL

SELECT
    'Chinstrap' AS species,
    ROUND(CORR(flipper_length_mm, body_mass_g)::NUMERIC, 2) AS correlation
FROM penguins
WHERE species = 'Chinstrap'

UNION ALL

SELECT
    'Gentoo' AS species,
    ROUND(CORR(flipper_length_mm, body_mass_g)::NUMERIC, 2) AS correlation
FROM penguins
WHERE species = 'Gentoo';