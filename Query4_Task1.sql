SELECT DISTINCT "BankName" FROM "HasAccounts"
WHERE "HasAccounts"."RobberId" = 
(
SELECT "RobberId" from "Robbers"
WHERE "Robbers"."Nickname" = 'Calamity Jane'
);
