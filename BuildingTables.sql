CREATE TABLE "Banks"
(
"BankName" VARCHAR(50),
"City" VARCHAR(50),
"NoAccounts" INTEGER CHECK ("NoAccounts" >= 0) DEFAULT 0,
"Security" VARCHAR(50) NOT NULL CHECK ("Security" in ('very good', 'execellent', 'weak', 'good')),
PRIMARY KEY("BankName", "City")
);

CREATE TABLE "Robberies"
(
"BankName" VARCHAR(50),
"City" VARCHAR(50),
"Date" DATE CHECK ("Date" > '2000-01-01'),
"Amount" FLOAT CHECK ("Amount" >= 0.0) DEFAULT 0.0,
PRIMARY KEY ("BankName", "City", "Date"),
FOREIGN KEY ("BankName", "City") REFERENCES "Banks" ("BankName", "City") ON DELETE RESTRICT
);

CREATE TABLE "Plans"
(
"BankName" VARCHAR(50),
"City" VARCHAR(50),
"NoRobbers" INTEGER, CHECK("NoRobbers" > 0),
"PlannedDate" DATE NOT NULL,
PRIMARY KEY("BankName", "City", "PlannedDate"),
FOREIGN KEY ("BankName", "City") REFERENCES "Banks" ("BankName", "City") ON DELETE RESTRICT
);

CREATE TABLE "Robbers"
(
"RobberId" serial,
"Nickname" VARCHAR(50) NOT NULL, 
"Age" INTEGER CHECK ("Age" > 0),
"NoYears" INTEGER CHECK("NoYears" >= 0 AND "NoYears" < "Age"),
PRIMARY KEY("RobberId")
);

CREATE TABLE "Skills"
(
"SkillId" serial,
"Description" VARCHAR(250) UNIQUE NOT NULL,
PRIMARY KEY ("SkillId")
);

CREATE TABLE "HasSkills"
(
"RobberId" serial,
"SkillId" serial,
"Preference" INTEGER CHECK("Preference" > 0) NOT NULL,
"Grade" VARCHAR(5) NOT NULL,
PRIMARY KEY ("RobberId", "SkillId"),
FOREIGN KEY ("RobberId") REFERENCES "Robbers" ("RobberId") ON DELETE RESTRICT,
FOREIGN KEY ("SkillId") REFERENCES "Skills" ("SkillId") ON DELETE RESTRICT
);

CREATE TABLE "HasAccounts"
(
"RobberId" serial,
"BankName" VARCHAR(50),
"City" VARCHAR(50),
PRIMARY KEY ("RobberId", "BankName", "City"),
FOREIGN KEY ("RobberId") REFERENCES "Robbers" ("RobberId") ON DELETE RESTRICT,
FOREIGN KEY ("BankName", "City") REFERENCES "Banks" ("BankName", "City") ON DELETE RESTRICT
);

CREATE TABLE "Accomplices"
(
"RobberId" serial,
"BankName" VARCHAR(50),
"City" VARCHAR(50),
"RobberyDate" DATE NOT NULL,
"Share" FLOAT CHECK ("Share" > 0.0),
PRIMARY KEY ("RobberId", "BankName", "City", "RobberyDate"),
FOREIGN KEY ("RobberId") REFERENCES "Robbers" ("RobberId") ON DELETE RESTRICT,
FOREIGN KEY ("BankName", "City", "RobberyDate") REFERENCES "Robberies" ("BankName", "City", "Date") ON DELETE RESTRICT
);
