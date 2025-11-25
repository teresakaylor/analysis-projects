-- Calculate all twelve statistics in a single row first
WITH flipper_length_stats AS (
    SELECT
        AVG(flipper_length_mm::DECIMAL) AS mean,
        PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY flipper_length_mm::DECIMAL) AS median,
	  	MODE() WITHIN GROUP (ORDER BY flipper_length_mm) AS mode,
	  	MIN(flipper_length_mm:: DECIMAL) AS min,
        MAX(flipper_length_mm) AS max,
	  	MAX(flipper_length_mm::DECIMAL) - MIN(flipper_length_mm::DECIMAL) AS range,
	  	STDDEV_SAMP(flipper_length_mm::NUMERIC) AS stdev,
	  	VAR_SAMP(flipper_length_mm::NUMERIC) AS var,
	  	PERCENTILE_CONT(0.25) WITHIN GROUP(ORDER BY flipper_length_mm::DECIMAL) AS q1,
	  	PERCENTILE_CONT(0.75) WITHIN GROUP(ORDER BY flipper_length_mm::DECIMAL) AS q2,
	  	PERCENTILE_CONT(0.75) WITHIN GROUP(ORDER BY flipper_length_mm::DECIMAL) - PERCENTILE_CONT(0.25) WITHIN GROUP(ORDER BY flipper_length_mm::DECIMAL) AS iqr,
	  	3 * (AVG(flipper_length_mm::DECIMAL) - PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY flipper_length_mm::DECIMAL)) / STDDEV_SAMP(flipper_length_mm::NUMERIC) AS skew
    FROM penguins
	WHERE species = 'Chinstrap'
)
-- Pivot results into columns and force 'X.XX' format
SELECT '1' AS sno, 'Mean' AS statistic, TO_CHAR(mean, 'FM999.00') AS value FROM flipper_length_stats
UNION ALL
SELECT '2' AS sno, 'Median' AS statistic, TO_CHAR(median, 'FM999.00') AS value FROM flipper_length_stats
UNION ALL
SELECT '3' AS sno, 'Mode' AS statistic, TO_CHAR(mode, 'FM999.00') AS value FROM flipper_length_stats
UNION ALL
SELECT '4' AS sno, 'Minimum' AS statistic, TO_CHAR(min, 'FM999.00') AS value FROM flipper_length_stats
UNION ALL
SELECT '5' AS sno, 'Maximum' AS statistic, TO_CHAR(max, 'FM999.00') AS value FROM flipper_length_stats
UNION ALL
SELECT '6' AS sno, 'Range' AS statistic, TO_CHAR(range, 'FM99.00') AS value FROM flipper_length_stats
UNION ALL
SELECT '7' AS sno, 'Standard Deviation' AS statistic, TO_CHAR(stdev, 'FM99.00') AS value FROM flipper_length_stats
UNION ALL
SELECT '8' AS sno, 'Variance' AS statistic, TO_CHAR(var, 'FM999.00') AS value FROM flipper_length_stats
UNION ALL
SELECT '9' AS sno, 'Q1' AS statistic, TO_CHAR(q1, 'FM999.00') AS value FROM flipper_length_stats
UNION ALL
SELECT '10' AS sno, 'Q2' AS statistic, TO_CHAR(q2, 'FM999.00') AS value FROM flipper_length_stats
UNION ALL
SELECT '11' AS sno, 'IQR' AS statistic, TO_CHAR(iqr, 'FM99.00') AS value FROM flipper_length_stats
UNION ALL
SELECT '12' AS sno, 'Skewness' AS statistic, TO_CHAR(skew, 'FM999.00') AS value FROM flipper_length_stats;