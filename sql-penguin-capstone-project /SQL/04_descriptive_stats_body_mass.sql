-- Calculate all twelve statistics in a single row first
WITH body_mass_stats AS (
    SELECT
        AVG(body_mass_g::DECIMAL) AS mean,
        PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY body_mass_g::DECIMAL) AS median,
	  	MODE() WITHIN GROUP (ORDER BY body_mass_g) AS mode,
	  	MIN(body_mass_g:: DECIMAL) AS min,
        MAX(body_mass_g) AS max,
	  	MAX(body_mass_g::DECIMAL) - MIN(body_mass_g::DECIMAL) AS range,
	  	STDDEV_SAMP(body_mass_g::NUMERIC) AS stdev,
	  	VAR_SAMP(body_mass_g::NUMERIC) AS var,
	  	PERCENTILE_CONT(0.25) WITHIN GROUP(ORDER BY body_mass_g::DECIMAL) AS q1,
	  	PERCENTILE_CONT(0.75) WITHIN GROUP(ORDER BY body_mass_g::DECIMAL) AS q2,
	  	PERCENTILE_CONT(0.75) WITHIN GROUP(ORDER BY body_mass_g::DECIMAL) - PERCENTILE_CONT(0.25) WITHIN GROUP(ORDER BY body_mass_g::DECIMAL) AS iqr,
	  3 * (AVG(body_mass_g::DECIMAL) - PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY body_mass_g::DECIMAL)) / STDDEV_SAMP(body_mass_g::NUMERIC) AS skew
    FROM penguins
)
-- Pivot results into columns and force 'X.XX' format
SELECT '1' AS sno, 'Mean' AS statistic, TO_CHAR(mean, 'FM9999.00') AS value FROM body_mass_stats
UNION ALL
SELECT '2' AS sno, 'Median' AS statistic, TO_CHAR(median, 'FM9999.00') AS value FROM body_mass_stats
UNION ALL
SELECT '3' AS sno, 'Mode' AS statistic, TO_CHAR(mode, 'FM9999.00') AS value FROM body_mass_stats
UNION ALL
SELECT '4' AS sno, 'Minimum' AS statistic, TO_CHAR(min, 'FM9999.00') AS value FROM body_mass_stats
UNION ALL
SELECT '5' AS sno, 'Maximum' AS statistic, TO_CHAR(max, 'FM9999.00') AS value FROM body_mass_stats
UNION ALL
SELECT '6' AS sno, 'Range' AS statistic, TO_CHAR(range, 'FM9999.00') AS value FROM body_mass_stats
UNION ALL
SELECT '7' AS sno, 'Standard Deviation' AS statistic, TO_CHAR(stdev, 'FM9999.00') AS value FROM body_mass_stats
UNION ALL
SELECT '8' AS sno, 'Variance' AS statistic, TO_CHAR(var, 'FM999999.00') AS value FROM body_mass_stats
UNION ALL
SELECT '9' AS sno, 'Q1' AS statistic, TO_CHAR(q1, 'FM9999.00') AS value FROM body_mass_stats
UNION ALL
SELECT '10' AS sno, 'Q2' AS statistic, TO_CHAR(q2, 'FM9999.00') AS value FROM body_mass_stats
UNION ALL
SELECT '11' AS sno, 'IQR' AS statistic, TO_CHAR(iqr, 'FM9999.00') AS value FROM body_mass_stats
UNION ALL
SELECT '12' AS sno, 'Skewness' AS statistic, TO_CHAR(skew, 'FM9999.00') AS value FROM body_mass_stats;