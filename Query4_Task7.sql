SELECT
"Skills"."Description",
"Robbers"."RobberId",
"Robbers"."Nickname"
FROM "HasSkills"
INNER JOIN "Robbers" ON "Robbers"."RobberId" = "HasSkills"."RobberId"
INNER JOIN "Skills" ON "Skills"."SkillId" = "HasSkills"."SkillId"
GROUP BY "Skills"."Description", "Robbers"."RobberId";
