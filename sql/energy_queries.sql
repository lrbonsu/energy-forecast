
-- ============================================================
-- ENERGY DEMAND FORECASTING — SQL Queries
-- Database: data/energy.db
-- Tables: daily_demand, monthly_demand
-- ============================================================

-- 1. BUSINESS SUMMARY
SELECT
    COUNT(*)                            AS total_days,
    ROUND(SUM(demand_mwh), 1)          AS total_demand_mwh,
    ROUND(AVG(demand_mwh), 1)          AS avg_daily_demand,
    ROUND(MAX(demand_mwh), 1)          AS peak_demand
FROM daily_demand;

-- 2. YEAR OVER YEAR GROWTH
SELECT
    year,
    ROUND(SUM(demand_mwh), 1)          AS total_demand,
    ROUND(AVG(demand_mwh), 1)          AS avg_daily_demand,
    ROUND(SUM(demand_mwh) * 100.0 /
        SUM(SUM(demand_mwh)) OVER (), 1) AS pct_of_total
FROM daily_demand
GROUP BY year
ORDER BY year;

-- 3. DEMAND BY SEASON
SELECT
    season,
    ROUND(AVG(demand_mwh), 1)          AS avg_daily_demand,
    ROUND(AVG(temperature_f), 1)       AS avg_temperature
FROM daily_demand
GROUP BY season
ORDER BY avg_daily_demand DESC;

-- 4. 7-DAY ROLLING AVERAGE
SELECT
    date,
    demand_mwh,
    ROUND(AVG(demand_mwh) OVER (
        ORDER BY date
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ), 1)                               AS rolling_7day_avg
FROM daily_demand
ORDER BY date;

-- 5. PEAK DEMAND DAYS BY SEASON
WITH ranked AS (
    SELECT date, season, year,
           temperature_f, demand_mwh,
           RANK() OVER (
               PARTITION BY season
               ORDER BY demand_mwh DESC
           )                            AS rank_in_season
    FROM daily_demand
)
SELECT * FROM ranked
WHERE rank_in_season <= 5
ORDER BY season, rank_in_season;
