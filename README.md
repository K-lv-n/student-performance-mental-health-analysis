# Student Performance and Mental Health Analysis

A SQL Server and Power BI analytics project exploring patterns in student academic performance, mental-health indicators, burnout, study habits, and dropout risk.

![Power BI dashboard preview](images/dashboard_preview.png)

## Project overview

This project uses a student mental-health and burnout dataset (the supplied source file is named `student_mental_health_burnout_1M.csv`) to demonstrate a practical analytics workflow:

1. Inspect the source table and its columns.
2. Check row counts and missing values.
3. clean and convert fields to appropriate numeric/text data types.
4. Explore distributions and summary statistics using SQL.
5. Aggregate records by age, gender, academic year, and risk level.
6. Present selected indicators and comparisons in Power BI.

The analysis is exploratory. Associations shown in the dashboard should not be interpreted as proof that one factor causes another.

## Dashboard highlights

The supplied dashboard displays these headline values:

| Indicator | Displayed value |
|---|---:|
| Average performance | 71.39 |
| Average mental health | 5.76 |
| Average study hours | 5.78 |
| Average burnout | 3.94 |
| Average support | 4.45 |
| Performance KPI | 72.91 (goal: 73.60) |

Visuals include performance by academic year and age, study hours compared with performance and mental-health indicators, direct and indirect factor comparisons, and a dropout-risk breakdown by academic year.

These are values visible in the supplied dashboard screenshot; refresh the PBIX against the intended source data before treating them as current results.

## Repository structure

```text
.
├── README.md
├── data/
│   └── sample_student_mental_health.csv
├── docs/
│   └── methodology.md
├── images/
│   └── dashboard_preview.png
├── powerbi/
│   └── student_mental_health_dashboard.pbix
└── sql/
    ├── 01_initial_exploration_and_cleaning.sql
    ├── 02_cleaned_data_eda.sql
    └── 03_reduced_data_analysis.sql
```

## Tools and skills demonstrated

- **SQL Server / T-SQL:** data inspection, `COUNT`, `CASE`, `TRY_CAST`, `ALTER TABLE`, `GROUP BY`, aggregate functions, common table expressions, window functions, `PERCENTILE_CONT`, and `UNPIVOT`.
- **Data preparation:** missing-value checks, type conversion, text cleanup, duplicate checks, and aggregation.
- **Power BI:** KPI cards, slicers, clustered columns, line/area visuals, and donut chart.
- **Communication:** dashboard-based presentation of analytical indicators.

## Data and large-file note

The original CSV is approximately 198 MB, which exceeds GitHub's 100 MB per-file limit. This repository therefore includes a **5,000-row sample** for inspection and excludes the full source CSV.

To reproduce the full analysis:
1. Obtain the original dataset from its lawful source.
2. Import it into SQL Server.
3. Update the database/table references in the scripts if your names differ.
4. Run the SQL scripts in sequence, checking the table names created by each step.
5. Open the PBIX file and point its queries to your SQL Server instance.

If you have permission to redistribute the full CSV and need it versioned with the project, use Git LFS or link to an approved external data source rather than committing a 198 MB file directly.

## Running the SQL scripts

The scripts currently reference a SQL Server database named `StudentsDB` and tables such as `student_mental_health_burnout_1M` and `student_cleaned`. Create/import the source table first, then verify the database and table names before execution.

Recommended order:

1. `sql/01_initial_exploration_and_cleaning.sql`
2. `sql/02_cleaned_data_eda.sql`
3. `sql/03_reduced_data_analysis.sql`

**Reproducibility note:** the supplied scripts contain references to more than one reduced-table name. Confirm the actual table created in your SQL Server environment and align the names before running the reduced-data script. The scripts are preserved as supplied for transparency.

## Important interpretation and quality notes

- A missing-value count is not the same as a missing-value treatment. Document any imputation or row-removal decisions separately.
- A duplicate check identifies repeated records; it does not itself remove them.
- Aggregating by demographic and academic categories reduces the number of rows but also removes individual-level detail. Use the raw/cleaned table when individual-level analysis is required.
- Mental-health measures are sensitive. Avoid identifying individuals, and do not use exploratory scores as clinical diagnoses.
- The dashboard shows associations and descriptive comparisons; causal claims require an appropriate research design and statistical analysis.

## Suggested next improvements

- Add a data dictionary with definitions, units, and valid ranges for each field.
- Add validation queries for out-of-range values and failed numeric conversions.
- Document the dataset source, licence, and collection methodology.
- Add a separate statistical modelling stage if prediction is part of the project objective.
- Improve chart titles and legends so every plotted measure is clearly named.

## Author

**Data Analytics Portfolio Project**

SQL Server | Power BI | Data Cleaning | Exploratory Data Analysis | Data Visualization
