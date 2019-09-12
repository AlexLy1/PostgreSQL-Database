SELECT 
"Accomplices"."RobberId",
"Robbers"."Nickname", 
SUM("Accomplices"."Share") AS "TotalEarnings"
FROM "Accomplices" 
INNER JOIN "Robbers"
ON "Robbers"."RobberId" = "Accomplices"."RobberId" 
GROUP BY "Accomplices"."RobberId", "Robbers"."RobberId"
HAVING SUM("Accomplices"."Share") > 30000
ORDER BY "TotalEarnings" DESC;
