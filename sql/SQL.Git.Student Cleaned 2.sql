SELECT *
FROM [dbo].[Git.Student Mental Cleaned 2]

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Git.Student Mental Cleaned 2';

/*Exploratory Data Analysis*/
/*Counting gender in the dataset*/
SELECT 
	gender,
	COUNT(*) AS gender_Count
FROM [dbo].[Git.Student Mental Cleaned 2]
GROUP BY gender

/*Students count by academic_year*/
SELECT 
	academic_year,
	COUNT(*) AS year_Count
FROM [dbo].[Git.Student Mental Cleaned 2]
GROUP BY academic_year
ORDER BY year_count DESC;

/* Median age for each gender */
SELECT DISTINCT gender, MediangenderAge
FROM (
    SELECT 
        gender,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY age) 
            OVER (PARTITION BY gender) AS MediangenderAge
	FROM [dbo].[Git.Student Mental Cleaned 2]
    WHERE gender IN ('Male', 'female', 'other')
) AS sub;

/*Means for the varriables*/
SELECT
	age,gender,academic_year,AVG(study_hours_per_day) AS Av_studyhrs,AVG(exam_pressure) AS Av_exampress,AVG(academic_performance) AS Av_performance,
	AVG(stress_level) AS Av_stress,AVG(anxiety_score) AS Av_anxiety,AVG(depression_score) AS Av_depression,AVG(sleep_hours) AS Av_sleep,
	AVG(physical_activity) AS Av_physical,AVG(social_support) AS Av_support,AVG(screen_time) AS Av_screen,
	AVG(internet_usage) AS Av_internet,AVG(financial_stress) AS Av_financial,AVG(family_expectation) AS Av_expectation,
	AVG(burnout_score) AS Av_burnout,AVG(mental_health_index) AS Av_mental,
	risk_level,AVG(dropout_risk) AS Av_dropout
FROM [dbo].[Git.Student Mental Cleaned 2]
GROUP BY age,gender,academic_year,risk_level;

/*Range of Academic_performance*/
SELECT 
	MAX(academic_performance) AS Max_performance,
	MIN(academic_performance) AS Min_performance
FROM StudentsDB.[dbo].[student_cleaned]

/*Range of Academic_performance By Academic year*/
SELECT 
    academic_year,
    MAX(academic_performance) AS Max_performance,
    MIN(academic_performance) AS Min_performance
FROM [dbo].[Git.Student Mental Cleaned 2]
GROUP BY academic_year
ORDER BY academic_year;

/*Average, Minimum and Maximum of the varriables at once with mode*/
WITH Unpivoted AS (
    SELECT ColumnName, Value
    FROM
    (
        SELECT Study_hours_per_day,Exam_pressure,academic_performance,stress_level,Anxiety_score,Depression_score,
               Sleep_hours,physical_activity,social_support,Screen_time,Internet_usage,Financial_stress,Family_Expectation,
               Burnout_score,Mental_health_index,Dropout_risk
        FROM [dbo].[Git.Student Mental Cleaned 2]
    ) AS Source
    UNPIVOT
    (
        Value FOR ColumnName IN (Study_hours_per_day,Exam_pressure,academic_performance,stress_level,Anxiety_score,Depression_score,
               Sleep_hours,physical_activity,social_support,Screen_time,Internet_usage,Financial_stress,Family_Expectation,
               Burnout_score,Mental_health_index,Dropout_risk)
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