BEGIN TRANSACTION;
CREATE TABLE "Account" (
	sf_id VARCHAR(255) NOT NULL, 
	"Name" VARCHAR(255),  
	"Animal_Organisation__c" VARCHAR(255),  
	"Medicine_Manufacturer__c" VARCHAR(255), 
	"ParentId" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "Account" VALUES('0013z00002RKQrKAAX','Astros Animal Centre','true','false','',NULL);
CREATE TABLE "Contact" (
	sf_id VARCHAR(255) NOT NULL, 
	"FirstName" VARCHAR(255), 
	"LastName" VARCHAR(255), 
	"Is_a_Foster__c" VARCHAR(255), 
	"Languages__c" VARCHAR(255), 
	"Level__c" VARCHAR(255), 
	"AccountId" VARCHAR(255), 
	"ReportsToId" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "Contact" VALUES('0033z00002gyxaoAAA','Chris','Rolfe','false','','','','',NULL);
INSERT INTO "Contact" VALUES('0033z00002gMz0nAAC','A','Benn','true','','','','',NULL);
CREATE TABLE "Adoption__c" (
	sf_id VARCHAR(255) NOT NULL, 
	"Adoption_Stage__c" VARCHAR(255), 
	"Current_Daytime_Arrangements__c" VARCHAR(255), 
	"Date_Collected__c" VARCHAR(255), 
	"Date_Returned__c" VARCHAR(255), 
	"Date_of_Adoption__c" VARCHAR(255), 
	"Declined_Reason__c" VARCHAR(255), 
	"Facilities_Available__c" VARCHAR(255), 
	"Location_of_Animal_Daytime__c" VARCHAR(255), 
	"Location_of_Animal_Night_time__c" VARCHAR(255), 
	"Other_Pets_Animals__c" VARCHAR(255), 
	"Reason_for_Adoption__c" VARCHAR(255), 
	"Returned_Reason__c" VARCHAR(255), 
	"Total_Adults__c" VARCHAR(255), 
	"Total_Children__c" VARCHAR(255), 
	"Trial_End_Date_Time__c" VARCHAR(255), 
	"Type_of_Accommodation__c" VARCHAR(255), 
	"Animal__c" VARCHAR(255), 
	"Local_Vet__c" VARCHAR(255), 
	"Primary_Contact__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "Adoption__c" VALUES('a023z00000wMoWfAAK','Initial Review','','','','','','','','','','','','','','','','a003z00000rlhSbAAI','','0033z00002g1NkeAAE',NULL);
INSERT INTO "Adoption__c" VALUES('a023z00000wLbPwAAK','Initial Review','','2020-03-27','2020-06-30','2020-03-27','','','','','','','','','','','','a003z00000rlhSbAAI','','0033z00002g1NkeAAE',NULL);
CREATE TABLE "Animal_Action__c" (
	sf_id VARCHAR(255) NOT NULL, 
	"RecordTypeId" VARCHAR(255), 
	"Action_Completed__c" VARCHAR(255), 
	"Action_Status__c" VARCHAR(255), 
	"Comments__c" VARCHAR(255), 
	"Date_Time_Action_Completed__c" VARCHAR(255), 
	"Date_Time_of_Action__c" VARCHAR(255), 
	"Description__c" VARCHAR(255), 
	"Exercise_Duration__c" VARCHAR(255), 
	"Treatment_Type__c" VARCHAR(255), 
	"Animal__c" VARCHAR(255), 
	"Condition__c" VARCHAR(255), 
	"Given_By__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "Animal_Action__c" VALUES('a0B3z000027xs1dEAA','0123z000000lAxzAAE','false','','','','2020-06-10T10:30:00.000Z','Walk','','','a003z00000rlhSbAAI','','',NULL);
INSERT INTO "Animal_Action__c" VALUES('a0B3z000027xs1eEAA','0123z000000lAxzAAE','false','','','','2020-06-13T10:30:00.000Z','Walk','','','a003z00000rlhSbAAI','','',NULL);
INSERT INTO "Animal_Action__c" VALUES('a0B3z000027xs1fEAA','0123z000000lAxzAAE','false','','','','2020-06-12T10:30:00.000Z','Walk','','','a003z00000rlhSbAAI','','',NULL);
INSERT INTO "Animal_Action__c" VALUES('a0B3z000027xs1gEAA','0123z000000lAxzAAE','false','','','','2020-06-11T10:30:00.000Z','Walk','','','a003z00000rlhSbAAI','','',NULL);
INSERT INTO "Animal_Action__c" VALUES('a0B3z000027NTSbEAO','0123z000000lAxzAAE','true','','Slight Limp','2020-04-24T17:00:00.000Z','2020-04-24T15:00:00.000Z','Long Walk','2.0','','a003z00000roJxDAAU','','0033z00002gyxaoAAA',NULL);
INSERT INTO "Animal_Action__c" VALUES('a0B3z000027NTScEAO','0123z000000lAxzAAE','false','','','','2020-05-22T15:00:00.000Z','Long Walk','','','a003z00000roJxDAAU','','',NULL);
INSERT INTO "Animal_Action__c" VALUES('a0B3z000027NTSdEAO','0123z000000lAxzAAE','true','','','2020-05-15T17:00:00.000Z','2020-05-15T15:00:00.000Z','Long Walk','2.0','','a003z00000roJxDAAU','','0033z00002gMz0nAAC',NULL);
INSERT INTO "Animal_Action__c" VALUES('a0B3z000027NTSeEAO','0123z000000lAxzAAE','true','','','2020-05-08T17:00:00.000Z','2020-05-08T15:00:00.000Z','Long Walk','2.0','','a003z00000roJxDAAU','','0033z00002gMz0nAAC',NULL);
INSERT INTO "Animal_Action__c" VALUES('a0B3z000027NTSfEAO','0123z000000lAxzAAE','false','','','','2020-05-01T15:00:00.000Z','Long Walk','','','a003z00000roJxDAAU','','',NULL);
INSERT INTO "Animal_Action__c" VALUES('a0B3z000027NTSWEA4','0123z000000lAxuAAE','false','Scheduled','','','2020-04-24T12:00:00.000Z','Administer Medicine','','Medicine','a003z00000roJxDAAU','','',NULL);
INSERT INTO "Animal_Action__c" VALUES('a0B3z000027NTSXEA4','0123z000000lAxuAAE','false','','','','2020-04-28T12:00:00.000Z','Administer Medicine','','Medicine','a003z00000roJxDAAU','','',NULL);
INSERT INTO "Animal_Action__c" VALUES('a0B3z000027NTSYEA4','0123z000000lAxuAAE','false','','','','2020-04-27T12:00:00.000Z','Administer Medicine','','Medicine','a003z00000roJxDAAU','','',NULL);
INSERT INTO "Animal_Action__c" VALUES('a0B3z000027NTSZEA4','0123z000000lAxuAAE','false','','','','2020-04-26T12:00:00.000Z','Administer Medicine','','Medicine','a003z00000roJxDAAU','','',NULL);
INSERT INTO "Animal_Action__c" VALUES('a0B3z000027NTSaEAO','0123z000000lAxuAAE','false','','','','2020-04-25T12:00:00.000Z','Administer Medicine','','Medicine','a003z00000roJxDAAU','','',NULL);
INSERT INTO "Animal_Action__c" VALUES('a0B3z000027NTSgEAO','0123z000000lAy4AAE','false','','','','2020-04-24T15:30:00.000Z','Check Weight','','','a003z00000roJxDAAU','','',NULL);
INSERT INTO "Animal_Action__c" VALUES('a0B3z000027NTShEAO','0123z000000lAy4AAE','false','','','','2020-05-24T15:30:00.000Z','Check Weight','','','a003z00000roJxDAAU','','',NULL);
INSERT INTO "Animal_Action__c" VALUES('a0B3z000027v663EAA','0123z000000lAxuAAE','false','','','','2020-04-30T15:57:53.000Z','test','','Medicine','a003z00000rlhSbAAI','a043z00000vsOsdAAE','',NULL);
INSERT INTO "Animal_Action__c" VALUES('a0B3z000027v664EAA','0123z000000lAxuAAE','false','','','','2020-05-01T15:57:53.000Z','test','','Medicine','a003z00000rlhSbAAI','a043z00000vsOsdAAE','',NULL);
INSERT INTO "Animal_Action__c" VALUES('a0B3z000027xUzfEAE','0123z000000lAxzAAE','true','','','','2020-05-14T12:19:56.000Z','Walk','1.0','','a003z00000roJxDAAU','','',NULL);
CREATE TABLE "Animal_Action__c_rt_mapping" (
	record_type_id VARCHAR(18) NOT NULL, 
	developer_name VARCHAR(255), 
	PRIMARY KEY (record_type_id)
);
INSERT INTO "Animal_Action__c_rt_mapping" VALUES('0123z000000lAxzAAE','Exercise');
INSERT INTO "Animal_Action__c_rt_mapping" VALUES('0123z000000lAy4AAE','Nutrition');
INSERT INTO "Animal_Action__c_rt_mapping" VALUES('0123z000000lAxuAAE','Treatment');
CREATE TABLE "Animal_Alert__c" (
	sf_id VARCHAR(255) NOT NULL, 
	"Alert_Message__c" VARCHAR(255), 
	"End_Date_Time__c" VARCHAR(255), 
	"Start_Date_Time__c" VARCHAR(255), 
	"Animal__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "Animal_Alert__c" VALUES('a063z00001OQRfhAAH','Animal Marked as Lost/Found, Please scan for Identifier and contact relevant agency.','2020-05-23T10:34:11.000Z','2020-04-23T10:34:11.000Z','a003z00000roJxDAAU',NULL);
INSERT INTO "Animal_Alert__c" VALUES('a063z00001Nv1fiAAB','Test Alert 2','2020-04-05T11:00:00.000Z','2020-04-04T16:01:00.000Z','a003z00000rlhSbAAI',NULL);
INSERT INTO "Animal_Alert__c" VALUES('a063z00001Nv1g0AAB','Test Alert 3','2020-04-05T11:00:00.000Z','2020-03-31T16:01:00.000Z','a003z00000rlhSbAAI',NULL);
INSERT INTO "Animal_Alert__c" VALUES('a063z00001Nv1mrAAB','Elsa is currently receiving treatment which means that she cannot be taken on walks for the next two weeks.','2020-06-19T11:00:00.000Z','2020-06-05T16:37:00.000Z','a003z00000rlhSbAAI',NULL);
INSERT INTO "Animal_Alert__c" VALUES('a063z00001Nv1fdAAB','Test Alert 1 - Testing Update','2020-04-13T11:00:00.000Z','2020-04-05T16:01:00.000Z','a003z00000rlhSbAAI',NULL);
INSERT INTO "Animal_Alert__c" VALUES('a063z00001OR0RLAA1','Test Alert','','2020-04-30T11:16:02.000Z','a003z00000tFPgtAAG',NULL);
INSERT INTO "Animal_Alert__c" VALUES('a063z00001OR5slAAD','Test Alert','','2020-05-01T09:20:29.000Z','a003z00000rlhSbAAI',NULL);
CREATE TABLE "Animal__c" (
	sf_id VARCHAR(255) NOT NULL, 
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
	"Entry_Comments__c" VARCHAR(255), 
	"Entry_Reason__c" VARCHAR(255), 
	"Estimated_Age__c" VARCHAR(255), 
	"Gender__c" VARCHAR(255), 
	"Hold_Until_Date_Time__c" VARCHAR(255), 
	"Lost_Found__c" VARCHAR(255), 
	"Microchip__c" VARCHAR(255), 
	"Neutered_Spayed_Date_Time__c" VARCHAR(255), 
	"Neutered_Spayed__c" VARCHAR(255), 
	"PTS_Reason__c" VARCHAR(255), 
	"Rehoming_Requirements__c" VARCHAR(255), 
	"Related_Schemes__c" VARCHAR(255), 
	"Secondary_Colour__c" VARCHAR(255), 
	"Size__c" VARCHAR(255), 
	"Total_Adoption_Days__c" VARCHAR(255), 
	"Total_Away_Days__c" VARCHAR(255), 
	"Total_Length_of_Stay_in_Shelter_Days__c" VARCHAR(255), 
	"Type__c" VARCHAR(255), 
	"Account__c" VARCHAR(255), 
	"Previous_Current_Owner__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "Animal__c" VALUES('a003z00000roJxDAAU','Molly','Deceased','','Dutch','Short','Black','false','','2016-04-01T11:00:00.000Z','2013-02-04','2020-04-20T00:00:00.000Z','','','','Female','','false','','','true','','','','White','Small','','','12.0','Rabbit','','',NULL);
INSERT INTO "Animal__c" VALUES('a003z00000tFPgtAAG','Tommy','New','','English Spot','Short','White','false','','2020-04-23T10:39:08.000Z','','','','','5.0','Male','','false','','','false','','','','Brown','Large','','','0.0','Rabbit','','',NULL);
INSERT INTO "Animal__c" VALUES('a003z00000rlhSbAAI','Elsa','Available for Adoption','Bad Recall;Good with Children;Good with other species;Good with same species;Pulls on Lead','Labrador Retriever','Short','Blond','false','26.7','2020-03-25T12:00:00.000Z','2014-08-15','','','Boarding','5.5','Female','','false','','2020-04-01T11:00:00.000Z','true','','Cannot be left for long periods;Dietary;Secure Garden','Home for Life','','Large','','','49.0','Dog','','',NULL);
CREATE TABLE "Condition__c" (
	sf_id VARCHAR(255) NOT NULL, 
	"Condition_Description__c" VARCHAR(255), 
	"End_Date_Time__c" VARCHAR(255), 
	"Start_Date__c" VARCHAR(255), 
	"Animal__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "Condition__c" VALUES('a043z00000vsOsdAAE','Arthritis - Rear Legs','','2020-03-26T09:27:58.000Z','a003z00000rlhSbAAI',NULL);
CREATE TABLE "Locations__c" (
	sf_id VARCHAR(255) NOT NULL, 
	"RecordTypeId" VARCHAR(255), 
	"Animal_Preference_Foster__c" VARCHAR(255), 
	"Assessment_Due__c" VARCHAR(255), 
	"Available_Capacity__c" VARCHAR(255), 
	"Available_for_Boarding__c" VARCHAR(255), 
	"Block_Status__c" VARCHAR(255), 
	"Last_Assessment_Date__c" VARCHAR(255), 
	"Name__c" VARCHAR(255), 
	"Total_Capacity__c" VARCHAR(255), 
	"Unit_Status__c" VARCHAR(255), 
	"Foster_Contact__c" VARCHAR(255), 
	"Organisation__c" VARCHAR(255), 
	"Parent_Block__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "Locations__c" VALUES('a073z00001FSTZGAA5','0123z000000l7JIAAY','','','0.0','false','','','Pen 4','','Available','','','a073z00001EImZSAA1',NULL);
INSERT INTO "Locations__c" VALUES('a073z00001EIWD3AAP','0123z000000l7JIAAY','','2021-05-13','0.0','false','','2020-05-13','Cage 2','','Available','','','a073z00001EIWCtAAP',NULL);
INSERT INTO "Locations__c" VALUES('a073z00001EIWD4AAP','0123z000000l7JNAAY','','','0.0','false','','','Astros Animal Centre','','Available','','0013z00002RKQrKAAX','',NULL);
INSERT INTO "Locations__c" VALUES('a073z00001EIWCyAAP','0123z000000l7JIAAY','','2021-05-13','0.0','true','','2020-05-13','Cage 1','','Allocated','','','a073z00001EIWCtAAP',NULL);
INSERT INTO "Locations__c" VALUES('a073z00001EIWCtAAP','0123z000000l7JDAAY','','','2.0','false','Available','','Kennel Block A','2.0','','','','',NULL);
INSERT INTO "Locations__c" VALUES('a073z00001EImZXAA1','0123z000000l7JIAAY','','','0.0','true','','2020-04-15','Pen 1','','Available','','','a073z00001EImZSAA1',NULL);
INSERT INTO "Locations__c" VALUES('a073z00001EIWD8AAP','0123z000000l7JSAAY','Cat;Dog','','0.0','false','','','Mr Benn','','Available','0033z00002gMz0nAAC','','',NULL);
INSERT INTO "Locations__c" VALUES('a073z00001EImZSAA1','0123z000000l7JDAAY','','2020-10-09','3.0','false','Available','2020-04-15','Small Animals','4.0','','','','',NULL);
INSERT INTO "Locations__c" VALUES('a073z00001EImZhAAL','0123z000000l7JIAAY','','','0.0','false','','2020-04-15','Pen 3','','Allocated','','','a073z00001EImZSAA1',NULL);
INSERT INTO "Locations__c" VALUES('a073z00001FSjcsAAD','0123z000000l7JSAAY','Bird','','0.0','false','','','Bert','','','','','',NULL);
INSERT INTO "Locations__c" VALUES('a073z00001EImZcAAL','0123z000000l7JIAAY','','','0.0','false','','2020-04-15','Pen 2','','Available','','','a073z00001EImZSAA1',NULL);
CREATE TABLE "Locations__c_rt_mapping" (
	record_type_id VARCHAR(18) NOT NULL, 
	developer_name VARCHAR(255), 
	PRIMARY KEY (record_type_id)
);
INSERT INTO "Locations__c_rt_mapping" VALUES('0123z000000l7JDAAY','Block');
INSERT INTO "Locations__c_rt_mapping" VALUES('0123z000000l7JSAAY','Foster');
INSERT INTO "Locations__c_rt_mapping" VALUES('0123z000000l7JNAAY','Organisation');
INSERT INTO "Locations__c_rt_mapping" VALUES('0123z000000l7JIAAY','Unit');
CREATE TABLE "Medicine_Used__c" (
	sf_id VARCHAR(255) NOT NULL, 
	"Date_Time_Used__c" VARCHAR(255), 
	"Qty_Measure__c" VARCHAR(255), 
	"Qty_Used__c" VARCHAR(255), 
	"Medicine_Used__c" VARCHAR(255), 
	"Treatment_Used_In__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "Medicine_Used__c" VALUES('a0A3z00001QO1xKEAT','2020-06-10T11:00:00.000Z','millilitres','1.0','a093z00002SobAVAAZ','a0B3z000027v663EAA',NULL);
INSERT INTO "Medicine_Used__c" VALUES('a0A3z00001QL0e1EAD','2020-04-24T11:00:00.000Z','millilitres','0.7','a093z00002SobAVAAZ','a0B3z000027NTSWEA4',NULL);
INSERT INTO "Medicine_Used__c" VALUES('a0A3z00001QLpczEAD','2020-04-29T11:00:00.000Z','millilitres','0.8','a093z00002SobAVAAZ','a0B3z000027NTSXEA4',NULL);
CREATE TABLE "Medicine__c" (
	sf_id VARCHAR(255) NOT NULL, 
	"Active__c" VARCHAR(255), 
	"Batch_No__c" VARCHAR(255), 
	"Category__c" VARCHAR(255), 
	"Comments__c" VARCHAR(255), 
	"Delivery_Method__c" VARCHAR(255), 
	"Medicine_Name__c" VARCHAR(255), 
	"Manufacturer__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "Medicine__c" VALUES('a093z00002SobAVAAZ','true','1203848','AntiInflammatory','','','Metacam','',NULL);
CREATE TABLE "Movement__c" (
	sf_id VARCHAR(255) NOT NULL, 
	"Current__c" VARCHAR(255), 
	"End_Date__c" VARCHAR(255), 
	"Start_Date__c" VARCHAR(255), 
	"Type__c" VARCHAR(255), 
	"Animal__c" VARCHAR(255), 
	"Location__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "Movement__c" VALUES('a083z00001MtG5XAAV','true','','2020-06-10','Housed','a003z00000tFPgtAAG','a073z00001EImZhAAL',NULL);
INSERT INTO "Movement__c" VALUES('a083z00001MtG6LAAV','true','','2020-06-10','Housed','a003z00000rlhSbAAI','a073z00001EIWCyAAP',NULL);
INSERT INTO "Movement__c" VALUES('a083z00001Msf4wAAB','false','2020-04-09','2020-04-09','Housed','a003z00000roJxDAAU','a073z00001EIWCyAAP',NULL);
INSERT INTO "Movement__c" VALUES('a083z00001Msf51AAB','false','2020-04-09','2020-04-09','Fostered','a003z00000roJxDAAU','a073z00001EIWD8AAP',NULL);
INSERT INTO "Movement__c" VALUES('a083z00001MsivLAAR','false','2020-04-20','2020-04-20','Adopted, See Adoption Record','a003z00000roJxDAAU','',NULL);
INSERT INTO "Movement__c" VALUES('a083z00001MsivMAAR','false','2020-04-23','2020-04-20','Deceased','a003z00000roJxDAAU','',NULL);
INSERT INTO "Movement__c" VALUES('a083z00001MsjjoAAB','false','2020-06-10','2020-04-22','Housed','a003z00000rlhSbAAI','a073z00001EIWD3AAP',NULL);
INSERT INTO "Movement__c" VALUES('a083z00001Msf5BAAR','false','2020-04-14','2020-04-09','Transferred','a003z00000roJxDAAU','a073z00001EIWD4AAP',NULL);
INSERT INTO "Movement__c" VALUES('a083z00001MskPsAAJ','false','2020-04-23','2020-04-23','Boarding','a003z00000roJxDAAU','a073z00001EImZXAA1',NULL);
INSERT INTO "Movement__c" VALUES('a083z00001MskPtAAJ','false','2020-04-23','2020-04-23','Housed','a003z00000roJxDAAU','a073z00001EImZhAAL',NULL);
INSERT INTO "Movement__c" VALUES('a083z00001MskPxAAJ','false','2020-04-23','2020-04-23','Fostered','a003z00000roJxDAAU','a073z00001EIWD8AAP',NULL);
INSERT INTO "Movement__c" VALUES('a083z00001MsivGAAR','false','2020-04-20','2020-04-20','Housed','a003z00000roJxDAAU','a073z00001EImZcAAL',NULL);
INSERT INTO "Movement__c" VALUES('a083z00001MskQCAAZ','false','2020-04-30','2020-04-23','Housed','a003z00000tFPgtAAG','a073z00001EImZcAAL',NULL);
INSERT INTO "Movement__c" VALUES('a083z00001MskQ7AAJ','true','2020-04-23','2020-04-23','Deceased','a003z00000roJxDAAU','',NULL);
INSERT INTO "Movement__c" VALUES('a083z00001MskPnAAJ','false','2020-04-23','2020-04-23','Housed','a003z00000roJxDAAU','a073z00001EImZXAA1',NULL);
INSERT INTO "Movement__c" VALUES('a083z00001MsthEAAR','false','2020-04-30','2020-04-30','Housed','a003z00000tFPgtAAG','a073z00001FSTZGAA5',NULL);
INSERT INTO "Movement__c" VALUES('a083z00001MsthJAAR','false','2020-06-10','2020-04-30','Adopted, See Adoption Record','a003z00000tFPgtAAG','',NULL);
INSERT INTO "Movement__c" VALUES('a083z00001MsgJcAAJ','false','2020-04-20','2020-04-14','Housed','a003z00000roJxDAAU','a073z00001EIWCyAAP',NULL);
INSERT INTO "Movement__c" VALUES('a083z00001MsgJXAAZ','false','2020-04-14','2020-04-14','Transferred','a003z00000roJxDAAU','a073z00001EIWD4AAP',NULL);
INSERT INTO "Movement__c" VALUES('a083z00001MskQ2AAJ','false','2020-04-23','2020-04-23','Transferred','a003z00000roJxDAAU','a073z00001EIWD4AAP',NULL);
INSERT INTO "Movement__c" VALUES('a083z00001Msg9eAAB','false','2020-04-14','2020-04-14','Fostered','a003z00000roJxDAAU','a073z00001EIWD8AAP',NULL);
INSERT INTO "Movement__c" VALUES('a083z00001Msg9fAAB','false','2020-04-14','2020-04-14','Housed','a003z00000roJxDAAU','a073z00001EIWD3AAP',NULL);
INSERT INTO "Movement__c" VALUES('a083z00001Msg9UAAR','false','2020-04-14','2020-04-14','Housed','a003z00000roJxDAAU','a073z00001EIWD3AAP',NULL);
INSERT INTO "Movement__c" VALUES('a083z00001Msf56AAB','false','2020-04-09','2020-04-09','Boarding','a003z00000roJxDAAU','a073z00001EIWCyAAP',NULL);
COMMIT;
