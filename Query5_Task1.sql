CREATE VIEW combined1 AS
SELECT 
"Security" AS security,
COUNT("Security") AS robberies_no,
AVG("Amount") AS average
FROM 
(
SELECT
b."Security",
b."BankName",
b."City",
r."Amount"
FROM "Banks" b
INNER JOIN "Robberies" r
ON b."BankName" = r."BankName" AND b."City" = r."City"
ORDER BY b."Security"
) AS join_table
GROUP BY security
ORDER BY robberies_no DESC;
