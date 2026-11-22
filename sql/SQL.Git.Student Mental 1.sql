SELECT *
FROM [dbo].[student_mental_health_burnout_1M]

/*Checking fields in the data */
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'student_mental_health_burnout_1M';

/*counting number of nulls in each column*/
SELECT
	SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) As null_count_age,
	SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) As null_count_gender,
	SUM(CASE WHEN academic_year IS NULL THEN 1 ELSE 0 END) As null_count_academic_year,
	SUM(CASE WHEN study_hours_per_day IS NULL THEN 1 ELSE 0 END) As null_count_study_hours_per_day,
	SUM(CASE WHEN exam_pressure IS NULL THEN 1 ELSE 0 END) As null_count_exam_pressure,
	SUM(CASE WHEN academic_performance IS NULL THEN 1 ELSE 0 END) As null_count_acaddemic_performance,
	SUM(CASE WHEN stress_level IS NULL THEN 1 ELSE 0 END) As null_count_stress_level,
	SUM(CASE WHEN anxiety_score IS NULL THEN 1 ELSE 0 END) As null_count_anxiety_score,
	SUM(CASE WHEN depression_score IS NULL THEN 1 ELSE 0 END) As null_count_depression_score,
	SUM(CASE WHEN sleep_hours IS NULL THEN 1 ELSE 0 END) As null_count_sleep_hours,
	SUM(CASE WHEN physical_activity IS NULL THEN 1 ELSE 0 END) As null_count_physical_activity,
	SUM(CASE WHEN social_support IS NULL THEN 1 ELSE 0 END) As null_count_social_support,
	SUM(CASE WHEN screen_time IS NULL THEN 1 ELSE 0 END) As null_count_screen_time,
	SUM(CASE WHEN internet_usage IS NULL THEN 1 ELSE 0 END) As null_countinternet_usage,
	SUM(CASE WHEN financial_stress IS NULL THEN 1 ELSE 0 END) As null_count_financial_stress,
	SUM(CASE WHEN family_expectation IS NULL THEN 1 ELSE 0 END) As null_count_family_expectation,
	SUM(CASE WHEN burnout_score IS NULL THEN 1 ELSE 0 END) As null_count_burnout_score,
	SUM(CASE WHEN mental_health_index IS NULL THEN 1 ELSE 0 END) As null_count_mental_health_index,
	SUM(CASE WHEN risk_level IS NULL THEN 1 ELSE 0 END) As null_count_risk_level,
	SUM(CASE WHEN dropout_risk IS NULL THEN 1 ELSE 0 END) As null_count_dropout_risk
FROM StudentsDB.[dbo].[student_mental_health_burnout_1M];

/* Checking columns that might have values in quotes */
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'student_mental_health_burnout_1M'
AND DATA_TYPE IN ('varchar', 'nvarchar', 'char', 'text');

/*Checking all values in quotes from the displayed 'varchar', 'nvarchar', 'char', 'text' columns viewed above*/
SELECT
    gender,academic_year,study_hours_per_day,stress_level,anxiety_score,depression_score,physical_activity,social_support,screen_time,
	internet_usage,burnout_score,risk_level,dropout_risk
FROM student_mental_health_burnout_1M
WHERE gender LIKE '%"%'
   OR academic_year LIKE '%"%'
   OR study_hours_per_day LIKE '%"%'
   OR stress_level LIKE '%"%'
   OR anxiety_score LIKE '%"%'
   OR depression_score LIKE '%"%'
   OR physical_activity LIKE '%"%'
   OR social_support LIKE '%"%'
   OR screen_time LIKE '%"%'
   OR internet_usage LIKE '%"%'
   OR burnout_score LIKE '%"%'
   OR risk_level LIKE '%"%'
   OR dropout_risk LIKE '%"%';

