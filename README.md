# PostgreSQL-Database
### Building Tables
8 tables are reqired in the relational database module.
* Banks, which stores general information about banks, including the number of accounts and the level of security.
Attributes: BankName, City, NoAccounts, Security
* Robberies, which stores information about robberies of banks that the gang has already
performed, including how much was stolen.
Attributes: BankName, City, Date, Amount
* Plans, which stores information about banks that the gang plans to rob.
Attributes: BankName, City, NoRobbers, PlannedDate
* Robbers, which stores information about gang members. Note that it is not possible to be in prison for more years than you have been alive!
Attributes: RobberId, Nickname, Age, NoYears
* Skills, which stores the possible robbery skills.
Attributes: SkillId, Description
* HasSkills, which stores information about the skills that particular gang members possess.
Each skill of a robber has a preference rank, and a grade.
Attributes: RobberId, SkillId, Preference, Grade
* HasAccounts, which stores information about the banks where individual gang members
have accounts.
Attributes: RobberId, BankName, City
* Accomplices, which stores information about which gang members participated in each bank robbery, and what share of the money they got.
Attributes: RobberId, BankName, City, RobberyDate, Share <br />
### Querying 
* Q4-T1 <br />
  Retrieve BankName of all banks where Calamity Jane has an account. The answer should list every bank at most once. 
* Q4-T2 <br />
  Retrieve BankName and Security for all banks in Chicago that have more than 9000 accounts.
* Q4-T3 <br />
  Retrieve BankName and City of all bank branches that have no branch in Chicago. The answer should be sorted in increasing     order of the number of accounts. 
* Q4-T4 <br />
  Retrieve BankName and City of the first bank branch that was ever robbed by the gang. 
* Q4-T5 <br />
  Retrieve RobberId, Nickname and individual total “earnings” of those robbers who have earned more than $30,000 by robbing     banks. The answer should be sorted in decreasing order of the total earnings.
* Q4-T6 <br />
  Retrieve RobberId, NickName, and the Number of Years in Prison for all robbers who were in prison for more than three years.
* Q4-T7 <br />
  Retrieve the Descriptions of all skills together with the RobberId and NickName of all robbers that possess this skill. The   answer should be grouped by skill description. 
* Q4-T8 <br />
  Retrieve RobberId, Nickname and the Number of Years not spent in prison for all robbers who spent more than half of their     life in prison. <br /> <br />
* Q5-T1 <br />
  The police department wants to know whether bank branches with lower security levels are more attractive for robbers than     those with higher security levels. Construct a view containing the Security level, the total Number of robberies that         occurred in bank branches of that security level, and the average Amount of money that was stolen during these robberies. 
* Q5-T2 <br />
  The police department wants to know which robbers are most active, but were never penalised. Construct a view that contains   the Nicknames of all robbers who participated in more robberies than the average, but spent no time in prison. The answer     should be sorted in decreasing order of the individual total “earnings” of the robbers. 
* Q5-T3 <br />
  The police department wants to increase security at those bank branches that are most likely to be victims in the near         future. Construct a view containing the BankName, the City, and Security level of all bank branches that have not been         robbed in 2018, but where plans for a robbery in 2020 are known. The answer should be sorted in decreasing order of the       number of robbers who have accounts in that bank branch.
* Q5-T5 <br />
  The police department has a theory that bank robberies in Chicago are more profitable than in any other city. Construct a     view that shows the average share of all robberies in Chicago, and the average share of all robberies in the city that         observes the highest average share (other than Chicago). The average share of a robbery is computed based on the number of     participants in that particular robbery. 
