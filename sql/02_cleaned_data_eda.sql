SELECT *
FROM StudentsDB.[dbo].[student_cleaned]

/*Checking fields in the data */
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'student_cleaned';

/*Checking duplicates*/
SELECT
	age, gender, academic_year, study_hours_per_day, exam_pressure,academic_performance, stress_level, anxiety_score,
	depression_score, sleep_hours, physical_activity, social_support, screen_time, internet_usage, financial_stress,
	family_expectation, burnout_score, mental_health_index, risk_level, dropout_risk,
	COUNT(*) AS frequency
FROM StudentsDB.[dbo].[student_cleaned]
GROUP BY age, gender, academic_year, study_hours_per_day, exam_pressure,academic_performance, stress_level, anxiety_score,
	depression_score, sleep_hours, physical_activity, social_support, screen_time, internet_usage, financial_stress,
	family_expectation, burnout_score, mental_health_index, risk_level, dropout_risk
Having COUNT (*) > 1;

/*Exploratory Data Analysis*/
/*Counting gender in the dataset*/
SELECT 
	gender,
	COUNT(*) AS gender_Count
FROM StudentsDB.[dbo].[student_cleaned]
GROUP BY gender

/*Students count by academic_year*/
SELECT 
	academic_year,
	COUNT(*) AS year_Count
FROM StudentsDB.[dbo].[student_cleaned]
GROUP BY academic_year
ORDER BY year_count DESC;

/* Median age for each gender */
SELECT DISTINCT gender, MediangenderAge
FROM (
    SELECT 
        gender,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY age) 
            OVER (PARTITION BY gender) AS MediangenderAge
	FROM StudentsDB.[dbo].[student_cleaned]
    WHERE gender IN ('Male', 'female', 'other')
) AS sub;

/*Mean performance*/
SELECT
	age,gender,academic_year,AVG(study_hours_per_day) AS Av_studyhrs,AVG(exam_pressure) AS Av_exampress,AVG(academic_performance) AS Av_performance,
	AVG(stress_level) AS Av_stress,AVG(anxiety_score) AS Av_anxiety,AVG(depression_score) AS Av_depression,AVG(sleep_hours) AS Av_sleep,
	AVG(physical_activity) AS Av_physical,AVG(social_support) AS Av_support,AVG(screen_time) AS Av_screen,
	AVG(internet_usage) AS Av_internet,AVG(financial_stress) AS Av_financial,AVG(family_expectation) AS Av_expectation,
	AVG(burnout_score) AS Av_burnout,AVG(mental_health_index) AS Av_mental,
	risk_level,AVG(dropout_risk) AS Av_dropout
FROM StudentsDB.[dbo].[student_cleaned]
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
FROM StudentsDB.[dbo].[student_cleaned]
GROUP BY academic_year
ORDER BY academic_year;
