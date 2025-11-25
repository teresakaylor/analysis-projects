SELECT sex,
    COUNT(*) AS count,
    ROUND(AVG(culmen_length_mm::DECIMAL), 1) AS avg_culmen_length,
    ROUND(AVG(culmen_depth_mm::DECIMAL), 1) AS max_culmen_depth,    
    ROUND(AVG(flipper_length_mm::DECIMAL), 1) AS avg_flipper_length,
    ROUND(AVG(body_mass_g::DECIMAL), 1) AS avg_body_mass
FROM penguins
GROUP BY
    sex
ORDER BY
    sex;