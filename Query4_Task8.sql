SELECT 
"RobberId",
"Nickname",
("Age" - "NoYears") AS "NoYearsNotInPrison" 
FROM "Robbers"
WHERE "NoYears" > "Age"/2;
