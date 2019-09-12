CREATE VIEW result2 AS
SELECT 
t.nick_name,
t.earnings
FROM(
SELECT 
"Robbers"."RobberId" AS id,
"Robbers"."Nickname" AS nick_name,
first.robber_times AS robber_times,
"Robbers"."NoYears" AS year,
first.total_earnings AS earnings
FROM (
SELECT
a."RobberId" AS id,
COUNT(a."RobberId") AS robber_times,
SUM(a."Share") AS total_earnings
FROM "Accomplices" a
GROUP BY id
HAVING COUNT(a."RobberId") > (
SELECT
AVG(a.robber_times) AS average
FROM(
SELECT
b."RobberId" AS id,
COUNT(b."RobberId") AS robber_times
FROM "Accomplices" b
GROUP BY b."RobberId"
) AS a)
) AS first INNER JOIN "Robbers" 
ON "Robbers"."RobberId" = first.id
WHERE "Robbers"."NoYears" = 0
) AS t
ORDER BY t.earnings DESC;
