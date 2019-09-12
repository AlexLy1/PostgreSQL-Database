CREATE VIEW result3 AS
SELECT 
h."BankName" AS bankname,
h."City" AS city,
COUNT(DISTINCT (h."RobberId", h."City")) AS accounts_num
FROM "HasAccounts" h
INNER JOIN (
SELECT 
one.bankname,
one.city
FROM(
SELECT
p."BankName" AS bankname,
p."City" AS city,
p."NoRobbers" AS no_robbers,
p."PlannedDate" AS plan_date,
r."Date" AS rob_date
FROM "Plans" p
LEFT JOIN "Robberies" r 
ON p."BankName" = r."BankName" AND p."City" = r."City"
WHERE (EXTRACT (YEAR FROM p."PlannedDate") = '2020'AND EXTRACT (YEAR FROM r."Date") != '2018') 
OR (EXTRACT (YEAR FROM p."PlannedDate") = '2020'AND r."Date" IS NULL)) AS one
) AS two
ON h."BankName" = two.bankname AND h."City" = two.city
GROUP BY (h."BankName", h."City")
ORDER BY accounts_num DESC;


