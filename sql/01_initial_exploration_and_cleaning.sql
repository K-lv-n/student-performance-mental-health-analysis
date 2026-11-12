SELECT *
FROM StudentsDB.[dbo].[student_mental_health_burnout_1M]

/*Checking Number of rows in the data*/
SELECT COUNT (*) AS total_rows
FROM StudentsDB.[dbo].[student_mental_health_burnout_1M];

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

/*Removing single quotes from vachar and converting into 4 decimal points*/
SELECT 
    CAST(REPLACE(burnout_score, '''', '') AS DECIMAL(10,4)) AS burnoutcleaned_value
FROM StudentsDB.[dbo].[student_mental_health_burnout_1M];

/*Removing single quotes from vachar and converting into 2 decimal points*/
SELECT 
    CAST(REPLACE(burnout_score, '''', '') AS DECIMAL(10,2)) AS burnoutcleaned_value
FROM StudentsDB.[dbo].[student_mental_health_burnout_1M];

/*Converting varchar data type columns to 2 decimals data type*/
SELECT 
    CAST(TRY_CAST(age AS FLOAT) AS INT) AS age,
    CAST(TRY_CAST(study_hours_per_day AS FLOAT) AS DECIMAL(10,2)) AS study_hours_per_day,
	CAST(TRY_CAST(exam_pressure AS FLOAT) AS DECIMAL(10,2)) AS exam_pressure,
	CAST(TRY_CAST(academic_performance AS FLOAT) AS DECIMAL(10,2)) AS academic_performance,
	CAST(TRY_CAST(stress_level AS FLOAT) AS DECIMAL(10,2)) AS stress_level,
	CAST(TRY_CAST(anxiety_score AS FLOAT) AS DECIMAL(10,2)) AS anxiety_score,
	CAST(TRY_CAST(depression_score AS FLOAT) AS DECIMAL(10,2)) AS depression_score,
	CAST(TRY_CAST(sleep_hours AS FLOAT) AS DECIMAL(10,2)) AS sleep_hours,
	CAST(TRY_CAST(physical_activity AS FLOAT) AS DECIMAL(10,2)) AS physical_activity,
	CAST(TRY_CAST(social_support AS FLOAT) AS DECIMAL(10,2)) AS social_support,
	CAST(TRY_CAST(screen_time AS FLOAT) AS DECIMAL(10,2)) AS screen_time,
	CAST(TRY_CAST(internet_usage AS FLOAT) AS DECIMAL(10,2)) AS internet_usage,
	CAST(TRY_CAST(financial_stress AS FLOAT) AS DECIMAL(10,2)) AS financial_stress,
	CAST(TRY_CAST(family_expectation AS FLOAT) AS DECIMAL(10,2)) AS family_expectation,
	CAST(TRY_CAST(burnout_score AS FLOAT) AS DECIMAL(10,2)) AS burnout_score,
	CAST(TRY_CAST(mental_health_index AS FLOAT) AS DECIMAL(10,2)) AS mental_health_index,
	CAST(TRY_CAST(dropout_risk AS FLOAT) AS DECIMAL(10,2)) AS dropout_risk
FROM StudentsDB.[dbo].[student_mental_health_burnout_1M];

/*Cleaning data from varchar into float first then integer and creating a new table that saves the cleaned data*/
SELECT 
    CAST(TRY_CAST(age AS FLOAT) AS INT) AS age,
    gender,
    academic_year,
    CAST(TRY_CAST(study_hours_per_day AS FLOAT) AS DECIMAL(10,2)) AS study_hours_per_day,
	CAST(TRY_CAST(exam_pressure AS FLOAT) AS DECIMAL(10,2)) AS exam_pressure,
	CAST(TRY_CAST(academic_performance AS FLOAT) AS DECIMAL(10,2)) AS academic_performance,
	CAST(TRY_CAST(stress_level AS FLOAT) AS DECIMAL(10,2)) AS stress_level,
	CAST(TRY_CAST(anxiety_score AS FLOAT) AS DECIMAL(10,2)) AS anxiety_score,
	CAST(TRY_CAST(depression_score AS FLOAT) AS DECIMAL(10,2)) AS depression_score,
	CAST(TRY_CAST(sleep_hours AS FLOAT) AS DECIMAL(10,2)) AS sleep_hours,
	CAST(TRY_CAST(physical_activity AS FLOAT) AS DECIMAL(10,2)) AS physical_activity,
	CAST(TRY_CAST(social_support AS FLOAT) AS DECIMAL(10,2)) AS social_support,
	CAST(TRY_CAST(screen_time AS FLOAT) AS DECIMAL(10,2)) AS screen_time,
	CAST(TRY_CAST(internet_usage AS FLOAT) AS DECIMAL(10,2)) AS internet_usage,
	CAST(TRY_CAST(financial_stress AS FLOAT) AS DECIMAL(10,2)) AS financial_stress,
	CAST(TRY_CAST(family_expectation AS FLOAT) AS DECIMAL(10,2)) AS family_expectation,
	CAST(TRY_CAST(burnout_score AS FLOAT) AS DECIMAL(10,2)) AS burnout_score,
	CAST(TRY_CAST(mental_health_index AS FLOAT) AS DECIMAL(10,2)) AS mental_health_index,
	risk_level,
	CAST(TRY_CAST(dropout_risk AS FLOAT) AS DECIMAL(10,2)) AS dropout_risk
INTO StudentsDB.[dbo].[student_cleaned]
FROM StudentsDB.[dbo].[student_mental_health_burnout_1M];


/*Removing Single quotes from values*/
SELECT 
	REPLACE(age,'''','') AS age_cleaned,
	REPLACE(gender,'''','') AS gender_cleaned,
	REPLACE(academic_year,'''','') AS academic_year_cleaned,
	REPLACE(study_hours_per_day, '''','') AS study_hours_cleaned,
	REPLACE(exam_pressure, '''','') AS exam_pressure_cleaned,
	REPLACE(academic_performance, '''','') AS academic_performance_cleaned,
	REPLACE(stress_level, '''','') AS stress_level_cleaned,
	REPLACE(anxiety_score, '''','') AS anxiety_score_cleaned,
	REPLACE(depression_score, '''','') AS depression_score_cleaned,
	REPLACE(sleep_hours, '''','') AS sleep_hours_cleaned,
	REPLACE(physical_activity, '''','') AS physical_activity_cleaned,
	REPLACE(social_support, '''','') AS social_support_cleaned,
	REPLACE(screen_time, '''','') AS screen_time_cleaned,
	REPLACE(internet_usage, '''','') AS internet_usage_cleaned,
	REPLACE(financial_stress, '''','') AS financial_stress_cleaned,
	REPLACE(family_expectation, '''','') AS family_expectation_cleaned,
	REPLACE(burnout_score, '''','') AS burnout_cleaned,
	REPLACE(mental_health_index, '''','') AS mental_health_cleaned,
	REPLACE(risk_level, '''','') AS risk_level_cleaned,
	REPLACE(dropout_risk, '''','') AS dropout_risk_cleaned
FROM StudentsDB.[dbo].[student_mental_health_burnout_1M];

/*updating the removed single quotes from the data*/
UPDATE StudentsDB.[dbo].[student_mental_health_burnout_1M]
SET 
    age = REPLACE(age, '''', ''),
    gender = REPLACE(gender, '''', ''),
    academic_year = REPLACE(academic_year, '''', ''),
    study_hours_per_day = REPLACE(study_hours_per_day, '''', ''),
    exam_pressure = REPLACE(exam_pressure, '''', ''),
    academic_performance = REPLACE(academic_performance, '''', ''),
    stress_level = REPLACE(stress_level, '''', ''),
    anxiety_score = REPLACE(anxiety_score, '''', ''),
    depression_score = REPLACE(depression_score, '''', ''),
    sleep_hours = REPLACE(sleep_hours, '''', ''),
    physical_activity = REPLACE(physical_activity, '''', ''),
    social_support = REPLACE(social_support, '''', ''),
    screen_time = REPLACE(screen_time, '''', ''),
    internet_usage = REPLACE(internet_usage, '''', ''),
    financial_stress = REPLACE(financial_stress, '''', ''),
    family_expectation = REPLACE(family_expectation, '''', ''),
    burnout_score = REPLACE(burnout_score, '''', ''),
    mental_health_index = REPLACE(mental_health_index, '''', ''),
    risk_level = REPLACE(risk_level, '''', ''),
    dropout_risk = REPLACE(dropout_risk, '''', '');

/*Changing permanently column data types into vachar and float to avoid errors in calculations*/
ALTER TABLE StudentsDB.[dbo].[student_mental_health_burnout_1M]
ALTER COLUMN age INT;

ALTER TABLE StudentsDB.[dbo].[student_mental_health_burnout_1M]
ALTER COLUMN gender VARCHAR(50);

ALTER TABLE StudentsDB.[dbo].[student_mental_health_burnout_1M]
ALTER COLUMN academic_year INT;

ALTER TABLE StudentsDB.[dbo].[student_mental_health_burnout_1M]
ALTER COLUMN study_hours_per_day FLOAT;

ALTER TABLE StudentsDB.[dbo].[student_mental_health_burnout_1M]
ALTER COLUMN exam_pressure FLOAT;

ALTER TABLE StudentsDB.[dbo].[student_mental_health_burnout_1M]
ALTER COLUMN academic_performance FLOAT;

ALTER TABLE StudentsDB.[dbo].[student_mental_health_burnout_1M]
ALTER COLUMN stress_level FLOAT;

ALTER TABLE StudentsDB.[dbo].[student_mental_health_burnout_1M]
ALTER COLUMN anxiety_score FLOAT;

ALTER TABLE StudentsDB.[dbo].[student_mental_health_burnout_1M]
ALTER COLUMN depression_score FLOAT;

ALTER TABLE StudentsDB.[dbo].[student_mental_health_burnout_1M]
ALTER COLUMN sleep_hours FLOAT;

ALTER TABLE StudentsDB.[dbo].[student_mental_health_burnout_1M]
ALTER COLUMN physical_activity FLOAT;

ALTER TABLE StudentsDB.[dbo].[student_mental_health_burnout_1M]
ALTER COLUMN social_support FLOAT;

ALTER TABLE StudentsDB.[dbo].[student_mental_health_burnout_1M]
ALTER COLUMN screen_time FLOAT;

ALTER TABLE StudentsDB.[dbo].[student_mental_health_burnout_1M]
ALTER COLUMN internet_usage FLOAT;

ALTER TABLE StudentsDB.[dbo].[student_mental_health_burnout_1M]
ALTER COLUMN financial_stress FLOAT;

ALTER TABLE StudentsDB.[dbo].[student_mental_health_burnout_1M]
ALTER COLUMN family_expectation FLOAT;

ALTER TABLE StudentsDB.[dbo].[student_mental_health_burnout_1M]
ALTER COLUMN burnout_score FLOAT;

ALTER TABLE StudentsDB.[dbo].[student_mental_health_burnout_1M]
ALTER COLUMN mental_health_index FLOAT;

ALTER TABLE StudentsDB.[dbo].[student_mental_health_burnout_1M]
ALTER COLUMN risk_level VARCHAR(50);

ALTER TABLE StudentsDB.[dbo].[student_mental_health_burnout_1M]
ALTER COLUMN dropout_risk FLOAT;


/*Counting No of distinct ages, performances...etc*/
SELECT
	age,
	COUNT(*) AS total_count
FROM StudentsDB.[dbo].[student_mental_health_burnout_1M]
GROUP BY age
ORDER BY age;

/*Selecting repeated values and the Number of times they appear*/
SELECT
	academic_performance,
	COUNT(*) AS frequency
FROM StudentsDB.[dbo].[student_mental_health_burnout_1M]
GROUP BY academic_performance
Having COUNT (*) > 1;


/*Counting males in the data*/
SELECT COUNT(*) AS MaleCount
FROM StudentsDB.[dbo].[student_mental_health_burnout_1M]
WHERE gender = 'Male';

/*Counting No of males by the age-groups in the data*/
SELECT age,gender, COUNT(*) AS GenderCount
FROM StudentsDB.[dbo].[student_mental_health_burnout_1M]
WHERE gender IN ('male','female','other')
GROUP BY age,gender
ORDER BY age;

/* Maximum gender count by age group */
SELECT TOP 3 age, gender, COUNT(*) AS GenderCount
FROM StudentsDB.dbo.student_mental_health_burnout_1M
WHERE gender IN ('Male','Female','Other')
GROUP BY age, gender
ORDER BY GenderCount DESC;/*use DESC FOR DESCENDING AND ASC FOR ASCENDING to determine top and bottom values*/

/* Minimum count per gender */
WITH Counts AS (
    SELECT age, gender, COUNT(*) AS GenderCount
    FROM StudentsDB.dbo.student_mental_health_burnout_1M
    WHERE gender IN ('Male','Female','Other')
    GROUP BY age, gender
)
SELECT gender, age, GenderCount
FROM Counts
WHERE (gender = 'Male'   AND GenderCount = (SELECT MIN(GenderCount) FROM Counts WHERE gender = 'Male'))
   OR (gender = 'Female' AND GenderCount = (SELECT MIN(GenderCount) FROM Counts WHERE gender = 'Female'))
   OR (gender = 'Other'  AND GenderCount = (SELECT MIN(GenderCount) FROM Counts WHERE gender = 'Other'));

/*Selecting unique entries in a column*/
SELECT DISTINCT gender
FROM StudentsDB.[dbo].[student_mental_health_burnout_1M]

/*Exploring data*/
/*Median age for males*/
SELECT DISTINCT MedianMaleAge
FROM (
    SELECT 
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY age) 
        OVER () AS MedianMaleAge
    FROM StudentsDB.dbo.student_mental_health_burnout_1M
    WHERE gender = 'Male'
) AS sub;


/*Median age by academic year for males*/
SELECT DISTINCT MedianMaleAge
FROM(
	SELECT
    academic_year,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY age) 
        OVER (PARTITION BY academic_year) AS MedianMaleAge
FROM StudentsDB.[dbo].[student_mental_health_burnout_1M]
WHERE gender = 'Male'
GROUP BY academic_year
) AS sub;/*Check when you get back */


/*Maximum,Variance & STandard deviation*/
SELECT
	MAX(burnout_score) AS max_burnout,
	VAR(dropout_risk) AS var_dropout,
	STDEV(mental_health_index)
FROM StudentsDB.[dbo].[student_mental_health_burnout_1M]

/*Grouping by age,gender,academic year & risk level to reduce 1M rows to 468 rows*/
SELECT
	age,gender,academic_year,AVG(study_hours_per_day) AS Av_studyhrs,AVG(exam_pressure) AS Av_exampress,AVG(academic_performance) AS Av_performance,
	AVG(stress_level) AS Av_stress,AVG(anxiety_score) AS Av_anxiety,AVG(depression_score) AS Av_depression,AVG(sleep_hours) AS Av_sleep,
	AVG(physical_activity) AS Av_physical,AVG(social_support) AS Av_support,AVG(screen_time) AS Av_screen,
	AVG(internet_usage) AS Av_internet,AVG(financial_stress) AS Av_financial,AVG(family_expectation) AS Av_expectation,
	AVG(burnout_score) AS Av_burnout,AVG(mental_health_index) AS Av_mental,
	risk_level,AVG(dropout_risk) AS Av_dropout
INTO Students_mentalhealth_reduced
FROM StudentsDB.[dbo].[student_mental_health_burnout_1M]
GROUP BY age,gender,academic_year,risk_level;

/*moving a table from one database to another*/
SELECT *
INTO [StudentsDB].[dbo].[Students_mentalhealth_reduced]
FROM [dbo].[Students_mentalhealth_reduced];

/*Exploratory Data Analysis*/
SELECT
	AVG(Age)AS AVG_age,
	AVG(study_hours_per_day)AS AVG_study_hours,
	AVG(exam_pressure) AS AVG_exam_pressure,
	AVG(academic_performance)AS AVG_academic_performance,
	AVG(stress_level)AS AVG_stress_level,
	AVG(anxiety_score)AS AVG_anxiety_score,
	AVG(depression_score)AS AVG_depression_score,
	AVG(sleep_hours)AS AVG_sleep_hours,
	AVG(physical_activity) AS AVG_physical_activity,
	AVG(social_support)AS AVG_social_support,
	AVG(screen_time)AS AVG_screen_time,
	AVG(internet_usage)AS AVG_internet_usage,
	AVG(financial_stress)AS AVG_financial_stress,
	AVG(family_expectation)AS AVG_family_expectation,
	AVG(burnout_score)AS AVG_burnout_score,
	AVG(mental_health_index)AS AVG_mental_health_index,
	AVG(dropout_risk)AS AVG_dropout_risk
FROM StudentsDB.[dbo].[student_mental_health_burnout_1M];

SELECT
	age,
	AVG(family_expectation) AS AVGfam_expect
FROM StudentsDB.[dbo].[student_mental_health_burnout_1M]
GROUP BY age
ORDER BY age;

SELECT
	gender,
	AVG(academic_performance) AS AVGacademics
FROM StudentsDB.[dbo].[student_mental_health_burnout_1M]
GROUP BY gender
ORDER BY gender;

SELECT
	academic_year,
	AVG(study_hours_per_day) AS AVGstudyhrs,
	AVG(stress_level) AS AVGstress,
	AVG(anxiety_score) AS AVGanxiety,
	AVG(financial_stress) AS AVGfinances,
	AVG(mental_health_index) AS AVGmental,
	AVG(dropout_risk) AS AVGdropout
FROM StudentsDB.[dbo].[student_mental_health_burnout_1M]
GROUP BY academic_year
ORDER BY academic_year;

SELECT
	risk_level,
	COUNT(*) AS total_students,
	AVG(burnout_score) AS AVGburnout
FROM StudentsDB.[dbo].[student_mental_health_burnout_1M]
GROUP BY risk_level;	

/*Average, Minimum and Maximum of the varriables at once with mode*/
WITH Unpivoted AS (
    SELECT ColumnName, Value
    FROM
    (
        SELECT study_hours_per_day,exam_pressure,academic_performance,stress_level,anxiety_score,depression_score,sleep_hours,
		physical_activity,social_support,screen_time,internet_usage,financial_stress,family_expectation,burnout_score,
		mental_health_index,dropout_risk
        FROM StudentsDB.[dbo].[student_mental_health_burnout_1M]
    ) AS Source
    UNPIVOT
    (
        Value FOR ColumnName IN (study_hours_per_day,exam_pressure,academic_performance,stress_level,anxiety_score,depression_score,sleep_hours,
		physical_activity,social_support,screen_time,internet_usage,financial_stress,family_expectation,burnout_score,
		mental_health_index,dropout_risk)
    ) AS U
),
Stats AS (
    SELECT ColumnName,
           AVG(Value) AS Average,
           MIN(Value) AS Minimum,
           MAX(Value) AS Maximum,
           VAR(Value) AS Variance,
           STDEV(Value) AS STDeviation
    FROM Unpivoted
    GROUP BY ColumnName
),
ModeCalc AS (
    SELECT ColumnName, Value AS ModeValue
    FROM (
        SELECT ColumnName, Value,
               ROW_NUMBER() OVER (PARTITION BY ColumnName ORDER BY COUNT(*) DESC) AS rn
        FROM Unpivoted
        GROUP BY ColumnName, Value
    ) AS Ranked
    WHERE rn = 1
)
SELECT s.ColumnName,
       s.Average,
       s.Minimum,
       s.Maximum,
       s.Variance,
       s.STDeviation,
       m.ModeValue AS Mode
FROM Stats s
LEFT JOIN ModeCalc m
    ON s.ColumnName = m.ColumnName;