/*Converting varchar data type columns to integer and 4 decimals data type*/
SELECT 
    CAST(TRY_CAST(age AS FLOAT) AS INT) AS age,
	CAST(TRY_CAST(academic_year AS FLOAT) AS INT) AS academic_year,
    CAST(TRY_CAST(study_hours_per_day AS FLOAT) AS DECIMAL(10,4)) AS study_hours_per_day,
	CAST(TRY_CAST(exam_pressure AS FLOAT) AS DECIMAL(10,4)) AS exam_pressure,
	CAST(TRY_CAST(academic_performance AS FLOAT) AS DECIMAL(10,4)) AS academic_performance,
	CAST(TRY_CAST(stress_level AS FLOAT) AS DECIMAL(10,4)) AS stress_level,
	CAST(TRY_CAST(anxiety_score AS FLOAT) AS DECIMAL(10,4)) AS anxiety_score,
	CAST(TRY_CAST(depression_score AS FLOAT) AS DECIMAL(10,4)) AS depression_score,
	CAST(TRY_CAST(sleep_hours AS FLOAT) AS DECIMAL(10,4)) AS sleep_hours,
	CAST(TRY_CAST(physical_activity AS FLOAT) AS DECIMAL(10,4)) AS physical_activity,
	CAST(TRY_CAST(social_support AS FLOAT) AS DECIMAL(10,4)) AS social_support,
	CAST(TRY_CAST(screen_time AS FLOAT) AS DECIMAL(10,4)) AS screen_time,
	CAST(TRY_CAST(internet_usage AS FLOAT) AS DECIMAL(10,4)) AS internet_usage,
	CAST(TRY_CAST(financial_stress AS FLOAT) AS DECIMAL(10,4)) AS financial_stress,
	CAST(TRY_CAST(family_expectation AS FLOAT) AS DECIMAL(10,4)) AS family_expectation,
	CAST(TRY_CAST(burnout_score AS FLOAT) AS DECIMAL(10,4)) AS burnout_score,
	CAST(TRY_CAST(mental_health_index AS FLOAT) AS DECIMAL(10,4)) AS mental_health_index,
	CAST(TRY_CAST(dropout_risk AS FLOAT) AS DECIMAL(10,4)) AS dropout_risk
FROM [dbo].[student_mental_health_burnout_1M];

/*Converting the vachar to int and 4 decimals and creating a new cleaned table for calculations*/
SELECT 
    CAST(TRY_CAST(age AS FLOAT) AS INT) AS age,
	CAST(TRY_CAST(academic_year AS FLOAT) AS INT) AS academic_year,
    CAST(TRY_CAST(study_hours_per_day AS FLOAT) AS DECIMAL(10,4)) AS study_hours_per_day,
	CAST(TRY_CAST(exam_pressure AS FLOAT) AS DECIMAL(10,4)) AS exam_pressure,
	CAST(TRY_CAST(academic_performance AS FLOAT) AS DECIMAL(10,4)) AS academic_performance,
	CAST(TRY_CAST(stress_level AS FLOAT) AS DECIMAL(10,4)) AS stress_level,
	CAST(TRY_CAST(anxiety_score AS FLOAT) AS DECIMAL(10,4)) AS anxiety_score,
	CAST(TRY_CAST(depression_score AS FLOAT) AS DECIMAL(10,4)) AS depression_score,
	CAST(TRY_CAST(sleep_hours AS FLOAT) AS DECIMAL(10,4)) AS sleep_hours,
	CAST(TRY_CAST(physical_activity AS FLOAT) AS DECIMAL(10,4)) AS physical_activity,
	CAST(TRY_CAST(social_support AS FLOAT) AS DECIMAL(10,4)) AS social_support,
	CAST(TRY_CAST(screen_time AS FLOAT) AS DECIMAL(10,4)) AS screen_time,
	CAST(TRY_CAST(internet_usage AS FLOAT) AS DECIMAL(10,4)) AS internet_usage,
	CAST(TRY_CAST(financial_stress AS FLOAT) AS DECIMAL(10,4)) AS financial_stress,
	CAST(TRY_CAST(family_expectation AS FLOAT) AS DECIMAL(10,4)) AS family_expectation,
	CAST(TRY_CAST(burnout_score AS FLOAT) AS DECIMAL(10,4)) AS burnout_score,
	CAST(TRY_CAST(mental_health_index AS FLOAT) AS DECIMAL(10,4)) AS mental_health_index,
	CAST(TRY_CAST(dropout_risk AS FLOAT) AS DECIMAL(10,4)) AS dropout_risk
INTO [Git].[dbo].[Git.Student Mental Cleaned 2]
FROM [Git].[dbo].[student_mental_health_burnout_1M];