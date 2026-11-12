# Project methodology

## 1. Data inspection
The initial SQL script inspects the source table, counts records, lists fields, and counts nulls across the principal variables.

## 2. Data cleaning and preparation
The supplied SQL work removes embedded single-quote characters from text values and converts numeric-looking fields into numeric SQL types. `TRY_CAST` is used in conversion queries to avoid conversion failures stopping exploratory queries. Review failed conversions and nulls after conversion before treating the table as analysis-ready.

## 3. Data quality checks
The cleaned-data script checks for repeated full-row combinations. This is a diagnostic query; it does not delete duplicates. The scripts also calculate counts by gender and academic year and median age by gender.

## 4. Exploratory analysis
The scripts calculate averages, minima, maxima, variance, standard deviation, and mode for selected measures. They compare academic performance, study hours, stress, anxiety, financial stress, mental-health index, burnout, and dropout-risk indicators across selected groups.

## 5. Aggregation
The initial script groups records by age, gender, academic year, and risk level, calculating group averages. Aggregation is useful for summary visuals and performance, but it changes the unit of analysis from individual student records to group-level records.

## 6. Power BI communication
The supplied dashboard includes KPI cards and charts with slicers for academic year, gender, and risk level. The screenshot is included as a static preview; the PBIX is provided for interactive inspection.

## Limitations
- Dataset provenance, licence, sampling method, and variable definitions should be documented from the original data source.
- The SQL scripts do not document a complete missing-data treatment.
- Descriptive associations do not establish causation.
- Dashboard values should be refreshed and validated against the final SQL tables before publication.
