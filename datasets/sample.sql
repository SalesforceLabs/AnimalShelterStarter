BEGIN TRANSACTION;
CREATE TABLE "Account" (
	id INTEGER NOT NULL, 
	"Animal_Organisation__c" VARCHAR(255), 
	"Medicine_Manufacturer__c" VARCHAR(255), 
	"Name" VARCHAR(255), 
	"ParentId" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Account" VALUES(1,'False','False','Ruth''s Veterinary Practice','');
INSERT INTO "Account" VALUES(2,'False','False','AS Demo Account','');
INSERT INTO "Account" VALUES(3,'False','False','Codey''s Wildlife Centre','');
INSERT INTO "Account" VALUES(4,'True','False','Astros Animal Centre','');
CREATE TABLE "Adopter_Profile__c" (
	id INTEGER NOT NULL, 
	"Active__c" VARCHAR(255), 
	"Current_Daytime_Arrangements__c" VARCHAR(255), 
	"Gender__c" VARCHAR(255), 
	"Local_Vet__c" VARCHAR(255), 
	"Location_of_Animal_Daytime__c" VARCHAR(255), 
	"Location_of_Animal_Night__c" VARCHAR(255), 
	"Other_Animal_Details__c" VARCHAR(255), 
	"Other_Animals__c" VARCHAR(255), 
	"Other_Animals_of_same_Species__c" VARCHAR(255), 
	"Permission_to_House_Animal__c" VARCHAR(255), 
	"Preferred_Animal_Size__c" VARCHAR(255), 
	"Preferred_Maturity_Level__c" VARCHAR(255), 
	"Profile_Approval_Status__c" VARCHAR(255), 
	"Profile_End_Date__c" VARCHAR(255), 
	"Profile_Rejected_Reason__c" VARCHAR(255), 
	"Profile_Start_Date__c" VARCHAR(255), 
	"Reason_for_wanting_to_Adopt__c" VARCHAR(255), 
	"Safe_Outside_Area__c" VARCHAR(255), 
	"Small_Children__c" VARCHAR(255), 
	"Special_Care_Adoption_Considered__c" VARCHAR(255), 
	"Type_of_Accommodation__c" VARCHAR(255), 
	"Type_of_Animal__c" VARCHAR(255), 
	"Contact__c" VARCHAR(255), 
	"Local_Vet_details__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Adopter_Profile__c" VALUES(1,'True','','No Preference','False','','','','False','False','True','Medium','No preference','Approved','','','2023-02-14','','False','False','False','Farm','Dog','5','');
INSERT INTO "Adopter_Profile__c" VALUES(2,'True','','Male','False','','','Loads','True','False','True','Large','No preference','Approved','','','2023-02-14','Love Animals','True','False','True','Farm','Rabbit','2','');
INSERT INTO "Adopter_Profile__c" VALUES(3,'True','','No Preference','False','','','','False','False','True','Small','No preference','Approved','','','2023-02-14','','True','False','True','House - Semi-Detached - Urban','Rabbit','8','');
INSERT INTO "Adopter_Profile__c" VALUES(4,'True','','Female','True','','','','False','False','True','Large','Senior','Approved','','','2023-02-14','','True','False','False','Farm','Dog','1','2');
INSERT INTO "Adopter_Profile__c" VALUES(5,'True','kkjdhkgf','Male','True','','','','False','False','True','Medium','No preference','New','','','2023-02-14','','True','False','False','Farm','Dog','9','2');
INSERT INTO "Adopter_Profile__c" VALUES(6,'True','','Female','False','','','Rabbit','True','False','True','Large','No preference','Approved','','','2023-02-14','','True','False','False','Farm','Dog','3','');
INSERT INTO "Adopter_Profile__c" VALUES(7,'True','Working','Male','True','Working away with me','At home location','2 Other Dogs','True','True','True','Medium','Junior','Approved','','','2023-02-14','Love animals','True','True','False','House - Detached - Rural','Dog','4','2');
INSERT INTO "Adopter_Profile__c" VALUES(8,'False','','Male','True','','','','False','False','True','Small','No preference','Approved','2023-02-14','','2023-02-14','','True','False','True','House - Detached - Rural','Rabbit','3','2');
CREATE TABLE "Animal_Action__c" (
	id INTEGER NOT NULL, 
	"Action_Completed__c" VARCHAR(255), 
	"Action_Status__c" VARCHAR(255), 
	"Comments__c" VARCHAR(255), 
	"Date_Time_Action_Completed__c" VARCHAR(255), 
	"Date_Time_of_Action__c" VARCHAR(255), 
	"Description__c" VARCHAR(255), 
	"Exercise_Duration__c" VARCHAR(255), 
	"RecordTypeId" VARCHAR(255), 
	"Treatment_Type__c" VARCHAR(255), 
	"Animal__c" VARCHAR(255), 
	"Condition__c" VARCHAR(255), 
	"Given_By__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Animal_Action__c" VALUES(1,'False','','','','2020-06-10T10:30:00.000+0000','Walk','','0128K000000Al97QAC','','3','','');
INSERT INTO "Animal_Action__c" VALUES(2,'False','','','','2020-06-13T10:30:00.000+0000','Walk','','0128K000000Al97QAC','','3','','');
INSERT INTO "Animal_Action__c" VALUES(3,'False','','','','2020-06-12T10:30:00.000+0000','Walk','','0128K000000Al97QAC','','3','','');
INSERT INTO "Animal_Action__c" VALUES(4,'False','','','','2020-06-11T10:30:00.000+0000','Walk','','0128K000000Al97QAC','','3','','');
INSERT INTO "Animal_Action__c" VALUES(5,'False','','','','2020-04-30T15:57:53.000+0000','test','','0128K000000Al99QAC','Medicine','3','1','');
INSERT INTO "Animal_Action__c" VALUES(6,'False','','','','2020-05-01T15:57:53.000+0000','test','','0128K000000Al99QAC','Medicine','3','1','');
INSERT INTO "Animal_Action__c" VALUES(7,'False','','','','2020-05-22T15:00:00.000+0000','Long Walk','','0128K000000Al97QAC','','1','','');
INSERT INTO "Animal_Action__c" VALUES(8,'False','','','','2020-05-01T15:00:00.000+0000','Long Walk','','0128K000000Al97QAC','','1','','');
INSERT INTO "Animal_Action__c" VALUES(9,'False','Scheduled','','','2020-04-24T12:00:00.000+0000','Administer Medicine','','0128K000000Al99QAC','Medicine','1','','');
INSERT INTO "Animal_Action__c" VALUES(10,'False','','','','2020-04-28T12:00:00.000+0000','Administer Medicine','','0128K000000Al99QAC','Medicine','1','','');
INSERT INTO "Animal_Action__c" VALUES(11,'False','','','','2020-04-27T12:00:00.000+0000','Administer Medicine','','0128K000000Al99QAC','Medicine','1','','');
INSERT INTO "Animal_Action__c" VALUES(12,'False','','','','2020-04-26T12:00:00.000+0000','Administer Medicine','','0128K000000Al99QAC','Medicine','1','','');
INSERT INTO "Animal_Action__c" VALUES(13,'False','','','','2020-04-25T12:00:00.000+0000','Administer Medicine','','0128K000000Al99QAC','Medicine','1','','');
INSERT INTO "Animal_Action__c" VALUES(14,'False','','','','2020-04-24T15:30:00.000+0000','Check Weight','','0128K000000Al98QAC','','1','','');
INSERT INTO "Animal_Action__c" VALUES(15,'False','','','','2020-05-24T15:30:00.000+0000','Check Weight','','0128K000000Al98QAC','','1','','');
INSERT INTO "Animal_Action__c" VALUES(16,'True','','','','2020-05-14T12:19:56.000+0000','Walk','1.0','0128K000000Al97QAC','','1','','');
INSERT INTO "Animal_Action__c" VALUES(17,'True','','','2020-05-15T17:00:00.000+0000','2020-05-15T15:00:00.000+0000','Long Walk','2.0','0128K000000Al97QAC','','1','','7');
INSERT INTO "Animal_Action__c" VALUES(18,'True','','','2020-05-08T17:00:00.000+0000','2020-05-08T15:00:00.000+0000','Long Walk','2.0','0128K000000Al97QAC','','1','','7');
INSERT INTO "Animal_Action__c" VALUES(19,'True','','Slight Limp','2020-04-24T17:00:00.000+0000','2020-04-24T15:00:00.000+0000','Long Walk','2.0','0128K000000Al97QAC','','1','','6');
CREATE TABLE "Animal_Action__c_rt_mapping" (
	record_type_id VARCHAR(18) NOT NULL, 
	developer_name VARCHAR(255), 
	PRIMARY KEY (record_type_id)
);
INSERT INTO "Animal_Action__c_rt_mapping" VALUES('0128K000000Al97QAC','Exercise');
INSERT INTO "Animal_Action__c_rt_mapping" VALUES('0128K000000Al98QAC','Nutrition');
INSERT INTO "Animal_Action__c_rt_mapping" VALUES('0128K000000Al99QAC','Treatment');
CREATE TABLE "Animal_Alert__c" (
	id INTEGER NOT NULL, 
	"Alert_Message__c" VARCHAR(255), 
	"End_Date_Time__c" VARCHAR(255), 
	"Start_Date_Time__c" VARCHAR(255), 
	"Animal__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Animal_Alert__c" VALUES(1,'Test Alert 2','2020-04-05T11:00:00.000+0000','2020-04-04T16:01:00.000+0000','3');
INSERT INTO "Animal_Alert__c" VALUES(2,'Test Alert 3','2020-04-05T11:00:00.000+0000','2020-03-31T16:01:00.000+0000','3');
INSERT INTO "Animal_Alert__c" VALUES(3,'Elsa is currently receiving treatment which means that she cannot be taken on walks for the next two weeks.','2020-06-19T11:00:00.000+0000','2020-06-05T16:37:00.000+0000','3');
INSERT INTO "Animal_Alert__c" VALUES(4,'Test Alert 1 - Testing Update','2020-04-13T11:00:00.000+0000','2020-04-05T16:01:00.000+0000','3');
INSERT INTO "Animal_Alert__c" VALUES(5,'Test Alert','','2020-05-01T09:20:29.000+0000','3');
INSERT INTO "Animal_Alert__c" VALUES(6,'Animal Marked as Lost/Found, Please scan for Identifier and contact relevant agency.','2020-05-23T10:34:11.000+0000','2020-04-23T10:34:11.000+0000','1');
INSERT INTO "Animal_Alert__c" VALUES(7,'Test Alert','','2020-04-30T11:16:02.000+0000','2');
CREATE TABLE "Animal_Relationship__c" (
	id INTEGER NOT NULL, 
	"Record_Created__c" VARCHAR(255), 
	"Status__c" VARCHAR(255), 
	"Animal__c" VARCHAR(255), 
	"Related_Animal__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "Animal__c" (
	id INTEGER NOT NULL, 
	"Animal_Name__c" VARCHAR(255), 
	"Animal_Status__c" VARCHAR(255), 
	"Behaviours__c" VARCHAR(255), 
	"Breed__c" VARCHAR(255), 
	"Coat_Type__c" VARCHAR(255), 
	"Colour__c" VARCHAR(255), 
	"Crossbreed__c" VARCHAR(255), 
	"Current_Weight__c" VARCHAR(255), 
	"Date_of_Arrival__c" VARCHAR(255), 
	"Date_of_Birth__c" VARCHAR(255), 
	"Deceased_Date__c" VARCHAR(255), 
	"Deceased_Reason__c" VARCHAR(255), 
	"Entry_Comments__c" VARCHAR(255), 
	"Entry_Reason__c" VARCHAR(255), 
	"Estimated_Age__c" VARCHAR(255), 
	"Gender__c" VARCHAR(255), 
	"Hold_Until_Date_Time__c" VARCHAR(255), 
	"IsCloned__c" VARCHAR(255), 
	"Location_Status__c" VARCHAR(255), 
	"Lost_Found__c" VARCHAR(255), 
	"Microchip__c" VARCHAR(255), 
	"Neutered_Spayed_Date_Time__c" VARCHAR(255), 
	"Neutered_Spayed__c" VARCHAR(255), 
	"PTS_Reason__c" VARCHAR(255), 
	"Rehoming_Requirements__c" VARCHAR(255), 
	"Related_Schemes__c" VARCHAR(255), 
	"SYSTEM_Breed_Migrated__c" VARCHAR(255), 
	"Secondary_Colour__c" VARCHAR(255), 
	"Site__c" VARCHAR(255), 
	"Size__c" VARCHAR(255), 
	"Total_Adoption_Days__c" VARCHAR(255), 
	"Total_Away_Days__c" VARCHAR(255), 
	"Total_Length_of_Stay_in_Shelter_Days__c" VARCHAR(255), 
	"Type__c" VARCHAR(255), 
	"Account__c" VARCHAR(255), 
	"Breed_Lookup__c" VARCHAR(255), 
	"Previous_Current_Owner__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Animal__c" VALUES(1,'Molly','Deceased','','Dutch','Short','Black','False','','2016-04-01T11:00:00.000+0000','2013-02-04','2020-04-20T00:00:00.000+0000','','','','','Female','','False','','False','','','True','','','','False','White','','Small','','','12.0','Rabbit','','','');
INSERT INTO "Animal__c" VALUES(2,'Tommy','Available for Adoption','Happy being handled','English Spot','Short','White','False','','2020-04-23T10:39:08.000+0000','','','','','','5.0','Male','','False','Housed - My Shelter / Small Animals / Pen 1','False','','','False','','Medical','','False','Brown','My Shelter','Large','','','987.0','Rabbit','','2','');
INSERT INTO "Animal__c" VALUES(3,'Elsa','Available for Adoption','Bad Recall;Good with Children;Good with other species;Good with same species;Pulls on Lead','Labrador Retriever','Short','Blond','False','26.7','2020-03-25T12:00:00.000+0000','2014-08-15','','','','Boarding','5.5','Female','','False','','False','','2020-04-01T11:00:00.000+0000','True','','Cannot be left for long periods;Dietary;Secure Garden','Home for Life','False','','','Large','','','49.0','Dog','','1','');
INSERT INTO "Animal__c" VALUES(4,'Furby','Adopted','','','','','False','','2023-02-14T12:00:00.000+0000','','','','','','3.0','Male','','False','Adopted - See Adoption Record','False','','','False','','','','False','','My Shelter','Small','','','2.0','','','4','3');
CREATE TABLE "Assessment__c" (
	id INTEGER NOT NULL, 
	"Appetite__c" VARCHAR(255), 
	"Assessment_Date_Time__c" VARCHAR(255), 
	"Assessment_Type__c" VARCHAR(255), 
	"Behaviour_s__c" VARCHAR(255), 
	"Breathing__c" VARCHAR(255), 
	"Category__c" VARCHAR(255), 
	"Coughing__c" VARCHAR(255), 
	"Faceas__c" VARCHAR(255), 
	"Fleas__c" VARCHAR(255), 
	"Flys__c" VARCHAR(255), 
	"Fur_Condition__c" VARCHAR(255), 
	"General_Comments__c" VARCHAR(255), 
	"Has_ability_to_curl__c" VARCHAR(255), 
	"Hearing_Ears__c" VARCHAR(255), 
	"Hydration_Level__c" VARCHAR(255), 
	"Left_Front_Limb__c" VARCHAR(255), 
	"Left_Hind_Limb__c" VARCHAR(255), 
	"Lungworm__c" VARCHAR(255), 
	"Mange__c" VARCHAR(255), 
	"Mouth_Airway__c" VARCHAR(255), 
	"Movement_Condition__c" VARCHAR(255), 
	"Right_Front_Limb__c" VARCHAR(255), 
	"Right_Hind_Limb__c" VARCHAR(255), 
	"Ringworm__c" VARCHAR(255), 
	"Sight_Eyes__c" VARCHAR(255), 
	"Skin_Condition__c" VARCHAR(255), 
	"Spine_Condition__c" VARCHAR(255), 
	"Ticks__c" VARCHAR(255), 
	"Wings__c" VARCHAR(255), 
	"Animal__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Assessment__c" VALUES(1,'Healthy','2023-02-14T09:57:54.000+0000','Entry','Happy being handled','Normal','Both','False','Normal','False','','Normal','','False','Normal','Normal','','','False','False','Clear','Normal','','','False','Normal','Normal','Normal','False','','2');
CREATE TABLE "Breed__c" (
	id INTEGER NOT NULL, 
	"Active__c" VARCHAR(255), 
	"Category__c" VARCHAR(255), 
	"Crossbreed__c" VARCHAR(255), 
	"Latin_Name__c" VARCHAR(255), 
	"Name" VARCHAR(255), 
	"Species__c" VARCHAR(255), 
	"Status__c" VARCHAR(255), 
	"Type__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Breed__c" VALUES(1,'True','Mammal','False','','Dog - Labrador','Labrador','Domestic','Dog');
INSERT INTO "Breed__c" VALUES(2,'True','Mammal','False','','Rabbit - English Spot','English Spot','Exotic','Rabbit');
INSERT INTO "Breed__c" VALUES(3,'True','Mammal','False','','Rabbit - Dutch','Dutch','Exotic','Rabbit');
INSERT INTO "Breed__c" VALUES(4,'True','Mammal','False','','Rabbit - Lionhead','Lionhead','Exotic','Rabbit');
CREATE TABLE "Condition__c" (
	id INTEGER NOT NULL, 
	"Condition_Description__c" VARCHAR(255), 
	"End_Date_Time__c" VARCHAR(255), 
	"Short_Description__c" VARCHAR(255), 
	"Start_Date__c" VARCHAR(255), 
	"Animal__c" VARCHAR(255), 
	"Assessment__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Condition__c" VALUES(1,'Arthritis - Rear Legs','','','2020-03-26T09:27:58.000+0000','3','');
CREATE TABLE "Contact" (
	id INTEGER NOT NULL, 
	"DoNotCall" VARCHAR(255), 
	"FirstName" VARCHAR(255), 
	"HasOptedOutOfEmail" VARCHAR(255), 
	"HasOptedOutOfFax" VARCHAR(255), 
	"Is_a_Foster__c" VARCHAR(255), 
	"Is_an_Adopter__c" VARCHAR(255), 
	"LastName" VARCHAR(255), 
	"AccountId" VARCHAR(255), 
	"ReportsToId" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Contact" VALUES(1,'False','Steve','False','False','False','False','Backshall','3','');
INSERT INTO "Contact" VALUES(2,'False','Chris','False','False','False','False','Packham','3','');
INSERT INTO "Contact" VALUES(3,'False','Johnny','False','False','False','True','Morris','3','');
INSERT INTO "Contact" VALUES(4,'False','Michaela','False','False','False','False','Strachan','3','');
INSERT INTO "Contact" VALUES(5,'False','David','False','False','False','False','Attenborough','3','');
INSERT INTO "Contact" VALUES(6,'False','Chris','False','False','False','False','Rolfe','3','');
INSERT INTO "Contact" VALUES(7,'False','Andy','False','False','True','False','Fosterer','3','');
INSERT INTO "Contact" VALUES(8,'False','Virginia','False','False','False','False','McKenna','3','');
INSERT INTO "Contact" VALUES(9,'False','Terry','False','False','False','False','Nutkins','3','');
CREATE TABLE "Locations__c" (
	id INTEGER NOT NULL, 
	"Allocation__c" VARCHAR(255), 
	"Animal_Preference_Foster__c" VARCHAR(255), 
	"Assessment_Due__c" VARCHAR(255), 
	"Available_Capacity__c" VARCHAR(255), 
	"Available_for_Boarding__c" VARCHAR(255), 
	"Block_Status__c" VARCHAR(255), 
	"Capacity__c" VARCHAR(255), 
	"Last_Assessment_Date__c" VARCHAR(255), 
	"Location_Capacity__c" VARCHAR(255), 
	"Name__c" VARCHAR(255), 
	"RecordTypeId" VARCHAR(255), 
	"Total_Capacity__c" VARCHAR(255), 
	"Unit_Status__c" VARCHAR(255), 
	"Foster_Contact__c" VARCHAR(255), 
	"Organisation__c" VARCHAR(255), 
	"Parent_Block__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Locations__c" VALUES(1,'0.0','','','0.0','False','','1.0','','Single Animal','My Shelter','0128K000000Al9DQAS','','Available','','','');
INSERT INTO "Locations__c" VALUES(2,'1.0','','','0.0','False','','1.0','','Single Animal','Pen 4','0128K000000Al9EQAS','','Allocated','','','7');
INSERT INTO "Locations__c" VALUES(3,'0.0','','2021-05-13','0.0','False','','1.0','2020-05-13','Single Animal','Cage 2','0128K000000Al9EQAS','','Available','','','5');
INSERT INTO "Locations__c" VALUES(4,'0.0','','2021-05-13','0.0','True','','1.0','2020-05-13','Single Animal','Cage 1','0128K000000Al9EQAS','','Available','','','5');
INSERT INTO "Locations__c" VALUES(5,'0.0','','','2.0','False','Available','1.0','','Single Animal','Kennel Block A','0128K000000Al9AQAS','2.0','Available','','','1');
INSERT INTO "Locations__c" VALUES(6,'1.0','','','0.0','True','','1.0','2020-04-15','Single Animal','Pen 1','0128K000000Al9EQAS','','Allocated','','','7');
INSERT INTO "Locations__c" VALUES(7,'0.0','','2020-10-09','4.0','False','Available','1.0','2020-04-15','Single Animal','Small Animals','0128K000000Al9AQAS','4.0','Available','','','1');
INSERT INTO "Locations__c" VALUES(8,'1.0','','','0.0','False','','1.0','2020-04-15','Single Animal','Pen 3','0128K000000Al9EQAS','','Allocated','','','7');
INSERT INTO "Locations__c" VALUES(9,'0.0','','','0.0','False','','1.0','','Single Animal','Bert','0128K000000Al9BQAS','','Available','','','');
INSERT INTO "Locations__c" VALUES(10,'0.0','','','0.0','False','','1.0','2020-04-15','Single Animal','Pen 2','0128K000000Al9EQAS','','Available','','','7');
INSERT INTO "Locations__c" VALUES(11,'0.0','','','0.0','False','','1.0','','Single Animal','Astros Animal Centre','0128K000000Al9CQAS','','Available','','5','');
INSERT INTO "Locations__c" VALUES(12,'0.0','Cat;Dog','','0.0','False','','1.0','','Single Animal','Mr Benn','0128K000000Al9BQAS','','Available','7','','');
CREATE TABLE "Locations__c_rt_mapping" (
	record_type_id VARCHAR(18) NOT NULL, 
	developer_name VARCHAR(255), 
	PRIMARY KEY (record_type_id)
);
INSERT INTO "Locations__c_rt_mapping" VALUES('0128K000000Al9AQAS','Block');
INSERT INTO "Locations__c_rt_mapping" VALUES('0128K000000Al9BQAS','Foster');
INSERT INTO "Locations__c_rt_mapping" VALUES('0128K000000Al9CQAS','Organisation');
INSERT INTO "Locations__c_rt_mapping" VALUES('0128K000000Al9DQAS','Site');
INSERT INTO "Locations__c_rt_mapping" VALUES('0128K000000Al9EQAS','Unit');
CREATE TABLE "Medicine_Used__c" (
	id INTEGER NOT NULL, 
	"Date_Time_Used__c" VARCHAR(255), 
	"Qty_Measure__c" VARCHAR(255), 
	"Qty_Used__c" VARCHAR(255), 
	"Medicine_Used__c" VARCHAR(255), 
	"Treatment_Used_In__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Medicine_Used__c" VALUES(1,'2020-04-24T11:00:00.000+0000','millilitres','0.7','1','9');
INSERT INTO "Medicine_Used__c" VALUES(2,'2020-04-29T11:00:00.000+0000','millilitres','0.8','1','10');
INSERT INTO "Medicine_Used__c" VALUES(3,'2020-06-10T11:00:00.000+0000','millilitres','1.0','1','5');
CREATE TABLE "Medicine__c" (
	id INTEGER NOT NULL, 
	"Active__c" VARCHAR(255), 
	"Batch_No__c" VARCHAR(255), 
	"Category__c" VARCHAR(255), 
	"Comments__c" VARCHAR(255), 
	"Delivery_Method__c" VARCHAR(255), 
	"Medicine_Name__c" VARCHAR(255), 
	"Manufacturer__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Medicine__c" VALUES(1,'True','1203848','AntiInflammatory','','','Metacam','');
COMMIT;
