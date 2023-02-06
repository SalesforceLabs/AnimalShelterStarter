BEGIN TRANSACTION;
CREATE TABLE "Account" (
	id INTEGER NOT NULL, 
	"AccountNumber" VARCHAR(255), 
	"AccountSource" VARCHAR(255), 
	"Animal_Organisation__c" VARCHAR(255), 
	"AnnualRevenue" VARCHAR(255), 
	"BillingCity" VARCHAR(255), 
	"BillingCountry" VARCHAR(255), 
	"BillingGeocodeAccuracy" VARCHAR(255), 
	"BillingLatitude" VARCHAR(255), 
	"BillingLongitude" VARCHAR(255), 
	"BillingPostalCode" VARCHAR(255), 
	"BillingState" VARCHAR(255), 
	"BillingStreet" VARCHAR(255), 
	"CleanStatus" VARCHAR(255), 
	"Description" VARCHAR(255), 
	"DunsNumber" VARCHAR(255), 
	"Fax" VARCHAR(255), 
	"Industry" VARCHAR(255), 
	"Jigsaw" VARCHAR(255), 
	"Medicine_Manufacturer__c" VARCHAR(255), 
	"NaicsCode" VARCHAR(255), 
	"NaicsDesc" VARCHAR(255), 
	"Name" VARCHAR(255), 
	"NumberOfEmployees" VARCHAR(255), 
	"Ownership" VARCHAR(255), 
	"Phone" VARCHAR(255), 
	"Rating" VARCHAR(255), 
	"ShippingCity" VARCHAR(255), 
	"ShippingCountry" VARCHAR(255), 
	"ShippingGeocodeAccuracy" VARCHAR(255), 
	"ShippingLatitude" VARCHAR(255), 
	"ShippingLongitude" VARCHAR(255), 
	"ShippingPostalCode" VARCHAR(255), 
	"ShippingState" VARCHAR(255), 
	"ShippingStreet" VARCHAR(255), 
	"Sic" VARCHAR(255), 
	"SicDesc" VARCHAR(255), 
	"Site" VARCHAR(255), 
	"TickerSymbol" VARCHAR(255), 
	"Tradestyle" VARCHAR(255), 
	"Type" VARCHAR(255), 
	"Website" VARCHAR(255), 
	"YearStarted" VARCHAR(255), 
	"DandbCompanyId" VARCHAR(255), 
	"OperatingHoursId" VARCHAR(255), 
	"ParentId" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Account" VALUES(1,'','','True','','','','','','','','','','Pending','','','','','','False','','','Astros Animal Centre','','','','','','','','','','','','','','','','','','','','','','','');
INSERT INTO "Account" VALUES(2,'','','False','','','','','','','','','','Pending','','','','','','False','','','Star Wars Account','','','','','','','','','','','','','','','','','','','','','','','');
CREATE TABLE "Adopter_Profile__c" (
	id INTEGER NOT NULL, 
	"Active__c" VARCHAR(255), 
	"Current_Daytime_Arrangements__c" VARCHAR(255), 
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
INSERT INTO "Adopter_Profile__c" VALUES(1,'True','','False','','','','False','False','False','','','Approved','','','2023-02-03','','False','False','False','','Rabbit','6','');
INSERT INTO "Adopter_Profile__c" VALUES(2,'True','','False','','','','False','False','False','','','Approved','','','2023-02-03','','False','False','False','','Rabbit','5','');
INSERT INTO "Adopter_Profile__c" VALUES(3,'True','','False','','','','False','False','False','','','Approved','','','2023-02-03','','False','False','False','','Rabbit','4','');
INSERT INTO "Adopter_Profile__c" VALUES(4,'True','','False','','','','False','False','False','','','Approved','','','2023-02-03','','False','False','False','','Rabbit','3','');
CREATE TABLE "Adoption_Match__c" (
	id INTEGER NOT NULL, 
	"Auto_Matched__c" VARCHAR(255), 
	"Status__c" VARCHAR(255), 
	"Successful_Adoption__c" VARCHAR(255), 
	"Adopter_Profile__c" VARCHAR(255), 
	"Animal__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Adoption_Match__c" VALUES(1,'True','','True','2','2');
INSERT INTO "Adoption_Match__c" VALUES(2,'True','','True','1','4');
CREATE TABLE "Adoption__c" (
	id INTEGER NOT NULL, 
	"Adoption_Stage__c" VARCHAR(255), 
	"Current_Daytime_Arrangements__c" VARCHAR(255), 
	"Date_Collected__c" VARCHAR(255), 
	"Date_Returned__c" VARCHAR(255), 
	"Date_of_Adoption__c" VARCHAR(255), 
	"Declined_Reason__c" VARCHAR(255), 
	"Facilities_Available__c" VARCHAR(255), 
	"Has_Local_Vet__c" VARCHAR(255), 
	"Location_of_Animal_Daytime__c" VARCHAR(255), 
	"Location_of_Animal_Night_time__c" VARCHAR(255), 
	"Other_Animals__c" VARCHAR(255), 
	"Other_Animals_of_same_Species__c" VARCHAR(255), 
	"Other_Pets_Animals__c" VARCHAR(255), 
	"Permission_to_House_Animal__c" VARCHAR(255), 
	"Reason_for_Adoption__c" VARCHAR(255), 
	"Returned_Reason__c" VARCHAR(255), 
	"Safe_Outside_Area__c" VARCHAR(255), 
	"Total_Adults__c" VARCHAR(255), 
	"Total_Children__c" VARCHAR(255), 
	"Trial_End_Date_Time__c" VARCHAR(255), 
	"Type_of_Accommodation__c" VARCHAR(255), 
	"Animal__c" VARCHAR(255), 
	"Local_Vet__c" VARCHAR(255), 
	"Primary_Contact__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Adoption__c" VALUES(1,'Initial Review','','','','','','','False','','','False','False','','False','','','False','','','','','3','','');
INSERT INTO "Adoption__c" VALUES(2,'Initial Review','','2020-03-27','2020-06-30','2020-03-27','','','False','','','False','False','','False','','','False','','','','','3','','');
INSERT INTO "Adoption__c" VALUES(3,'Adopted','','2023-02-03','','2023-02-03','','','False','','','False','False','','False','','','False','','','','','2','','5');
INSERT INTO "Adoption__c" VALUES(4,'Adopted','','2023-02-03','','2023-02-03','','','False','','','False','False','','False','','','False','','','','','4','','6');
CREATE TABLE "Animal_Action__c" (
	id INTEGER NOT NULL, 
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
	"RecordTypeId" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Animal_Action__c" VALUES(1,'False','','','','2020-06-10T10:30:00.000+0000','Walk','','','3','','','1');
INSERT INTO "Animal_Action__c" VALUES(2,'False','','','','2020-06-13T10:30:00.000+0000','Walk','','','3','','','1');
INSERT INTO "Animal_Action__c" VALUES(3,'False','','','','2020-06-12T10:30:00.000+0000','Walk','','','3','','','1');
INSERT INTO "Animal_Action__c" VALUES(4,'False','','','','2020-06-11T10:30:00.000+0000','Walk','','','3','','','1');
INSERT INTO "Animal_Action__c" VALUES(5,'False','','','','2020-04-30T15:57:53.000+0000','test','','Medicine','3','1','','3');
INSERT INTO "Animal_Action__c" VALUES(6,'False','','','','2020-05-01T15:57:53.000+0000','test','','Medicine','3','1','','3');
INSERT INTO "Animal_Action__c" VALUES(7,'False','','','','2020-05-22T15:00:00.000+0000','Long Walk','','','1','','','1');
INSERT INTO "Animal_Action__c" VALUES(8,'False','','','','2020-05-01T15:00:00.000+0000','Long Walk','','','1','','','1');
INSERT INTO "Animal_Action__c" VALUES(9,'False','Scheduled','','','2020-04-24T12:00:00.000+0000','Administer Medicine','','Medicine','1','','','3');
INSERT INTO "Animal_Action__c" VALUES(10,'False','','','','2020-04-28T12:00:00.000+0000','Administer Medicine','','Medicine','1','','','3');
INSERT INTO "Animal_Action__c" VALUES(11,'False','','','','2020-04-27T12:00:00.000+0000','Administer Medicine','','Medicine','1','','','3');
INSERT INTO "Animal_Action__c" VALUES(12,'False','','','','2020-04-26T12:00:00.000+0000','Administer Medicine','','Medicine','1','','','3');
INSERT INTO "Animal_Action__c" VALUES(13,'False','','','','2020-04-25T12:00:00.000+0000','Administer Medicine','','Medicine','1','','','3');
INSERT INTO "Animal_Action__c" VALUES(14,'False','','','','2020-04-24T15:30:00.000+0000','Check Weight','','','1','','','2');
INSERT INTO "Animal_Action__c" VALUES(15,'False','','','','2020-05-24T15:30:00.000+0000','Check Weight','','','1','','','2');
INSERT INTO "Animal_Action__c" VALUES(16,'True','','','','2020-05-14T12:19:56.000+0000','Walk','1.0','','1','','','1');
INSERT INTO "Animal_Action__c" VALUES(17,'True','','','2020-05-15T17:00:00.000+0000','2020-05-15T15:00:00.000+0000','Long Walk','2.0','','1','','2','1');
INSERT INTO "Animal_Action__c" VALUES(18,'True','','','2020-05-08T17:00:00.000+0000','2020-05-08T15:00:00.000+0000','Long Walk','2.0','','1','','2','1');
INSERT INTO "Animal_Action__c" VALUES(19,'True','','Slight Limp','2020-04-24T17:00:00.000+0000','2020-04-24T15:00:00.000+0000','Long Walk','2.0','','1','','1','1');
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
	"Geolocation__Latitude__s" VARCHAR(255), 
	"Geolocation__Longitude__s" VARCHAR(255), 
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
INSERT INTO "Animal__c" VALUES(1,'Molly','Deceased','','Dutch','Short','Black','False','','2016-04-01T11:00:00.000+0000','2013-02-04','2020-04-20T00:00:00.000+0000','','','','','Female','','','','False','','False','','','True','','','','False','White','','Small','','','12.0','Rabbit','','3','');
INSERT INTO "Animal__c" VALUES(2,'Tommy','New','Good with Children','English Spot','Short','White','False','','2020-04-23T10:39:08.000+0000','','','','','','5.0','Male','','','','False','Adopted - See Adoption Record','False','','','False','','','','False','Brown','','Large','','','976.0','Rabbit','','4','5');
INSERT INTO "Animal__c" VALUES(3,'Elsa','Available for Adoption','Bad Recall;Good with Children;Good with other species;Good with same species;Pulls on Lead','Labrador Retriever','Short','Blond','False','26.7','2020-03-25T12:00:00.000+0000','2014-08-15','','','','Boarding','5.5','Female','','','','False','','False','','2020-04-01T11:00:00.000+0000','True','','Cannot be left for long periods;Dietary;Secure Garden','Home for Life','False','','','Large','','','49.0','Dog','','1','');
INSERT INTO "Animal__c" VALUES(4,'Furby','Adopted','','','','','False','','2023-02-03T12:00:00.000+0000','','','','','','','','','','','False','Adopted - See Adoption Record','False','','','False','','','','False','','','','','','0.0','','','2','6');
CREATE TABLE "Assessment__c" (
	id INTEGER NOT NULL, 
	"Assessment_Type__c" VARCHAR(255), 
	"Category__c" VARCHAR(255), 
	"Animal__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "Asset" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "AssetWarranty" (
	id INTEGER NOT NULL, 
	"StartDate" VARCHAR(255), 
	"AssetId" VARCHAR(255), 
	PRIMARY KEY (id)
);
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
INSERT INTO "Breed__c" VALUES(2,'True','Mammal','False','','Rabbit - Lionhead','Lionhead','Exotic','Rabbit');
INSERT INTO "Breed__c" VALUES(3,'True','Mammal','False','','Rabbit - Dutch','Dutch','Exotic','Rabbit');
INSERT INTO "Breed__c" VALUES(4,'True','Mammal','False','','Rabbit - English Spot','English Spot','Exotic','Rabbit');
CREATE TABLE "BusinessHours" (
	id INTEGER NOT NULL, 
	"FridayEndTime" VARCHAR(255), 
	"FridayStartTime" VARCHAR(255), 
	"IsActive" VARCHAR(255), 
	"IsDefault" VARCHAR(255), 
	"MondayEndTime" VARCHAR(255), 
	"MondayStartTime" VARCHAR(255), 
	"Name" VARCHAR(255), 
	"SaturdayEndTime" VARCHAR(255), 
	"SaturdayStartTime" VARCHAR(255), 
	"SundayEndTime" VARCHAR(255), 
	"SundayStartTime" VARCHAR(255), 
	"ThursdayEndTime" VARCHAR(255), 
	"ThursdayStartTime" VARCHAR(255), 
	"TimeZoneSidKey" VARCHAR(255), 
	"TuesdayEndTime" VARCHAR(255), 
	"TuesdayStartTime" VARCHAR(255), 
	"WednesdayEndTime" VARCHAR(255), 
	"WednesdayStartTime" VARCHAR(255), 
	PRIMARY KEY (id)
);
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
	"AssistantName" VARCHAR(255), 
	"AssistantPhone" VARCHAR(255), 
	"Birthdate" VARCHAR(255), 
	"CleanStatus" VARCHAR(255), 
	"Department" VARCHAR(255), 
	"Description" VARCHAR(255), 
	"DoNotCall" VARCHAR(255), 
	"Email" VARCHAR(255), 
	"EmailBouncedDate" VARCHAR(255), 
	"EmailBouncedReason" VARCHAR(255), 
	"Fax" VARCHAR(255), 
	"FirstName" VARCHAR(255), 
	"HasOptedOutOfEmail" VARCHAR(255), 
	"HasOptedOutOfFax" VARCHAR(255), 
	"HomePhone" VARCHAR(255), 
	"Is_a_Foster__c" VARCHAR(255), 
	"Is_an_Adopter__c" VARCHAR(255), 
	"Jigsaw" VARCHAR(255), 
	"LastName" VARCHAR(255), 
	"LeadSource" VARCHAR(255), 
	"MailingCity" VARCHAR(255), 
	"MailingCountry" VARCHAR(255), 
	"MailingGeocodeAccuracy" VARCHAR(255), 
	"MailingLatitude" VARCHAR(255), 
	"MailingLongitude" VARCHAR(255), 
	"MailingPostalCode" VARCHAR(255), 
	"MailingState" VARCHAR(255), 
	"MailingStreet" VARCHAR(255), 
	"MobilePhone" VARCHAR(255), 
	"OtherCity" VARCHAR(255), 
	"OtherCountry" VARCHAR(255), 
	"OtherGeocodeAccuracy" VARCHAR(255), 
	"OtherLatitude" VARCHAR(255), 
	"OtherLongitude" VARCHAR(255), 
	"OtherPhone" VARCHAR(255), 
	"OtherPostalCode" VARCHAR(255), 
	"OtherState" VARCHAR(255), 
	"OtherStreet" VARCHAR(255), 
	"Phone" VARCHAR(255), 
	"Salutation" VARCHAR(255), 
	"Title" VARCHAR(255), 
	"AccountId" VARCHAR(255), 
	"IndividualId" VARCHAR(255), 
	"ReportsToId" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Contact" VALUES(1,'','','','Pending','','','False','','','','','Chris','False','False','','False','False','','Rolfe','','','','','','','','','','','','','','','','','','','','','','','','','');
INSERT INTO "Contact" VALUES(2,'','','','Pending','','','False','','','','','A','False','False','','True','False','','Benn','','','','','','','','','','','','','','','','','','','','','','','','','');
INSERT INTO "Contact" VALUES(3,'','','','Pending','','','False','','','','','Han','False','False','','False','False','','Solo','','','','','','','','','','','','','','','','','','','','','','','2','','');
INSERT INTO "Contact" VALUES(4,'','','','Pending','','','False','','','','','Luke','False','False','','False','False','','Skywalker','','','','','','','','','','','','','','','','','','','','','','','2','','');
INSERT INTO "Contact" VALUES(5,'','','','Pending','','','False','','','','','Boba','False','False','','False','True','','Fett','','','','','','','','','','','','','','','','','','','','','','','2','','');
INSERT INTO "Contact" VALUES(6,'','','','Pending','','','False','','','','','Leia','False','False','','False','True','','Organa','','','','','','','','','','','','','','','','','','','','','','','2','','');
CREATE TABLE "ContentAsset" (
	id INTEGER NOT NULL, 
	"DeveloperName" VARCHAR(255), 
	"IsVisibleByExternalUsers" VARCHAR(255), 
	"Language" VARCHAR(255), 
	"MasterLabel" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "ContentAsset" VALUES(1,'Screenshot_20200430_at_174027','False','en_US','Animal_Shelter_Starter_Logo');
CREATE TABLE "ContentVersion" (
	id INTEGER NOT NULL, 
	"ContentLocation" VARCHAR(255), 
	"ContentModifiedDate" VARCHAR(255), 
	"ContentUrl" VARCHAR(255), 
	"Description" VARCHAR(255), 
	"ExternalDocumentInfo1" VARCHAR(255), 
	"ExternalDocumentInfo2" VARCHAR(255), 
	"IsAssetEnabled" VARCHAR(255), 
	"IsMajorVersion" VARCHAR(255), 
	"Origin" VARCHAR(255), 
	"PathOnClient" VARCHAR(255), 
	"ReasonForChange" VARCHAR(255), 
	"SharingOption" VARCHAR(255), 
	"SharingPrivacy" VARCHAR(255), 
	"TagCsv" VARCHAR(255), 
	"Title" VARCHAR(255), 
	"VersionData" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "ContentVersion" VALUES(1,'S','2023-02-03T13:48:16.000+0000','','','','','True','True','H','Animal Shelter Starter Logo.png','','A','N','','Animal Shelter Starter Logo','/services/data/v56.0/sobjects/ContentVersion/0688F000000MXlcQAG/VersionData');
CREATE TABLE "ContentWorkspace" (
	id INTEGER NOT NULL, 
	"Description" VARCHAR(255), 
	"DeveloperName" VARCHAR(255), 
	"Name" VARCHAR(255), 
	"ShouldAddCreatorMembership" VARCHAR(255), 
	"WorkspaceImageId" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "ContractLineItem" (
	id INTEGER NOT NULL, 
	"Quantity" VARCHAR(255), 
	"UnitPrice" VARCHAR(255), 
	"PricebookEntryId" VARCHAR(255), 
	"ServiceContractId" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "DandBCompany" (
	id INTEGER NOT NULL, 
	"DunsNumber" VARCHAR(255), 
	"Name" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "Entitlement" (
	id INTEGER NOT NULL, 
	"CasesPerEntitlement" VARCHAR(255), 
	"EndDate" VARCHAR(255), 
	"IsPerIncident" VARCHAR(255), 
	"Name" VARCHAR(255), 
	"RemainingCases" VARCHAR(255), 
	"RemainingWorkOrders" VARCHAR(255), 
	"StartDate" VARCHAR(255), 
	"Type" VARCHAR(255), 
	"WorkOrdersPerEntitlement" VARCHAR(255), 
	"AccountId" VARCHAR(255), 
	"AssetId" VARCHAR(255), 
	"AssetWarrantyId" VARCHAR(255), 
	"BusinessHoursId" VARCHAR(255), 
	"ContractLineItemId" VARCHAR(255), 
	"LocationId" VARCHAR(255), 
	"ServiceContractId" VARCHAR(255), 
	"SvcApptBookingWindowsId" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "FieldServiceMobileSettings" (
	id INTEGER NOT NULL, 
	"AscAutomaticMode" VARCHAR(255), 
	"AscCancellationTimerInSec" VARCHAR(255), 
	"AscCompletedStatus" VARCHAR(255), 
	"AscOnSiteStatus" VARCHAR(255), 
	"AscRadiusInMeters" VARCHAR(255), 
	"AscTimeLimitationInMin" VARCHAR(255), 
	"AscTravelStatus" VARCHAR(255), 
	"BgGeoLocationAccuracy" VARCHAR(255), 
	"BgGeoLocationMinUpdateFreqMins" VARCHAR(255), 
	"BrandInvertedColor" VARCHAR(255), 
	"ContrastInvertedColor" VARCHAR(255), 
	"ContrastPrimaryColor" VARCHAR(255), 
	"ContrastQuaternaryColor" VARCHAR(255), 
	"ContrastQuinaryColor" VARCHAR(255), 
	"ContrastSecondaryColor" VARCHAR(255), 
	"ContrastTertiaryColor" VARCHAR(255), 
	"DefaultListViewDeveloperName" VARCHAR(255), 
	"DeveloperName" VARCHAR(255), 
	"FeedbackPrimaryColor" VARCHAR(255), 
	"FeedbackSecondaryColor" VARCHAR(255), 
	"FeedbackSelectedColor" VARCHAR(255), 
	"FutureDaysInDatePicker" VARCHAR(255), 
	"GeoLocationAccuracy" VARCHAR(255), 
	"GeoLocationMinUpdateFreqMins" VARCHAR(255), 
	"IsAssignmentNotification" VARCHAR(255), 
	"IsDispatchNotification" VARCHAR(255), 
	"IsScheduleViewResourceAbsences" VARCHAR(255), 
	"IsSendLocationHistory" VARCHAR(255), 
	"IsShowEditFullRecord" VARCHAR(255), 
	"IsTimeSheetEnabled" VARCHAR(255), 
	"IsTimeZoneEnabled" VARCHAR(255), 
	"Language" VARCHAR(255), 
	"MasterLabel" VARCHAR(255), 
	"MetadataCacheTimeDays" VARCHAR(255), 
	"NavbarBackgroundColor" VARCHAR(255), 
	"NavbarInvertedColor" VARCHAR(255), 
	"PastDaysInDatePicker" VARCHAR(255), 
	"PrimaryBrandColor" VARCHAR(255), 
	"QuickStatusChangeFlowName" VARCHAR(255), 
	"RecordDataCacheTimeMins" VARCHAR(255), 
	"SecondaryBrandColor" VARCHAR(255), 
	"TimeIntervalSetupMins" VARCHAR(255), 
	"UpdateScheduleTimeMins" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "Folder" (
	id INTEGER NOT NULL, 
	"AccessType" VARCHAR(255), 
	"DeveloperName" VARCHAR(255), 
	"IsReadonly" VARCHAR(255), 
	"Name" VARCHAR(255), 
	"Type" VARCHAR(255), 
	"ParentId" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Folder" VALUES(1,'Hidden','AnimalShelterReports','True','Animal Shelter Reports','Report','');
INSERT INTO "Folder" VALUES(2,'Hidden','EinsteinBotReports_v2','True','Einstein Bot Reports Rel_238','Report','');
CREATE TABLE "Individual" (
	id INTEGER NOT NULL, 
	"LastName" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "Location" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	PRIMARY KEY (id)
);
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
	"Total_Capacity__c" VARCHAR(255), 
	"Unit_Status__c" VARCHAR(255), 
	"Foster_Contact__c" VARCHAR(255), 
	"Organisation__c" VARCHAR(255), 
	"Parent_Block__c" VARCHAR(255), 
	"RecordTypeId" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Locations__c" VALUES(1,'0.0','','','0.0','False','','1.0','','Single Animal','Pen 4','','Available','','','6','8');
INSERT INTO "Locations__c" VALUES(2,'0.0','','2021-05-13','0.0','False','','1.0','2020-05-13','Single Animal','Cage 2','','Available','','','4','8');
INSERT INTO "Locations__c" VALUES(3,'0.0','','2021-05-13','0.0','True','','1.0','2020-05-13','Single Animal','Cage 1','','Available','','','4','8');
INSERT INTO "Locations__c" VALUES(4,'0.0','','','2.0','False','Available','1.0','','Single Animal','Kennel Block A','2.0','Available','','','12','4');
INSERT INTO "Locations__c" VALUES(5,'0.0','','','0.0','True','','1.0','2020-04-15','Single Animal','Pen 1','','Available','','','6','8');
INSERT INTO "Locations__c" VALUES(6,'0.0','','2020-10-09','4.0','False','Available','1.0','2020-04-15','Single Animal','Small Animals','4.0','Available','','','12','4');
INSERT INTO "Locations__c" VALUES(7,'0.0','','','0.0','False','','1.0','2020-04-15','Single Animal','Pen 3','','Available','','','6','8');
INSERT INTO "Locations__c" VALUES(8,'0.0','Bird','','0.0','False','','1.0','','Single Animal','Bert','','Available','','','','5');
INSERT INTO "Locations__c" VALUES(9,'0.0','','','0.0','False','','1.0','2020-04-15','Single Animal','Pen 2','','Available','','','6','8');
INSERT INTO "Locations__c" VALUES(10,'0.0','','','0.0','False','','1.0','','Single Animal','Astros Animal Centre','','Available','','1','','6');
INSERT INTO "Locations__c" VALUES(11,'0.0','Cat;Dog','','0.0','False','','1.0','','Single Animal','Mr Benn','','Available','2','','','5');
INSERT INTO "Locations__c" VALUES(12,'0.0','','','0.0','False','','1.0','','Single Animal','My Animal Centre','','Available','','','','7');
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
CREATE TABLE "MilestoneType" (
	id INTEGER NOT NULL, 
	"Description" VARCHAR(255), 
	"Name" VARCHAR(255), 
	"RecurrenceType" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "Movement__c" (
	id INTEGER NOT NULL, 
	"Current__c" VARCHAR(255), 
	"End_Date__c" VARCHAR(255), 
	"Release_Location__Latitude__s" VARCHAR(255), 
	"Release_Location__Longitude__s" VARCHAR(255), 
	"Start_Date__c" VARCHAR(255), 
	"Type__c" VARCHAR(255), 
	"Animal__c" VARCHAR(255), 
	"Location__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Movement__c" VALUES(1,'True','','','','2020-06-10','Housed','3','3');
INSERT INTO "Movement__c" VALUES(2,'False','2020-06-10','','','2020-04-22','Housed','3','2');
INSERT INTO "Movement__c" VALUES(3,'False','2020-04-20','','','2020-04-20','Adopted, See Adoption Record','1','');
INSERT INTO "Movement__c" VALUES(4,'False','2020-04-23','','','2020-04-20','Deceased','1','');
INSERT INTO "Movement__c" VALUES(5,'True','2020-04-23','','','2020-04-23','Deceased','1','');
INSERT INTO "Movement__c" VALUES(6,'False','2020-04-09','','','2020-04-09','Housed','1','3');
INSERT INTO "Movement__c" VALUES(7,'False','2020-04-20','','','2020-04-14','Housed','1','3');
INSERT INTO "Movement__c" VALUES(8,'False','2020-04-09','','','2020-04-09','Boarding','1','3');
INSERT INTO "Movement__c" VALUES(9,'False','2020-04-14','','','2020-04-14','Housed','1','2');
INSERT INTO "Movement__c" VALUES(10,'False','2020-04-14','','','2020-04-14','Housed','1','2');
INSERT INTO "Movement__c" VALUES(11,'False','2020-04-14','','','2020-04-09','Transferred','1','10');
INSERT INTO "Movement__c" VALUES(12,'False','2020-04-14','','','2020-04-14','Transferred','1','10');
INSERT INTO "Movement__c" VALUES(13,'False','2020-04-23','','','2020-04-23','Transferred','1','10');
INSERT INTO "Movement__c" VALUES(14,'False','2020-04-09','','','2020-04-09','Fostered','1','11');
INSERT INTO "Movement__c" VALUES(15,'False','2020-04-23','','','2020-04-23','Fostered','1','11');
INSERT INTO "Movement__c" VALUES(16,'False','2020-04-14','','','2020-04-14','Fostered','1','11');
INSERT INTO "Movement__c" VALUES(17,'False','2020-04-23','','','2020-04-23','Boarding','1','5');
INSERT INTO "Movement__c" VALUES(18,'False','2020-04-23','','','2020-04-23','Housed','1','5');
INSERT INTO "Movement__c" VALUES(19,'False','2020-04-20','','','2020-04-20','Housed','1','9');
INSERT INTO "Movement__c" VALUES(20,'False','2020-04-23','','','2020-04-23','Housed','1','7');
INSERT INTO "Movement__c" VALUES(21,'False','2020-06-10','','','2020-04-30','Adopted, See Adoption Record','2','');
INSERT INTO "Movement__c" VALUES(22,'False','2020-04-30','','','2020-04-23','Housed','2','9');
INSERT INTO "Movement__c" VALUES(23,'False','2023-02-03','','','2020-06-10','Housed','2','7');
INSERT INTO "Movement__c" VALUES(24,'False','2020-04-30','','','2020-04-30','Housed','2','1');
INSERT INTO "Movement__c" VALUES(25,'False','2023-02-03','','','2023-02-03','Adopted, See Adoption Record','2','');
INSERT INTO "Movement__c" VALUES(26,'True','','','','2023-02-03','Adopted, See Adoption Record','2','');
INSERT INTO "Movement__c" VALUES(27,'True','','','','2023-02-03','Adopted, See Adoption Record','4','');
CREATE TABLE "OperatingHours" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	"TimeZone" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "Pricebook2" (
	id INTEGER NOT NULL, 
	"Description" VARCHAR(255), 
	"IsActive" VARCHAR(255), 
	"Name" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "PricebookEntry" (
	id INTEGER NOT NULL, 
	"IsActive" VARCHAR(255), 
	"UnitPrice" VARCHAR(255), 
	"UseStandardPrice" VARCHAR(255), 
	"Pricebook2Id" VARCHAR(255), 
	"Product2Id" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "Product2" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "QueueSobject" (
	id INTEGER NOT NULL, 
	"SobjectType" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "QueueSobject" VALUES(1,'Task');
INSERT INTO "QueueSobject" VALUES(2,'Task');
INSERT INTO "QueueSobject" VALUES(3,'Task');
CREATE TABLE "RecordType" (
	id INTEGER NOT NULL, 
	"DeveloperName" VARCHAR(255), 
	"Name" VARCHAR(255), 
	"SobjectType" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "RecordType" VALUES(1,'Exercise','Exercise','Animal_Action__c');
INSERT INTO "RecordType" VALUES(2,'Nutrition','Nutrition','Animal_Action__c');
INSERT INTO "RecordType" VALUES(3,'Treatment','Treatment','Animal_Action__c');
INSERT INTO "RecordType" VALUES(4,'Block','Block','Locations__c');
INSERT INTO "RecordType" VALUES(5,'Foster','Foster','Locations__c');
INSERT INTO "RecordType" VALUES(6,'Organisation','Organisation','Locations__c');
INSERT INTO "RecordType" VALUES(7,'Site','Site','Locations__c');
INSERT INTO "RecordType" VALUES(8,'Unit','Unit','Locations__c');
CREATE TABLE "ServiceContract" (
	id INTEGER NOT NULL, 
	"Name" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "Task" (
	id INTEGER NOT NULL, 
	"ActivityDate" VARCHAR(255), 
	"CallDisposition" VARCHAR(255), 
	"CallDurationInSeconds" VARCHAR(255), 
	"CallObject" VARCHAR(255), 
	"CallType" VARCHAR(255), 
	"Description" VARCHAR(255), 
	"IsRecurrence" VARCHAR(255), 
	"IsReminderSet" VARCHAR(255), 
	"Priority" VARCHAR(255), 
	"RecurrenceDayOfMonth" VARCHAR(255), 
	"RecurrenceDayOfWeekMask" VARCHAR(255), 
	"RecurrenceEndDateOnly" VARCHAR(255), 
	"RecurrenceInstance" VARCHAR(255), 
	"RecurrenceInterval" VARCHAR(255), 
	"RecurrenceMonthOfYear" VARCHAR(255), 
	"RecurrenceRegeneratedType" VARCHAR(255), 
	"RecurrenceStartDateOnly" VARCHAR(255), 
	"RecurrenceTimeZoneSidKey" VARCHAR(255), 
	"RecurrenceType" VARCHAR(255), 
	"ReminderDateTime" VARCHAR(255), 
	"Status" VARCHAR(255), 
	"Subject" VARCHAR(255), 
	"TaskSubtype" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Task" VALUES(1,'2023-02-08','','','','','','False','False','Normal','','','','','','','','','','','','Not Started','New Adopter Profile to review','Task');
INSERT INTO "Task" VALUES(2,'2023-02-08','','','','','','False','False','Normal','','','','','','','','','','','','Not Started','New Adopter Profile to review','Task');
INSERT INTO "Task" VALUES(3,'2023-02-08','','','','','','False','False','Normal','','','','','','','','','','','','Not Started','New Adopter Profile to review','Task');
INSERT INTO "Task" VALUES(4,'2023-02-08','','','','','','False','False','Normal','','','','','','','','','','','','Not Started','New Adopter Profile to review','Task');
CREATE TABLE "WorkBadgeDefinition" (
	id INTEGER NOT NULL, 
	"Description" VARCHAR(255), 
	"ImageUrl" VARCHAR(255), 
	"IsActive" VARCHAR(255), 
	"IsCompanyWide" VARCHAR(255), 
	"IsLimitPerUser" VARCHAR(255), 
	"LimitNumber" VARCHAR(255), 
	"LimitStartDate" VARCHAR(255), 
	"Name" VARCHAR(255), 
	PRIMARY KEY (id)
);
COMMIT;
