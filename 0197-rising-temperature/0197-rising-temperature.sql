# Write your MySQL query statement below
WITH PreviousWeather As
(
    SELECT
        id,
        recordDate,
        temperature,
        LAG(temperature, 1) OVER (ORDER BY recordDate) AS PreviousTemperature,
        LAG(recordDate, 1) OVER (ORDER BY recordDate) AS PreviousRecordDate
    FROM 
        Weather
)
SELECT 
    id
FROM 
    PreviousWeather
WHERE 
    temperature > PreviousTemperature
AND 
    recordDate = DATE_ADD(PreviousRecordDate, INTERVAL 1 DAY); -- check matching date