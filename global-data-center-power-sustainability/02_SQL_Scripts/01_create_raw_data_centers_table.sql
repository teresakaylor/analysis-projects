DROP TABLE IF EXISTS data_centers;

CREATE TABLE IF NOT EXISTS data_centers (
    -- Identifying/Categorical Columns
    country                                 VARCHAR(100),

    -- Count Metrics (Use INTEGER for whole numbers)
    total_data_centers                      INTEGER,
    hyperscale_data_centers                 INTEGER,
    colocation_data_centers                 INTEGER,

    -- Capacity and Continuous Metrics (Use NUMERIC for potential decimal values)
    floor_space_sqft_total                  NUMERIC,
    power_capacity_MW_total                 NUMERIC,
    average_renewable_energy_usage			NUMERIC,
    internet_penetration            		NUMERIC,
    yearly_growth_rate						NUMERIC,
    highest_tier							INTEGER,
    disaster_recovery_sites			        INTEGER
    
);