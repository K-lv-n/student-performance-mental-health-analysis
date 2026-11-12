SELECT *
FROM [StudentsDB].[dbo].[students_reduced]

/*Renaming Columns*/
EXEC sp_rename '[StudentsDB].[dbo].[students_reduced].Av_studyhrs', 'Studyhrs', 'COLUMN';
EXEC sp_rename	'[StudentsDB].[dbo].[students_reduced].Av_exampress', 'Exampress', 'COLUMN';
EXEC sp_rename 	'[StudentsDB].[dbo].[students_reduced].Av_performance', 'Performance', 'COLUMN';
EXEC sp_rename 	'[StudentsDB].[dbo].[students_reduced].Av_stress', 'Stress', 'COLUMN';
EXEC sp_rename 	'[StudentsDB].[dbo].[students_reduced].Av_anxiety', 'Anxiety', 'COLUMN';
EXEC sp_rename 	'[StudentsDB].[dbo].[students_reduced].Av_depression', 'Depression', 'COLUMN';
EXEC sp_rename 	'[StudentsDB].[dbo].[students_reduced].Av_sleep', 'Sleep', 'COLUMN';
EXEC sp_rename 	'[StudentsDB].[dbo].[students_reduced].Av_physical', 'Physical', 'COLUMN';
EXEC sp_rename 	'[StudentsDB].[dbo].[students_reduced].Av_support', 'support', 'COLUMN';
EXEC sp_rename 	'[StudentsDB].[dbo].[students_reduced].Av_screen', 'Screen', 'COLUMN';
EXEC sp_rename 	'[StudentsDB].[dbo].[students_reduced].Av_internet', 'Internet', 'COLUMN';
EXEC sp_rename 	'[StudentsDB].[dbo].[students_reduced].Av_financial', 'Financial', 'COLUMN';
EXEC sp_rename 	'[StudentsDB].[dbo].[students_reduced].Av_expectation', 'Expectation', 'COLUMN';
EXEC sp_rename 	'[StudentsDB].[dbo].[students_reduced].Av_burnout', 'Burnout', 'COLUMN';
EXEC sp_rename 	'[StudentsDB].[dbo].[students_reduced].Av_mental', 'Mental', 'COLUMN';
EXEC sp_rename 	'[StudentsDB].[dbo].[students_reduced].Av_dropout', 'Dropout', 'COLUMN';

/*Counting No of distinct ages, performances...etc*/
SELECT
	age,
	COUNT(*) AS total_count
FROM [StudentsDB].[dbo].[students_reduced]
GROUP BY age
ORDER BY age;

/*Range of Academic_performance By Academic year*/
SELECT 
    academic_year,
    MAX(performance) AS Max_performance,
    MIN(performance) AS Min_performance
FROM StudentsDB.[dbo].[students_reduced]
GROUP BY academic_year
ORDER BY academic_year;

/*Average, Minimum and Maximum of the varriables at once*/
SELECT ColumnName,
       AVG(Value) AS Average,
       MIN(Value) AS Minimum,
       MAX(Value) AS Maximum,
	   VAR(Value) AS Variance,
	   STDEV(Value) AS STDeviation
FROM
(
    SELECT Studyhrs,Exampress,Performance,Stress,Anxiety,Depression,
	Sleep,Physical,support,Screen,Internet,Financial,Expectation,Burnout,Mental,Dropout
    FROM StudentsDB.[dbo].[students_reduced]
) AS Source
UNPIVOT
(
    Value FOR ColumnName IN (Studyhrs,Exampress,Performance,Stress,Anxiety,Depression,
	Sleep,Physical,support,Screen,Internet,Financial,Expectation,Burnout,Mental,Dropout)
) AS Unpivoted
GROUP BY ColumnName;

/*Average, Minimum and Maximum of the varriables at once with mode*/
WITH Unpivoted AS (
    SELECT ColumnName, Value
    FROM
    (
        SELECT Studyhrs,Exampress,Performance,Stress,Anxiety,Depression,
               Sleep,Physical,support,Screen,Internet,Financial,Expectation,
               Burnout,Mental,Dropout
        FROM StudentsDB.[dbo].[students_reduced]
    ) AS Source
    UNPIVOT
    (
        Value FOR ColumnName IN (Studyhrs,Exampress,Performance,Stress,Anxiety,Depression,
                                 Sleep,Physical,support,Screen,Internet,Financial,Expectation,
                                 Burnout,Mental,Dropout)
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
