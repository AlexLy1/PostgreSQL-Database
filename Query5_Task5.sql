CREATE VIEW chicago_evanston AS
SELECT *
FROM(
SELECT
a.city,
AVG(a.avg) AS average
FROM (
SELECT
c.bankname,
c.city,
c.date,
SUM(c.share)/COUNT((c.bankname, c.city, c.date)) AS avg
FROM (
SELECT
a."BankName" AS bankname,
a."City" AS city,
a."RobberyDate" AS date,
a."Share" AS share
FROM "Accomplices" a
WHERE a."City" = 'Chicago'
) AS c
GROUP BY (c.bankname, c.city, c.date)
) AS a
GROUP BY a.city
) AS o
CROSS JOIN (
SELECT
ae.city,
ae.avg AS highest
FROM (
SELECT 
e.bankname,
e.city,
e.date,
SUM(e.share)/COUNT((e.bankname, e.city, e.date)) AS avg
FROM (
SELECT 
s."BankName" AS bankname,
s."City" AS city,
s."RobberyDate" AS date,
s."Share" AS share
FROM "Accomplices" s
WHERE s."City" != 'Chicago'
) AS e
GROUP BY (e.bankname, e.city, e.date)
ORDER BY avg DESC
LIMIT 1
) AS ae
) AS q;

