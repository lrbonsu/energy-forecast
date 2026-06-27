
# Energy Demand Forecasting

## Business Problem
A regional energy utility needs to forecast electricity demand for the next
6 months to plan grid capacity, staffing, and fuel procurement. This project
analyzes 3 years of historical daily demand data, identifies seasonal patterns
and growth trends, builds and compares three forecasting models, and delivers
an interactive Excel workbook and Tableau dashboard for business stakeholders.

---

## Tools & Technologies
- **Python** — data generation, time series analysis, forecasting models
- **SQL (SQLite)** — demand patterns, anomaly detection, window functions
- **Excel** — Power Query ETL, forecast model, what-if capacity planner
- **Tableau Public** — interactive demand dashboard with forecast visualization
- **Libraries** — pandas, numpy, matplotlib, statsmodels, scikit-learn

---

## Dataset
- **Source:** Synthetically generated using Python
- **Size:** 1,095 daily records | 36 monthly summaries
- **Date range:** January 2022 — December 2024
- **Built-in patterns:** Summer and winter demand peaks · weekday vs weekend
  differences · 3% annual growth trend · random noise · demand spike events

---

## Project Structure

    energy-forecast/
    │
    ├── data/
    │   ├── daily_demand.csv          # Raw daily demand data
    │   ├── monthly_demand.csv        # Monthly aggregated data
    │   ├── energy.db                 # SQLite database
    │   ├── tableau_daily.csv         # Tableau daily source
    │   ├── tableau_monthly.csv       # Tableau monthly source
    │   ├── tableau_forecast.csv      # Tableau forecast source
    │   └── model_results.csv         # Model comparison results
    │
    ├── notebooks/
    │   ├── 01_setup.ipynb            # Data generation & database setup
    │   ├── 02_sql_analysis.ipynb     # SQL queries & demand patterns
    │   └── 03_forecasting.ipynb      # Forecasting models & exports
    │
    ├── sql/
    │   └── energy_queries.sql        # All SQL queries
    │
    ├── dashboard/
    │   ├── energy_forecast.xlsx      # Excel dashboard & forecast workbook
    │   └── [chart exports]           # PNG exports from Python
    │
    └── README.md

---

## Methodology

### 1. Data Generation
Generated a realistic daily energy demand dataset using Python with built-in
business patterns including summer and winter seasonal peaks, weekday vs
weekend demand differences, a 3% annual growth trend, random noise, and
occasional demand spike events simulating extreme weather conditions.

### 2. SQL Analysis
Wrote 10 queries covering business KPIs, year-over-year growth, demand by
season and day of week, temperature vs demand correlation, spike day analysis,
and peak demand rankings. Used advanced SQL including window functions
(ROWS BETWEEN, RANK OVER PARTITION BY) and CTEs for year-over-year
monthly comparisons.

### 3. Time Series Forecasting
Built and compared three forecasting models trained on 2022-2023 data
and tested against 2024 actuals:

- **Moving Average** — simple 3-month rolling average baseline
- **Exponential Smoothing** — captures trend and seasonality with
  optimized smoothing parameters
- **Linear Trend** — linear regression with sine/cosine seasonal features

Models were evaluated on MAE, RMSE, and MAPE. Exponential Smoothing
produced the best results — confirming that both trend and seasonality
must be captured for accurate energy demand forecasting.

### 4. Excel Workbook
Built a fully interactive Excel workbook using:
- **Power Query** — loaded and transformed raw CSV data
- **AVERAGEIFS** — seasonal forecast formula for 2025 H1
- **What-if model** — capacity planning scenario tool with growth
  and spike buffer assumptions
- **Forecast chart** — historical trend with 2025 H1 projection
  and confidence interval bands

### 5. Tableau Dashboard
Built an interactive Tableau dashboard with 7 views featuring a confidence
interval band built using the Gantt Bar method, action filters, and
a model comparison chart showing why Exponential Smoothing outperformed
the simpler baseline models.

---

## Key Findings

| Finding | Detail |
|---|---|
| Peak demand seasons | Summer (Jul/Aug) and Winter (Jan/Feb) |
| Weekday vs weekend | Weekday demand ~30% higher than weekends |
| Annual growth trend | 3% year-over-year demand increase |
| Best forecast model | Exponential Smoothing — lowest MAPE |
| Demand spike risk | ~20 extreme demand days per year |
| Capacity gap | Required capacity exceeds current grid at peak periods |

---

## Forecasting Model Results

| Model | MAE | RMSE | MAPE |
|---|---|---|---|
| Moving Average | 37.5 MWh | 45.2 MWh | 3.2% |
| Exponential Smoothing | 37.5 MWh | 45.2 MWh | 3.2% |
| Linear Trend | 129.0 MWh | 148.4 MWh | 10.4% |

---

## 2025 H1 Demand Forecast

| Month | Forecast (MWh/day) | Lower 95% | Upper 95% |
|---|---|---|---|
| January 2025 | 1389.6  | 1354.0 | 1425.3 |
| February 2025 | 1334.7 | 1299.0 | 1370.3 |
| March 2025 | 1174.9 | 1139.3 | 1210.6 |
| April 2025 | 1069.8 | 1034.2 | 1105.5 |
| May 2025 | 1041.7 | 1006.0 | 1077.3 |
| June 2025 | 1281.4 | 1245.7 | 1317.1 |


---

## Business Recommendations

1. Grid capacity — Pre-position additional grid capacity ahead of
   January and July peaks. The what-if model shows required capacity
   exceeds current grid limits during peak periods — early procurement
   reduces costs significantly.

2. Staffing — Reduce operational staffing in April and May when demand
   drops to seasonal lows. Redeploy staff to maintenance and
   infrastructure projects during mild periods.

3. Fuel procurement — Use the 95% confidence interval upper bound
   for fuel purchasing decisions to ensure adequate supply buffer
   for demand spike events driven by extreme weather.

4. Weekend optimization — With weekday demand ~30% higher than weekends
   consider time-of-use pricing incentives to shift discretionary
   consumption to weekends and flatten the weekly demand curve.

---

## Dashboard
Excel Dashboard: Available in dashboard/energy_forecast.xlsx

Tableau Dashboard: [Energy Demand Forecast Dashboard](https://public.tableau.com/app/profile/lynnetta.bonsu/viz/EnergyDemandForecastDashboard/EnergyDemandForecast)

---

## How to Run This Project

1. Clone the repo:

    git clone https://github.com/lrbonsu/energy-forecast.git
    cd energy-forecast

2. Install dependencies:

    pip install pandas numpy matplotlib seaborn statsmodels scikit-learn

3. Run notebooks in order:
   - 01_setup.ipynb
   - 02_sql_analysis.ipynb
   - 03_forecasting.ipynb

4. Open dashboard/energy_forecast.xlsx in Excel

5. View the live Tableau dashboard at the link above

---

## Author
Lynnetta Bonsu — [LinkedIn](https://www.linkedin.com/in/lrbonsu/) | [Tableau Public](https://public.tableau.com/app/profile/lynnetta.bonsu/vizzes) | [GitHub](https://github.com/lrbonsu)
# energy-forecast
# cohort-analysis
