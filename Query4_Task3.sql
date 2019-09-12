SELECT "BankName", "City" FROM "Banks"
WHERE "Banks"."BankName" NOT IN
(
SELECT "BankName" FROM "Banks"
WHERE "Banks"."City" = 'Chicago'
)
ORDER BY "NoAccounts" ASC;
