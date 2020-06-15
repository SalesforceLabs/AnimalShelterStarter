BEGIN TRANSACTION;
CREATE TABLE "Account" (
	sf_id VARCHAR(255) NOT NULL, 
	"Name" VARCHAR(255), 
	"animalshelter__Active__c" VARCHAR(255), 
	"animalshelter__Animal_Organisation__c" VARCHAR(255), 
	"animalshelter__CustomerPriority__c" VARCHAR(255), 
	"animalshelter__Medicine_Manufacturer__c" VARCHAR(255), 
	"animalshelter__NumberofLocations__c" VARCHAR(255), 
	"animalshelter__SLAExpirationDate__c" VARCHAR(255), 
	"animalshelter__SLASerialNumber__c" VARCHAR(255), 
	"animalshelter__SLA__c" VARCHAR(255), 
	"animalshelter__UpsellOpportunity__c" VARCHAR(255), 
	"ParentId" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "Account" VALUES('0013z00002RKQrKAAX','RSPCA Southridge','','false','','false','','','','','','',NULL);
INSERT INTO "Account" VALUES('0013z00002QeTIgAAN','GenePoint','Yes','false','Low','false','1.0','2020-10-20','7324','Bronze','Yes','',NULL);
INSERT INTO "Account" VALUES('0013z00002QeTIeAAN','United Oil & Gas, UK','Yes','false','High','false','34.0','2020-04-19','3479','Platinum','No','',NULL);
INSERT INTO "Account" VALUES('0013z00002QeTIfAAN','United Oil & Gas, Singapore','Yes','false','High','false','6.0','2020-10-20','2457','Platinum','Maybe','',NULL);
INSERT INTO "Account" VALUES('0013z00002QeTIWAA3','Edge Communications','Yes','false','Medium','false','2.0','2020-04-19','2657','Silver','Maybe','',NULL);
INSERT INTO "Account" VALUES('0013z00002QeTIXAA3','Burlington Textiles Corp of America','','false','','false','6.0','2020-04-19','5367','Silver','Maybe','',NULL);
INSERT INTO "Account" VALUES('0013z00002QeTIYAA3','Pyramid Construction Inc.','Yes','false','','false','17.0','2020-10-20','9840','Silver','Maybe','',NULL);
INSERT INTO "Account" VALUES('0013z00002QeTIZAA3','Dickenson plc','Yes','false','Low','false','2.0','2020-10-20','7425','Bronze','No','',NULL);
INSERT INTO "Account" VALUES('0013z00002QeTIaAAN','Grand Hotels & Resorts Ltd','Yes','false','High','false','57.0','2020-10-20','5572','Gold','Yes','',NULL);
INSERT INTO "Account" VALUES('0013z00002QeTIcAAN','Express Logistics and Transport','Yes','false','Medium','false','150.0','2020-10-20','4724','Platinum','Maybe','',NULL);
INSERT INTO "Account" VALUES('0013z00002QeTIdAAN','University of Arizona','Yes','false','Medium','false','3.0','2020-04-19','8350','Gold','Yes','',NULL);
INSERT INTO "Account" VALUES('0013z00002QeTIbAAN','United Oil & Gas Corp.','Yes','false','High','false','955.0','2020-10-20','6654','Platinum','Yes','',NULL);
INSERT INTO "Account" VALUES('0013z00002QeTIhAAN','sForce','','false','','false','','','','','','',NULL);
CREATE TABLE "Case" (
	sf_id VARCHAR(255) NOT NULL, 
	"IsEscalated" VARCHAR(255), 
	"animalshelter__EngineeringReqNumber__c" VARCHAR(255), 
	"animalshelter__PotentialLiability__c" VARCHAR(255), 
	"animalshelter__Product__c" VARCHAR(255), 
	"animalshelter__SLAViolation__c" VARCHAR(255), 
	"AccountId" VARCHAR(255), 
	"ContactId" VARCHAR(255), 
	"ParentId" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "Case" VALUES('5003z000026N4oqAAC','false','765876','No','GC5040','No','0013z00002QeTIWAA3','0033z00002fsAupAAE','',NULL);
INSERT INTO "Case" VALUES('5003z000026N4orAAC','false','767145','Yes','GC1060','Yes','0013z00002QeTIbAAN','0033z00002fsAv6AAE','',NULL);
INSERT INTO "Case" VALUES('5003z000026N4osAAC','false','','No','GC3060','No','0013z00002QeTIbAAN','0033z00002fsAuwAAE','',NULL);
INSERT INTO "Case" VALUES('5003z000026N4otAAC','false','','No','GC1020','No','0013z00002QeTIcAAN','0033z00002fsAuyAAE','',NULL);
INSERT INTO "Case" VALUES('5003z000026N4ouAAC','false','784532','No','GC5020','No','0013z00002QeTIcAAN','0033z00002fsAuyAAE','',NULL);
INSERT INTO "Case" VALUES('5003z000026N4ovAAC','false','653780','Yes','GC1060','No','0013z00002QeTIcAAN','0033z00002fsAuzAAE','',NULL);
INSERT INTO "Case" VALUES('5003z000026N4owAAC','false','253574','No','GC1020','No','0013z00002QeTIgAAN','0033z00002fsAv5AAE','',NULL);
INSERT INTO "Case" VALUES('5003z000026N4oxAAC','false','835735','No','GC1040','No','0013z00002QeTIaAAN','0033z00002fsAuuAAE','',NULL);
INSERT INTO "Case" VALUES('5003z000026N4oyAAC','false','','No','GC1020','No','0013z00002QeTIaAAN','0033z00002fsAuuAAE','',NULL);
INSERT INTO "Case" VALUES('5003z000026N4ozAAC','false','365782','Yes','GC3040','No','0013z00002QeTIeAAN','0033z00002fsAv2AAE','',NULL);
INSERT INTO "Case" VALUES('5003z000026N4p0AAC','false','658733','No','GC1060','No','0013z00002QeTIfAAN','0033z00002fsAv3AAE','',NULL);
INSERT INTO "Case" VALUES('5003z000026N4p1AAC','false','965884','No','GC3020','No','0013z00002QeTIfAAN','0033z00002fsAv4AAE','',NULL);
INSERT INTO "Case" VALUES('5003z000026N4p2AAC','false','347209','Yes','GC1020','Yes','0013z00002QeTIdAAN','0033z00002fsAv0AAE','',NULL);
INSERT INTO "Case" VALUES('5003z000026N4p3AAC','false','654623','No','GC5020','No','0013z00002QeTIaAAN','0033z00002fsAuvAAE','',NULL);
INSERT INTO "Case" VALUES('5003z000026N4p4AAC','false','','Yes','GC3020','No','0013z00002QeTIaAAN','0033z00002fsAuvAAE','',NULL);
INSERT INTO "Case" VALUES('5003z000026N4p5AAC','false','354982','Yes','GC3060','No','0013z00002QeTIfAAN','0033z00002fsAv4AAE','',NULL);
INSERT INTO "Case" VALUES('5003z000026N4p6AAC','false','651375','No','GC5020','No','0013z00002QeTIgAAN','0033z00002fsAv5AAE','',NULL);
INSERT INTO "Case" VALUES('5003z000026N4p7AAC','false','736734','No','GC1040','No','0013z00002QeTIWAA3','0033z00002fsAuqAAE','',NULL);
INSERT INTO "Case" VALUES('5003z000026N4p8AAC','false','526714','No','GC1040','No','0013z00002QeTIWAA3','0033z00002fsAuqAAE','',NULL);
INSERT INTO "Case" VALUES('5003z000026N4p9AAC','false','636265','Yes','GC5060','No','0013z00002QeTIXAA3','0033z00002fsAurAAE','',NULL);
INSERT INTO "Case" VALUES('5003z000026N4pAAAS','false','237645','Yes','GC3060','No','0013z00002QeTIXAA3','0033z00002fsAurAAE','',NULL);
INSERT INTO "Case" VALUES('5003z000026N4pBAAS','false','435143','Yes','GC3060','','0013z00002QeTIbAAN','0033z00002fsAuwAAE','',NULL);
INSERT INTO "Case" VALUES('5003z000026N4pCAAS','false','456345','No','GC5060','No','0013z00002QeTIbAAN','0033z00002fsAuwAAE','',NULL);
INSERT INTO "Case" VALUES('5003z000026N4pDAAS','false','265794','No','GC5060','No','0013z00002QeTIbAAN','0033z00002fsAuwAAE','',NULL);
INSERT INTO "Case" VALUES('5003z000026N4pEAAS','false','868314','No','GC3040','No','0013z00002QeTIbAAN','0033z00002fsAuxAAE','',NULL);
INSERT INTO "Case" VALUES('5003z000026N4pFAAS','false','572546','No','GC5040','No','0013z00002QeTIbAAN','0033z00002fsAuxAAE','',NULL);
CREATE TABLE "Contact" (
	sf_id VARCHAR(255) NOT NULL, 
	"FirstName" VARCHAR(255), 
	"LastName" VARCHAR(255), 
	"animalshelter__Is_a_Foster__c" VARCHAR(255), 
	"animalshelter__Languages__c" VARCHAR(255), 
	"animalshelter__Level__c" VARCHAR(255), 
	"AccountId" VARCHAR(255), 
	"ReportsToId" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "Contact" VALUES('0033z00002gyxaoAAA','Chris','Rolfe','false','','','','',NULL);
INSERT INTO "Contact" VALUES('0033z00002g1NkeAAE','Sofia','Adopter','false','','','','',NULL);
INSERT INTO "Contact" VALUES('0033z00002fsAupAAE','Rose','Gonzalez','false','English','Primary','0013z00002QeTIWAA3','',NULL);
INSERT INTO "Contact" VALUES('0033z00002fsAuqAAE','Sean','Forbes','false','English','Secondary','0013z00002QeTIWAA3','',NULL);
INSERT INTO "Contact" VALUES('0033z00002fsAurAAE','Jack','Rogers','false','','','0013z00002QeTIXAA3','',NULL);
INSERT INTO "Contact" VALUES('0033z00002fsAusAAE','Pat','Stumuller','false','French, English','Primary','0013z00002QeTIYAA3','',NULL);
INSERT INTO "Contact" VALUES('0033z00002fsAutAAE','Andy','Young','false','English','Primary','0013z00002QeTIZAA3','',NULL);
INSERT INTO "Contact" VALUES('0033z00002fsAuuAAE','Tim','Barr','false','English','Secondary','0013z00002QeTIaAAN','',NULL);
INSERT INTO "Contact" VALUES('0033z00002fsAuvAAE','John','Bond','false','English','Primary','0013z00002QeTIaAAN','',NULL);
INSERT INTO "Contact" VALUES('0033z00002fsAuwAAE','Stella','Pavlova','false','English','Tertiary','0013z00002QeTIbAAN','',NULL);
INSERT INTO "Contact" VALUES('0033z00002fsAuxAAE','Lauren','Boyle','false','English','Secondary','0013z00002QeTIbAAN','',NULL);
INSERT INTO "Contact" VALUES('0033z00002fsAuyAAE','Babara','Levy','false','English','Primary','0013z00002QeTIcAAN','',NULL);
INSERT INTO "Contact" VALUES('0033z00002fsAuzAAE','Josh','Davis','false','English','Secondary','0013z00002QeTIcAAN','',NULL);
INSERT INTO "Contact" VALUES('0033z00002fsAv0AAE','Jane','Grey','false','English','Primary','0013z00002QeTIdAAN','',NULL);
INSERT INTO "Contact" VALUES('0033z00002fsAv1AAE','Arthur','Song','false','English','Secondary','0013z00002QeTIbAAN','',NULL);
INSERT INTO "Contact" VALUES('0033z00002fsAv2AAE','Ashley','James','false','English','Primary','0013z00002QeTIeAAN','',NULL);
INSERT INTO "Contact" VALUES('0033z00002fsAv3AAE','Tom','Ripley','false','English','Primary','0013z00002QeTIfAAN','',NULL);
INSERT INTO "Contact" VALUES('0033z00002fsAv4AAE','Liz','D''Cruz','false','English','Secondary','0013z00002QeTIfAAN','',NULL);
INSERT INTO "Contact" VALUES('0033z00002fsAv5AAE','Edna','Frank','false','English','Primary','0013z00002QeTIgAAN','',NULL);
INSERT INTO "Contact" VALUES('0033z00002fsAv6AAE','Avi','Green','false','English','Primary','0013z00002QeTIbAAN','',NULL);
INSERT INTO "Contact" VALUES('0033z00002fsAv7AAE','Siddartha','Nedaerk','false','','','0013z00002QeTIhAAN','',NULL);
INSERT INTO "Contact" VALUES('0033z00002fsAv8AAE','Jake','Llorrac','false','','','0013z00002QeTIhAAN','',NULL);
INSERT INTO "Contact" VALUES('0033z00002gMz0nAAC','A','Benn','true','','','','',NULL);
CREATE TABLE "Lead" (
	sf_id VARCHAR(255) NOT NULL, 
	"FirstName" VARCHAR(255), 
	"LastName" VARCHAR(255), 
	"Company" VARCHAR(255), 
	"IsConverted" VARCHAR(255), 
	"IsUnreadByOwner" VARCHAR(255), 
	"Status" VARCHAR(255), 
	"animalshelter__CurrentGenerators__c" VARCHAR(255), 
	"animalshelter__NumberofLocations__c" VARCHAR(255), 
	"animalshelter__Primary__c" VARCHAR(255), 
	"animalshelter__ProductInterest__c" VARCHAR(255), 
	"animalshelter__SICCode__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "Lead" VALUES('00Q3z00001AmqLYEAZ','Bertha','Boxer','Farmers Coop. of Florida','false','true','Working - Contacted','All','130.0','Yes','GC5000 series','2768',NULL);
INSERT INTO "Lead" VALUES('00Q3z00001AmqLZEAZ','Phyllis','Cotton','Abbott Insurance','false','true','Open - Not Contacted','All','130.0','Yes','GC5000 series','2768',NULL);
INSERT INTO "Lead" VALUES('00Q3z00001AmqLaEAJ','Jeff','Glimpse','Jackson Controls','false','true','Open - Not Contacted','All','130.0','Yes','GC5000 series','2768',NULL);
INSERT INTO "Lead" VALUES('00Q3z00001AmqLbEAJ','Mike','Braund','Metropolitan Health Services','false','true','Open - Not Contacted','All','130.0','Yes','GC5000 series','2768',NULL);
INSERT INTO "Lead" VALUES('00Q3z00001AmqLcEAJ','Patricia','Feager','International Shipping Co.','false','true','Working - Contacted','All','130.0','Yes','GC5000 series','2768',NULL);
INSERT INTO "Lead" VALUES('00Q3z00001AmqLdEAJ','Brenda','Mcclure','Cadinal Inc.','false','true','Working - Contacted','All','130.0','Yes','GC5000 series','2768',NULL);
INSERT INTO "Lead" VALUES('00Q3z00001AmqLeEAJ','Violet','Maccleod','Emerson Transport','false','true','Working - Contacted','All','130.0','Yes','GC5000 series','2768',NULL);
INSERT INTO "Lead" VALUES('00Q3z00001AmqLfEAJ','Kathy','Snyder','TNR Corp.','false','true','Working - Contacted','All','130.0','Yes','GC5000 series','2768',NULL);
INSERT INTO "Lead" VALUES('00Q3z00001AmqLgEAJ','Tom','James','Delphi Chemicals','false','true','Working - Contacted','All','130.0','Yes','GC5000 series','2768',NULL);
INSERT INTO "Lead" VALUES('00Q3z00001AmqLhEAJ','Shelly','Brownell','Western Telecommunications Corp.','false','true','Working - Contacted','All','130.0','Yes','GC5000 series','2768',NULL);
INSERT INTO "Lead" VALUES('00Q3z00001AmqLiEAJ','Pamela','Owenby','Hendrickson Trading','false','true','Closed - Not Converted','John Deere','3.0','Yes','GC5000 series','7267',NULL);
INSERT INTO "Lead" VALUES('00Q3z00001AmqLjEAJ','Norm','May','Greenwich Media','false','true','Working - Contacted','All','130.0','Yes','GC5000 series','2768',NULL);
INSERT INTO "Lead" VALUES('00Q3z00001AmqLkEAJ','Pat','Stumuller','Pyramid Construction Inc.','false','true','Closed - Converted','All','130.0','Yes','GC5000 series','2768',NULL);
INSERT INTO "Lead" VALUES('00Q3z00001AmqLlEAJ','Andy','Young','Dickenson plc','false','true','Closed - Converted','All','130.0','Yes','GC5000 series','2768',NULL);
INSERT INTO "Lead" VALUES('00Q3z00001AmqLmEAJ','Kristen','Akin','Aethna Home Products','false','true','Working - Contacted','All','130.0','Yes','GC5000 series','2768',NULL);
INSERT INTO "Lead" VALUES('00Q3z00001AmqLnEAJ','David','Monaco','Blues Entertainment Corp.','false','true','Working - Contacted','All','130.0','Yes','GC5000 series','2768',NULL);
INSERT INTO "Lead" VALUES('00Q3z00001AmqLoEAJ','Carolyn','Crenshaw','Ace Iron and Steel Inc.','false','true','Closed - Not Converted','All','130.0','Yes','GC5000 series','2768',NULL);
INSERT INTO "Lead" VALUES('00Q3z00001AmqLpEAJ','Jack','Rogers','Burlington Textiles Corp of America','false','true','Closed - Converted','John Deere','3.0','Yes','GC5000 series','7267',NULL);
INSERT INTO "Lead" VALUES('00Q3z00001AmqLqEAJ','Bill','Dadio Jr','Zenith Industrial Partners','false','true','Closed - Not Converted','John Deere','3.0','Yes','GC5000 series','7267',NULL);
INSERT INTO "Lead" VALUES('00Q3z00001AmqLrEAJ','Eugena','Luce','Pacific Retail Group','false','true','Closed - Not Converted','All','130.0','Yes','GC5000 series','2768',NULL);
INSERT INTO "Lead" VALUES('00Q3z00001AmqLsEAJ','Sandra','Eberhard','Highland Manufacturing Ltd.','false','true','Working - Contacted','All','130.0','Yes','GC5000 series','2768',NULL);
INSERT INTO "Lead" VALUES('00Q3z00001AmqLtEAJ','Betty','Bair','American Banking Corp.','false','true','Working - Contacted','All','130.0','Yes','GC5000 series','2768',NULL);
CREATE TABLE "Opportunity" (
	sf_id VARCHAR(255) NOT NULL, 
	"Name" VARCHAR(255), 
	"CloseDate" VARCHAR(255), 
	"IsPrivate" VARCHAR(255), 
	"StageName" VARCHAR(255), 
	"animalshelter__CurrentGenerators__c" VARCHAR(255), 
	"animalshelter__DeliveryInstallationStatus__c" VARCHAR(255), 
	"animalshelter__MainCompetitors__c" VARCHAR(255), 
	"animalshelter__OrderNumber__c" VARCHAR(255), 
	"animalshelter__TrackingNumber__c" VARCHAR(255), 
	"AccountId" VARCHAR(255), 
	"ContactId" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "Opportunity" VALUES('0063z000014qkNeAAI','Dickenson Mobile Generators','2020-02-02','false','Qualification','','','Honda','','','0013z00002QeTIZAA3','',NULL);
INSERT INTO "Opportunity" VALUES('0063z000014qkNfAAI','United Oil Office Portable Generators','2020-01-21','false','Negotiation/Review','Yamaha','','Yamaha','','','0013z00002QeTIbAAN','',NULL);
INSERT INTO "Opportunity" VALUES('0063z000014qkNgAAI','Express Logistics Standby Generator','2019-12-17','false','Closed Won','Hawkpower','','Fujitsu','653276','830150301420','0013z00002QeTIcAAN','',NULL);
INSERT INTO "Opportunity" VALUES('0063z000014qkNhAAI','GenePoint Standby Generator','2020-01-24','false','Closed Won','Honda','Completed','Honda','908676','830150301420','0013z00002QeTIgAAN','',NULL);
INSERT INTO "Opportunity" VALUES('0063z000014qkNiAAI','Grand Hotels Kitchen Generator','2019-12-12','false','Id. Decision Makers','John Deere','Yet to begin','Fujitsu, Hawkpower','','','0013z00002QeTIaAAN','',NULL);
INSERT INTO "Opportunity" VALUES('0063z000014qkNjAAI','United Oil Refinery Generators','2020-03-06','false','Proposal/Price Quote','Caterpillar','Yet to begin','John Deere','','','0013z00002QeTIbAAN','',NULL);
INSERT INTO "Opportunity" VALUES('0063z000014qkNkAAI','United Oil SLA','2020-03-13','false','Closed Won','','In progress','','926363','','0013z00002QeTIbAAN','',NULL);
INSERT INTO "Opportunity" VALUES('0063z000014qkNlAAI','Grand Hotels Guest Portable Generators','2020-03-21','false','Value Proposition','Honda','Yet to begin','Honda','','','0013z00002QeTIaAAN','',NULL);
INSERT INTO "Opportunity" VALUES('0063z000014qkNmAAI','Edge Emergency Generator','2020-03-21','false','Closed Won','John Deere','Completed','John Deere','731645','830150301420','0013z00002QeTIWAA3','',NULL);
INSERT INTO "Opportunity" VALUES('0063z000014qkNnAAI','University of AZ Portable Generators','2019-12-21','false','Closed Won','Mitsubishi','Completed','Honda, Mitsubishi','768934','830150301360','0013z00002QeTIdAAN','',NULL);
INSERT INTO "Opportunity" VALUES('0063z000014qkNoAAI','Pyramid Emergency Generators','2020-01-29','false','Prospecting','','','','','','0013z00002QeTIYAA3','',NULL);
INSERT INTO "Opportunity" VALUES('0063z000014qkNpAAI','Express Logistics Portable Truck Generators','2019-12-15','false','Value Proposition','Fujitsu','Yet to begin','Honda','','','0013z00002QeTIcAAN','',NULL);
INSERT INTO "Opportunity" VALUES('0063z000014qkNqAAI','GenePoint Lab Generators','2020-03-15','false','Id. Decision Makers','Hawkpower, Fujitsu','Yet to begin','Hawkpower','','','0013z00002QeTIgAAN','',NULL);
INSERT INTO "Opportunity" VALUES('0063z000014qkNrAAI','GenePoint SLA','2020-03-18','false','Closed Won','','In progress','','546512','','0013z00002QeTIgAAN','',NULL);
INSERT INTO "Opportunity" VALUES('0063z000014qkNsAAI','United Oil Installations','2020-01-17','false','Negotiation/Review','','Yet to begin','','','','0013z00002QeTIbAAN','',NULL);
INSERT INTO "Opportunity" VALUES('0063z000014qkNtAAI','Edge Installation','2020-01-11','false','Closed Won','','Completed','','835178','','0013z00002QeTIWAA3','',NULL);
INSERT INTO "Opportunity" VALUES('0063z000014qkNuAAI','Edge SLA','2019-12-07','false','Closed Won','','','','847564','','0013z00002QeTIWAA3','',NULL);
INSERT INTO "Opportunity" VALUES('0063z000014qkNvAAI','United Oil Installations','2020-01-16','false','Closed Won','','In progress','','427609','','0013z00002QeTIbAAN','',NULL);
INSERT INTO "Opportunity" VALUES('0063z000014qkNwAAI','Grand Hotels Generator Installations','2020-03-04','false','Closed Won','','Completed','','763546','','0013z00002QeTIaAAN','',NULL);
INSERT INTO "Opportunity" VALUES('0063z000014qkNxAAI','United Oil Refinery Generators','2020-02-28','false','Closed Won','John Deere','Completed','John Deere, Mitsubishi, Hawkpower','744343','830150301360','0013z00002QeTIbAAN','',NULL);
INSERT INTO "Opportunity" VALUES('0063z000014qkNyAAI','University of AZ Installations','2019-12-18','false','Proposal/Price Quote','','Yet to begin','','','','0013z00002QeTIdAAN','',NULL);
INSERT INTO "Opportunity" VALUES('0063z000014qkNzAAI','Express Logistics SLA','2019-12-16','false','Perception Analysis','','In progress','','','','0013z00002QeTIcAAN','',NULL);
INSERT INTO "Opportunity" VALUES('0063z000014qkO0AAI','University of AZ SLA','2019-12-25','false','Closed Won','','In progress','','654985','','0013z00002QeTIdAAN','',NULL);
INSERT INTO "Opportunity" VALUES('0063z000014qkO1AAI','Burlington Textiles Weaving Plant Generator','2020-01-26','false','Closed Won','John Deere','Yet to begin','John Deere','645612','830150301360','0013z00002QeTIXAA3','',NULL);
INSERT INTO "Opportunity" VALUES('0063z000014qkO2AAI','United Oil Installations','2020-01-28','false','Closed Won','','In progress','','554821','','0013z00002QeTIbAAN','',NULL);
INSERT INTO "Opportunity" VALUES('0063z000014qkO3AAI','United Oil Emergency Generators','2020-01-10','false','Closed Won','Fujitsu','Completed','Honda, Mitsubishi','847324','830150301420','0013z00002QeTIbAAN','',NULL);
INSERT INTO "Opportunity" VALUES('0063z000014qkO4AAI','Grand Hotels SLA','2019-12-14','false','Closed Won','','In progress','','254676','','0013z00002QeTIaAAN','',NULL);
INSERT INTO "Opportunity" VALUES('0063z000014qkO5AAI','United Oil Standby Generators','2020-03-14','false','Closed Won','John Deere','','John Deere, Mitsubishi, Hawkpower','525476','830150301360','0013z00002QeTIbAAN','',NULL);
INSERT INTO "Opportunity" VALUES('0063z000014qkO6AAI','Grand Hotels Emergency Generators','2020-03-02','false','Closed Won','Fujitsu','Completed','Caterpillar','387624','830150301360','0013z00002QeTIaAAN','',NULL);
INSERT INTO "Opportunity" VALUES('0063z000014qkO7AAI','United Oil Plant Standby Generators','2020-02-14','false','Needs Analysis','Caterpillar','','Caterpillar, Mitsubishi, Hawkpower','','','0013z00002QeTIbAAN','',NULL);
INSERT INTO "Opportunity" VALUES('0063z000014qkO8AAI','Edge Emergency Generator','2020-03-27','false','Id. Decision Makers','','','John Deere, Mitsubishi, Hawkpower','','','0013z00002QeTIWAA3','',NULL);
CREATE TABLE "animalshelter__Adoption__c" (
	sf_id VARCHAR(255) NOT NULL, 
	"animalshelter__Adoption_Stage__c" VARCHAR(255), 
	"animalshelter__Current_Daytime_Arrangements__c" VARCHAR(255), 
	"animalshelter__Date_Collected__c" VARCHAR(255), 
	"animalshelter__Date_Returned__c" VARCHAR(255), 
	"animalshelter__Date_of_Adoption__c" VARCHAR(255), 
	"animalshelter__Declined_Reason__c" VARCHAR(255), 
	"animalshelter__Facilities_Available__c" VARCHAR(255), 
	"animalshelter__Location_of_Animal_Daytime__c" VARCHAR(255), 
	"animalshelter__Location_of_Animal_Night_time__c" VARCHAR(255), 
	"animalshelter__Other_Pets_Animals__c" VARCHAR(255), 
	"animalshelter__Reason_for_Adoption__c" VARCHAR(255), 
	"animalshelter__Returned_Reason__c" VARCHAR(255), 
	"animalshelter__Total_Adults__c" VARCHAR(255), 
	"animalshelter__Total_Children__c" VARCHAR(255), 
	"animalshelter__Trial_End_Date_Time__c" VARCHAR(255), 
	"animalshelter__Type_of_Accommodation__c" VARCHAR(255), 
	"animalshelter__Animal__c" VARCHAR(255), 
	"animalshelter__Local_Vet__c" VARCHAR(255), 
	"animalshelter__Primary_Contact__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "animalshelter__Adoption__c" VALUES('a023z00000wMoWfAAK','Initial Review','','','','','','','','','','','','','','','','a003z00000rlhSbAAI','','0033z00002g1NkeAAE',NULL);
INSERT INTO "animalshelter__Adoption__c" VALUES('a023z00000wLbPwAAK','Initial Review','','2020-03-27','2020-06-30','2020-03-27','','','','','','','','','','','','a003z00000rlhSbAAI','','0033z00002g1NkeAAE',NULL);
CREATE TABLE "animalshelter__Animal_Action__c" (
	sf_id VARCHAR(255) NOT NULL, 
	"RecordTypeId" VARCHAR(255), 
	"animalshelter__Action_Completed__c" VARCHAR(255), 
	"animalshelter__Action_Status__c" VARCHAR(255), 
	"animalshelter__Comments__c" VARCHAR(255), 
	"animalshelter__Date_Time_Action_Completed__c" VARCHAR(255), 
	"animalshelter__Date_Time_of_Action__c" VARCHAR(255), 
	"animalshelter__Description__c" VARCHAR(255), 
	"animalshelter__Exercise_Duration__c" VARCHAR(255), 
	"animalshelter__Treatment_Type__c" VARCHAR(255), 
	"animalshelter__Animal__c" VARCHAR(255), 
	"animalshelter__Condition__c" VARCHAR(255), 
	"animalshelter__Given_By__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "animalshelter__Animal_Action__c" VALUES('a0B3z000027xs1dEAA','0123z000000lAxzAAE','false','','','','2020-06-10T10:30:00.000Z','Walk','','','a003z00000rlhSbAAI','','',NULL);
INSERT INTO "animalshelter__Animal_Action__c" VALUES('a0B3z000027xs1eEAA','0123z000000lAxzAAE','false','','','','2020-06-13T10:30:00.000Z','Walk','','','a003z00000rlhSbAAI','','',NULL);
INSERT INTO "animalshelter__Animal_Action__c" VALUES('a0B3z000027xs1fEAA','0123z000000lAxzAAE','false','','','','2020-06-12T10:30:00.000Z','Walk','','','a003z00000rlhSbAAI','','',NULL);
INSERT INTO "animalshelter__Animal_Action__c" VALUES('a0B3z000027xs1gEAA','0123z000000lAxzAAE','false','','','','2020-06-11T10:30:00.000Z','Walk','','','a003z00000rlhSbAAI','','',NULL);
INSERT INTO "animalshelter__Animal_Action__c" VALUES('a0B3z000027NTSbEAO','0123z000000lAxzAAE','true','','Slight Limp','2020-04-24T17:00:00.000Z','2020-04-24T15:00:00.000Z','Long Walk','2.0','','a003z00000roJxDAAU','','0033z00002gyxaoAAA',NULL);
INSERT INTO "animalshelter__Animal_Action__c" VALUES('a0B3z000027NTScEAO','0123z000000lAxzAAE','false','','','','2020-05-22T15:00:00.000Z','Long Walk','','','a003z00000roJxDAAU','','',NULL);
INSERT INTO "animalshelter__Animal_Action__c" VALUES('a0B3z000027NTSdEAO','0123z000000lAxzAAE','true','','','2020-05-15T17:00:00.000Z','2020-05-15T15:00:00.000Z','Long Walk','2.0','','a003z00000roJxDAAU','','0033z00002gMz0nAAC',NULL);
INSERT INTO "animalshelter__Animal_Action__c" VALUES('a0B3z000027NTSeEAO','0123z000000lAxzAAE','true','','','2020-05-08T17:00:00.000Z','2020-05-08T15:00:00.000Z','Long Walk','2.0','','a003z00000roJxDAAU','','0033z00002gMz0nAAC',NULL);
INSERT INTO "animalshelter__Animal_Action__c" VALUES('a0B3z000027NTSfEAO','0123z000000lAxzAAE','false','','','','2020-05-01T15:00:00.000Z','Long Walk','','','a003z00000roJxDAAU','','',NULL);
INSERT INTO "animalshelter__Animal_Action__c" VALUES('a0B3z000027NTSWEA4','0123z000000lAxuAAE','false','Scheduled','','','2020-04-24T12:00:00.000Z','Administer Medicine','','Medicine','a003z00000roJxDAAU','','',NULL);
INSERT INTO "animalshelter__Animal_Action__c" VALUES('a0B3z000027NTSXEA4','0123z000000lAxuAAE','false','','','','2020-04-28T12:00:00.000Z','Administer Medicine','','Medicine','a003z00000roJxDAAU','','',NULL);
INSERT INTO "animalshelter__Animal_Action__c" VALUES('a0B3z000027NTSYEA4','0123z000000lAxuAAE','false','','','','2020-04-27T12:00:00.000Z','Administer Medicine','','Medicine','a003z00000roJxDAAU','','',NULL);
INSERT INTO "animalshelter__Animal_Action__c" VALUES('a0B3z000027NTSZEA4','0123z000000lAxuAAE','false','','','','2020-04-26T12:00:00.000Z','Administer Medicine','','Medicine','a003z00000roJxDAAU','','',NULL);
INSERT INTO "animalshelter__Animal_Action__c" VALUES('a0B3z000027NTSaEAO','0123z000000lAxuAAE','false','','','','2020-04-25T12:00:00.000Z','Administer Medicine','','Medicine','a003z00000roJxDAAU','','',NULL);
INSERT INTO "animalshelter__Animal_Action__c" VALUES('a0B3z000027NTSgEAO','0123z000000lAy4AAE','false','','','','2020-04-24T15:30:00.000Z','Check Weight','','','a003z00000roJxDAAU','','',NULL);
INSERT INTO "animalshelter__Animal_Action__c" VALUES('a0B3z000027NTShEAO','0123z000000lAy4AAE','false','','','','2020-05-24T15:30:00.000Z','Check Weight','','','a003z00000roJxDAAU','','',NULL);
INSERT INTO "animalshelter__Animal_Action__c" VALUES('a0B3z000027v663EAA','0123z000000lAxuAAE','false','','','','2020-04-30T15:57:53.000Z','test','','Medicine','a003z00000rlhSbAAI','a043z00000vsOsdAAE','',NULL);
INSERT INTO "animalshelter__Animal_Action__c" VALUES('a0B3z000027v664EAA','0123z000000lAxuAAE','false','','','','2020-05-01T15:57:53.000Z','test','','Medicine','a003z00000rlhSbAAI','a043z00000vsOsdAAE','',NULL);
INSERT INTO "animalshelter__Animal_Action__c" VALUES('a0B3z000027xUzfEAE','0123z000000lAxzAAE','true','','','','2020-05-14T12:19:56.000Z','Walk','1.0','','a003z00000roJxDAAU','','',NULL);
CREATE TABLE "animalshelter__Animal_Action__c_rt_mapping" (
	record_type_id VARCHAR(18) NOT NULL, 
	developer_name VARCHAR(255), 
	PRIMARY KEY (record_type_id)
);
INSERT INTO "animalshelter__Animal_Action__c_rt_mapping" VALUES('0123z000000lAxzAAE','Exercise');
INSERT INTO "animalshelter__Animal_Action__c_rt_mapping" VALUES('0123z000000lAy4AAE','Nutrition');
INSERT INTO "animalshelter__Animal_Action__c_rt_mapping" VALUES('0123z000000lAxuAAE','Treatment');
CREATE TABLE "animalshelter__Animal_Alert__c" (
	sf_id VARCHAR(255) NOT NULL, 
	"animalshelter__Alert_Message__c" VARCHAR(255), 
	"animalshelter__End_Date_Time__c" VARCHAR(255), 
	"animalshelter__Start_Date_Time__c" VARCHAR(255), 
	"animalshelter__Animal__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "animalshelter__Animal_Alert__c" VALUES('a063z00001OQRfhAAH','Animal Marked as Lost/Found, Please scan for Identifier and contact relevant agency.','2020-05-23T10:34:11.000Z','2020-04-23T10:34:11.000Z','a003z00000roJxDAAU',NULL);
INSERT INTO "animalshelter__Animal_Alert__c" VALUES('a063z00001Nv1fiAAB','Test Alert 2','2020-04-05T11:00:00.000Z','2020-04-04T16:01:00.000Z','a003z00000rlhSbAAI',NULL);
INSERT INTO "animalshelter__Animal_Alert__c" VALUES('a063z00001Nv1g0AAB','Test Alert 3','2020-04-05T11:00:00.000Z','2020-03-31T16:01:00.000Z','a003z00000rlhSbAAI',NULL);
INSERT INTO "animalshelter__Animal_Alert__c" VALUES('a063z00001Nv1mrAAB','Elsa is currently receiving treatment which means that she cannot be taken on walks for the next two weeks.','2020-06-19T11:00:00.000Z','2020-06-05T16:37:00.000Z','a003z00000rlhSbAAI',NULL);
INSERT INTO "animalshelter__Animal_Alert__c" VALUES('a063z00001Nv1fdAAB','Test Alert 1 - Testing Update','2020-04-13T11:00:00.000Z','2020-04-05T16:01:00.000Z','a003z00000rlhSbAAI',NULL);
INSERT INTO "animalshelter__Animal_Alert__c" VALUES('a063z00001OR0RLAA1','Test Alert','','2020-04-30T11:16:02.000Z','a003z00000tFPgtAAG',NULL);
INSERT INTO "animalshelter__Animal_Alert__c" VALUES('a063z00001OR5slAAD','Test Alert','','2020-05-01T09:20:29.000Z','a003z00000rlhSbAAI',NULL);
CREATE TABLE "animalshelter__Animal__c" (
	sf_id VARCHAR(255) NOT NULL, 
	"animalshelter__Animal_Name__c" VARCHAR(255), 
	"animalshelter__Animal_Status__c" VARCHAR(255), 
	"animalshelter__Behaviours__c" VARCHAR(255), 
	"animalshelter__Breed__c" VARCHAR(255), 
	"animalshelter__Coat_Type__c" VARCHAR(255), 
	"animalshelter__Colour__c" VARCHAR(255), 
	"animalshelter__Crossbreed__c" VARCHAR(255), 
	"animalshelter__Current_Weight__c" VARCHAR(255), 
	"animalshelter__Date_of_Arrival__c" VARCHAR(255), 
	"animalshelter__Date_of_Birth__c" VARCHAR(255), 
	"animalshelter__Deceased_Date__c" VARCHAR(255), 
	"animalshelter__Entry_Comments__c" VARCHAR(255), 
	"animalshelter__Entry_Reason__c" VARCHAR(255), 
	"animalshelter__Estimated_Age__c" VARCHAR(255), 
	"animalshelter__Gender__c" VARCHAR(255), 
	"animalshelter__Hold_Until_Date_Time__c" VARCHAR(255), 
	"animalshelter__Lost_Found__c" VARCHAR(255), 
	"animalshelter__Microchip__c" VARCHAR(255), 
	"animalshelter__Neutered_Spayed_Date_Time__c" VARCHAR(255), 
	"animalshelter__Neutered_Spayed__c" VARCHAR(255), 
	"animalshelter__PTS_Reason__c" VARCHAR(255), 
	"animalshelter__Rehoming_Requirements__c" VARCHAR(255), 
	"animalshelter__Related_Schemes__c" VARCHAR(255), 
	"animalshelter__Secondary_Colour__c" VARCHAR(255), 
	"animalshelter__Size__c" VARCHAR(255), 
	"animalshelter__Total_Adoption_Days__c" VARCHAR(255), 
	"animalshelter__Total_Away_Days__c" VARCHAR(255), 
	"animalshelter__Total_Length_of_Stay_in_Shelter_Days__c" VARCHAR(255), 
	"animalshelter__Type__c" VARCHAR(255), 
	"animalshelter__Account__c" VARCHAR(255), 
	"animalshelter__Previous_Current_Owner__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "animalshelter__Animal__c" VALUES('a003z00000roJxDAAU','Molly','Deceased','','Dutch','Short','Black','false','','2016-04-01T11:00:00.000Z','2013-02-04','2020-04-20T00:00:00.000Z','','','','Female','','false','','','true','','','','White','Small','','','12.0','Rabbit','','',NULL);
INSERT INTO "animalshelter__Animal__c" VALUES('a003z00000tFPgtAAG','Tommy','New','','English Spot','Short','White','false','','2020-04-23T10:39:08.000Z','','','','','5.0','Male','','false','','','false','','','','Brown','Large','','','0.0','Rabbit','','',NULL);
INSERT INTO "animalshelter__Animal__c" VALUES('a003z00000rlhSbAAI','Elsa','Available for Adoption','Bad Recall;Good with Children;Good with other species;Good with same species;Pulls on Lead','Labrador Retriever','Short','Blond','false','26.7','2020-03-25T12:00:00.000Z','2014-08-15','','','Boarding','5.5','Female','','false','911246546456','2020-04-01T11:00:00.000Z','true','','Cannot be left for long periods;Dietary;Secure Garden','Home for Life','','Large','','','49.0','Dog','','',NULL);
CREATE TABLE "animalshelter__Condition__c" (
	sf_id VARCHAR(255) NOT NULL, 
	"animalshelter__Condition_Description__c" VARCHAR(255), 
	"animalshelter__End_Date_Time__c" VARCHAR(255), 
	"animalshelter__Start_Date__c" VARCHAR(255), 
	"animalshelter__Animal__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "animalshelter__Condition__c" VALUES('a043z00000vsOsdAAE','Arthritis - Rear Legs','','2020-03-26T09:27:58.000Z','a003z00000rlhSbAAI',NULL);
CREATE TABLE "animalshelter__Exercise__c" (
	sf_id VARCHAR(255) NOT NULL, 
	"animalshelter__Comments__c" VARCHAR(255), 
	"animalshelter__Date_and_Time_of_Exercise__c" VARCHAR(255), 
	"animalshelter__Duration_Hours__c" VARCHAR(255), 
	"animalshelter__Animal__c" VARCHAR(255), 
	"animalshelter__Exercise_Action__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "animalshelter__Exercise__c" VALUES('a053z00000rlShKAAU','','2020-03-26T14:25:51.000Z','2.0','a003z00000rlhSbAAI','',NULL);
CREATE TABLE "animalshelter__Housing__c" (
	sf_id VARCHAR(255) NOT NULL, 
	"animalshelter__Active__c" VARCHAR(255), 
	"animalshelter__Building__c" VARCHAR(255), 
	"animalshelter__End_Date_Time__c" VARCHAR(255), 
	"animalshelter__Pen_Cage_Reference__c" VARCHAR(255), 
	"animalshelter__Start_Date__c" VARCHAR(255), 
	"animalshelter__Animal__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "animalshelter__Housing__c" VALUES('a033z00001E2CUgAAN','false','Block B','2020-03-25T18:46:45.000Z','125','2020-03-25T18:44:23.000Z','a003z00000rlhSbAAI',NULL);
INSERT INTO "animalshelter__Housing__c" VALUES('a033z00001E2Cd6AAF','false','Block A','','5','2020-03-25T19:10:53.000Z','a003z00000rlhSbAAI',NULL);
INSERT INTO "animalshelter__Housing__c" VALUES('a033z00001E2CVXAA3','false','Block A','2020-03-25T19:10:53.000Z','1','2020-03-25T18:46:45.000Z','a003z00000rlhSbAAI',NULL);
CREATE TABLE "animalshelter__Locations__c" (
	sf_id VARCHAR(255) NOT NULL, 
	"RecordTypeId" VARCHAR(255), 
	"animalshelter__Animal_Preference_Foster__c" VARCHAR(255), 
	"animalshelter__Assessment_Due__c" VARCHAR(255), 
	"animalshelter__Available_Capacity__c" VARCHAR(255), 
	"animalshelter__Available_for_Boarding__c" VARCHAR(255), 
	"animalshelter__Block_Status__c" VARCHAR(255), 
	"animalshelter__Last_Assessment_Date__c" VARCHAR(255), 
	"animalshelter__Name__c" VARCHAR(255), 
	"animalshelter__Total_Capacity__c" VARCHAR(255), 
	"animalshelter__Unit_Status__c" VARCHAR(255), 
	"animalshelter__Foster_Contact__c" VARCHAR(255), 
	"animalshelter__Organisation__c" VARCHAR(255), 
	"animalshelter__Parent_Block__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "animalshelter__Locations__c" VALUES('a073z00001FSTZGAA5','0123z000000l7JIAAY','','','0.0','false','','','Pen 4','','Available','','','a073z00001EImZSAA1',NULL);
INSERT INTO "animalshelter__Locations__c" VALUES('a073z00001EIWD3AAP','0123z000000l7JIAAY','','2021-05-13','0.0','false','','2020-05-13','Cage 2','','Available','','','a073z00001EIWCtAAP',NULL);
INSERT INTO "animalshelter__Locations__c" VALUES('a073z00001EIWD4AAP','0123z000000l7JNAAY','','','0.0','false','','','RSPCA Southridge','','Available','','0013z00002RKQrKAAX','',NULL);
INSERT INTO "animalshelter__Locations__c" VALUES('a073z00001EIWCyAAP','0123z000000l7JIAAY','','2021-05-13','0.0','true','','2020-05-13','Cage 1','','Allocated','','','a073z00001EIWCtAAP',NULL);
INSERT INTO "animalshelter__Locations__c" VALUES('a073z00001EIWCtAAP','0123z000000l7JDAAY','','','2.0','false','Available','','Kennel Block A','2.0','','','','',NULL);
INSERT INTO "animalshelter__Locations__c" VALUES('a073z00001EImZXAA1','0123z000000l7JIAAY','','','0.0','true','','2020-04-15','Pen 1','','Available','','','a073z00001EImZSAA1',NULL);
INSERT INTO "animalshelter__Locations__c" VALUES('a073z00001EIWD8AAP','0123z000000l7JSAAY','Cat;Dog','','0.0','false','','','Mr Benn','','Available','0033z00002gMz0nAAC','','',NULL);
INSERT INTO "animalshelter__Locations__c" VALUES('a073z00001EImZSAA1','0123z000000l7JDAAY','','2020-10-09','3.0','false','Available','2020-04-15','Small Animals','4.0','','','','',NULL);
INSERT INTO "animalshelter__Locations__c" VALUES('a073z00001EImZhAAL','0123z000000l7JIAAY','','','0.0','false','','2020-04-15','Pen 3','','Allocated','','','a073z00001EImZSAA1',NULL);
INSERT INTO "animalshelter__Locations__c" VALUES('a073z00001FSjcsAAD','0123z000000l7JSAAY','Bird','','0.0','false','','','Bert','','','','','',NULL);
INSERT INTO "animalshelter__Locations__c" VALUES('a073z00001EImZcAAL','0123z000000l7JIAAY','','','0.0','false','','2020-04-15','Pen 2','','Available','','','a073z00001EImZSAA1',NULL);
CREATE TABLE "animalshelter__Locations__c_rt_mapping" (
	record_type_id VARCHAR(18) NOT NULL, 
	developer_name VARCHAR(255), 
	PRIMARY KEY (record_type_id)
);
INSERT INTO "animalshelter__Locations__c_rt_mapping" VALUES('0123z000000l7JDAAY','Block');
INSERT INTO "animalshelter__Locations__c_rt_mapping" VALUES('0123z000000l7JSAAY','Foster');
INSERT INTO "animalshelter__Locations__c_rt_mapping" VALUES('0123z000000l7JNAAY','Organisation');
INSERT INTO "animalshelter__Locations__c_rt_mapping" VALUES('0123z000000l7JIAAY','Unit');
CREATE TABLE "animalshelter__Medicine_Used__c" (
	sf_id VARCHAR(255) NOT NULL, 
	"animalshelter__Date_Time_Used__c" VARCHAR(255), 
	"animalshelter__Qty_Measure__c" VARCHAR(255), 
	"animalshelter__Qty_Used__c" VARCHAR(255), 
	"animalshelter__Medicine_Used__c" VARCHAR(255), 
	"animalshelter__Treatment_Used_In__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "animalshelter__Medicine_Used__c" VALUES('a0A3z00001QO1xKEAT','2020-06-10T11:00:00.000Z','millilitres','1.0','a093z00002SobAVAAZ','a0B3z000027v663EAA',NULL);
INSERT INTO "animalshelter__Medicine_Used__c" VALUES('a0A3z00001QL0e1EAD','2020-04-24T11:00:00.000Z','millilitres','0.7','a093z00002SobAVAAZ','a0B3z000027NTSWEA4',NULL);
INSERT INTO "animalshelter__Medicine_Used__c" VALUES('a0A3z00001QLpczEAD','2020-04-29T11:00:00.000Z','millilitres','0.8','a093z00002SobAVAAZ','a0B3z000027NTSXEA4',NULL);
CREATE TABLE "animalshelter__Medicine__c" (
	sf_id VARCHAR(255) NOT NULL, 
	"animalshelter__Active__c" VARCHAR(255), 
	"animalshelter__Batch_No__c" VARCHAR(255), 
	"animalshelter__Category__c" VARCHAR(255), 
	"animalshelter__Comments__c" VARCHAR(255), 
	"animalshelter__Delivery_Method__c" VARCHAR(255), 
	"animalshelter__Medicine_Name__c" VARCHAR(255), 
	"animalshelter__Manufacturer__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "animalshelter__Medicine__c" VALUES('a093z00002SobAVAAZ','true','1203848','AntiInflammatory','','','Metacam','',NULL);
CREATE TABLE "animalshelter__Movement__c" (
	sf_id VARCHAR(255) NOT NULL, 
	"animalshelter__Current__c" VARCHAR(255), 
	"animalshelter__End_Date__c" VARCHAR(255), 
	"animalshelter__Start_Date__c" VARCHAR(255), 
	"animalshelter__Type__c" VARCHAR(255), 
	"animalshelter__Animal__c" VARCHAR(255), 
	"animalshelter__Location__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "animalshelter__Movement__c" VALUES('a083z00001MtG5XAAV','true','','2020-06-10','Housed','a003z00000tFPgtAAG','a073z00001EImZhAAL',NULL);
INSERT INTO "animalshelter__Movement__c" VALUES('a083z00001MtG6LAAV','true','','2020-06-10','Housed','a003z00000rlhSbAAI','a073z00001EIWCyAAP',NULL);
INSERT INTO "animalshelter__Movement__c" VALUES('a083z00001Msf4wAAB','false','2020-04-09','2020-04-09','Housed','a003z00000roJxDAAU','a073z00001EIWCyAAP',NULL);
INSERT INTO "animalshelter__Movement__c" VALUES('a083z00001Msf51AAB','false','2020-04-09','2020-04-09','Fostered','a003z00000roJxDAAU','a073z00001EIWD8AAP',NULL);
INSERT INTO "animalshelter__Movement__c" VALUES('a083z00001MsivLAAR','false','2020-04-20','2020-04-20','Adopted, See Adoption Record','a003z00000roJxDAAU','',NULL);
INSERT INTO "animalshelter__Movement__c" VALUES('a083z00001MsivMAAR','false','2020-04-23','2020-04-20','Deceased','a003z00000roJxDAAU','',NULL);
INSERT INTO "animalshelter__Movement__c" VALUES('a083z00001MsjjoAAB','false','2020-06-10','2020-04-22','Housed','a003z00000rlhSbAAI','a073z00001EIWD3AAP',NULL);
INSERT INTO "animalshelter__Movement__c" VALUES('a083z00001Msf5BAAR','false','2020-04-14','2020-04-09','Transferred','a003z00000roJxDAAU','a073z00001EIWD4AAP',NULL);
INSERT INTO "animalshelter__Movement__c" VALUES('a083z00001MskPsAAJ','false','2020-04-23','2020-04-23','Boarding','a003z00000roJxDAAU','a073z00001EImZXAA1',NULL);
INSERT INTO "animalshelter__Movement__c" VALUES('a083z00001MskPtAAJ','false','2020-04-23','2020-04-23','Housed','a003z00000roJxDAAU','a073z00001EImZhAAL',NULL);
INSERT INTO "animalshelter__Movement__c" VALUES('a083z00001MskPxAAJ','false','2020-04-23','2020-04-23','Fostered','a003z00000roJxDAAU','a073z00001EIWD8AAP',NULL);
INSERT INTO "animalshelter__Movement__c" VALUES('a083z00001MsivGAAR','false','2020-04-20','2020-04-20','Housed','a003z00000roJxDAAU','a073z00001EImZcAAL',NULL);
INSERT INTO "animalshelter__Movement__c" VALUES('a083z00001MskQCAAZ','false','2020-04-30','2020-04-23','Housed','a003z00000tFPgtAAG','a073z00001EImZcAAL',NULL);
INSERT INTO "animalshelter__Movement__c" VALUES('a083z00001MskQ7AAJ','true','2020-04-23','2020-04-23','Deceased','a003z00000roJxDAAU','',NULL);
INSERT INTO "animalshelter__Movement__c" VALUES('a083z00001MskPnAAJ','false','2020-04-23','2020-04-23','Housed','a003z00000roJxDAAU','a073z00001EImZXAA1',NULL);
INSERT INTO "animalshelter__Movement__c" VALUES('a083z00001MsthEAAR','false','2020-04-30','2020-04-30','Housed','a003z00000tFPgtAAG','a073z00001FSTZGAA5',NULL);
INSERT INTO "animalshelter__Movement__c" VALUES('a083z00001MsthJAAR','false','2020-06-10','2020-04-30','Adopted, See Adoption Record','a003z00000tFPgtAAG','',NULL);
INSERT INTO "animalshelter__Movement__c" VALUES('a083z00001MsgJcAAJ','false','2020-04-20','2020-04-14','Housed','a003z00000roJxDAAU','a073z00001EIWCyAAP',NULL);
INSERT INTO "animalshelter__Movement__c" VALUES('a083z00001MsgJXAAZ','false','2020-04-14','2020-04-14','Transferred','a003z00000roJxDAAU','a073z00001EIWD4AAP',NULL);
INSERT INTO "animalshelter__Movement__c" VALUES('a083z00001MskQ2AAJ','false','2020-04-23','2020-04-23','Transferred','a003z00000roJxDAAU','a073z00001EIWD4AAP',NULL);
INSERT INTO "animalshelter__Movement__c" VALUES('a083z00001Msg9eAAB','false','2020-04-14','2020-04-14','Fostered','a003z00000roJxDAAU','a073z00001EIWD8AAP',NULL);
INSERT INTO "animalshelter__Movement__c" VALUES('a083z00001Msg9fAAB','false','2020-04-14','2020-04-14','Housed','a003z00000roJxDAAU','a073z00001EIWD3AAP',NULL);
INSERT INTO "animalshelter__Movement__c" VALUES('a083z00001Msg9UAAR','false','2020-04-14','2020-04-14','Housed','a003z00000roJxDAAU','a073z00001EIWD3AAP',NULL);
INSERT INTO "animalshelter__Movement__c" VALUES('a083z00001Msf56AAB','false','2020-04-09','2020-04-09','Boarding','a003z00000roJxDAAU','a073z00001EIWCyAAP',NULL);
CREATE TABLE "animalshelter__Treatment__c" (
	sf_id VARCHAR(255) NOT NULL, 
	"animalshelter__Date_Time_of_Treatment__c" VARCHAR(255), 
	"animalshelter__Description__c" VARCHAR(255), 
	"animalshelter__Treatment_Comments__c" VARCHAR(255), 
	"animalshelter__Treatment_Status__c" VARCHAR(255), 
	"animalshelter__Treatment_Type__c" VARCHAR(255), 
	"animalshelter__Animal__c" VARCHAR(255), 
	"animalshelter__Condition__c" VARCHAR(255), 
	"animalshelter__Treatment_Given_By__c" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "animalshelter__Treatment__c" VALUES('a013z00001OKlb9AAD','2020-06-10T10:48:47.000Z','Worms','','Scheduled','Medicine','a003z00000rlhSbAAI','a043z00000vsOsdAAE','',NULL);
INSERT INTO "animalshelter__Treatment__c" VALUES('a013z00001MZfhEAAT','2020-03-26T11:36:14.000Z','worming treatment 123','','','Medicine','a003z00000rlhSbAAI','a043z00000vsOsdAAE','',NULL);
INSERT INTO "animalshelter__Treatment__c" VALUES('a013z00001MZfhFAAT','2020-04-02T11:36:14.000Z','worming treatment 123','','','Medicine','a003z00000rlhSbAAI','a043z00000vsOsdAAE','',NULL);
INSERT INTO "animalshelter__Treatment__c" VALUES('a013z00001MZfhGAAT','2020-04-01T11:36:14.000Z','worming treatment 123','','','Medicine','a003z00000rlhSbAAI','a043z00000vsOsdAAE','',NULL);
INSERT INTO "animalshelter__Treatment__c" VALUES('a013z00001MZfhHAAT','2020-03-31T11:36:14.000Z','worming treatment 123','','','Medicine','a003z00000rlhSbAAI','a043z00000vsOsdAAE','',NULL);
INSERT INTO "animalshelter__Treatment__c" VALUES('a013z00001MZfhIAAT','2020-03-30T11:36:14.000Z','worming treatment 123','','','Medicine','a003z00000rlhSbAAI','a043z00000vsOsdAAE','',NULL);
INSERT INTO "animalshelter__Treatment__c" VALUES('a013z00001MZfhJAAT','2020-03-29T11:36:14.000Z','worming treatment 123','','','Medicine','a003z00000rlhSbAAI','a043z00000vsOsdAAE','',NULL);
INSERT INTO "animalshelter__Treatment__c" VALUES('a013z00001MZfhKAAT','2020-03-28T11:36:14.000Z','worming treatment 123','','','Medicine','a003z00000rlhSbAAI','a043z00000vsOsdAAE','',NULL);
INSERT INTO "animalshelter__Treatment__c" VALUES('a013z00001MZfhLAAT','2020-03-27T11:36:14.000Z','worming treatment 123','','','Medicine','a003z00000rlhSbAAI','a043z00000vsOsdAAE','',NULL);
INSERT INTO "animalshelter__Treatment__c" VALUES('a013z00001MZfgsAAD','2020-06-26T11:09:25.000Z','Medicine 123','','','Medicine','a003z00000rlhSbAAI','','',NULL);
INSERT INTO "animalshelter__Treatment__c" VALUES('a013z00001MZfgtAAD','2020-05-26T11:09:25.000Z','Medicine 123','','','Medicine','a003z00000rlhSbAAI','','',NULL);
INSERT INTO "animalshelter__Treatment__c" VALUES('a013z00001MZfguAAD','2020-04-26T11:09:25.000Z','Medicine 123','','','Medicine','a003z00000rlhSbAAI','','',NULL);
INSERT INTO "animalshelter__Treatment__c" VALUES('a013z00001MZfgvAAD','2020-04-02T11:10:39.000Z','1 Hour Walk','','','Physio','a003z00000rlhSbAAI','','',NULL);
INSERT INTO "animalshelter__Treatment__c" VALUES('a013z00001MZfgwAAD','2020-04-01T11:10:39.000Z','1 Hour Walk','','','Physio','a003z00000rlhSbAAI','','',NULL);
INSERT INTO "animalshelter__Treatment__c" VALUES('a013z00001MZfgxAAD','2020-03-31T11:10:39.000Z','1 Hour Walk','','','Physio','a003z00000rlhSbAAI','','',NULL);
INSERT INTO "animalshelter__Treatment__c" VALUES('a013z00001MZfgyAAD','2020-03-30T11:10:39.000Z','1 Hour Walk','','','Physio','a003z00000rlhSbAAI','','',NULL);
INSERT INTO "animalshelter__Treatment__c" VALUES('a013z00001MZfgzAAD','2020-03-29T11:10:39.000Z','1 Hour Walk','','','Physio','a003z00000rlhSbAAI','','',NULL);
INSERT INTO "animalshelter__Treatment__c" VALUES('a013z00001MZfh0AAD','2020-03-28T11:10:39.000Z','1 Hour Walk','','','Physio','a003z00000rlhSbAAI','','',NULL);
INSERT INTO "animalshelter__Treatment__c" VALUES('a013z00001MZfh1AAD','2020-03-27T11:10:39.000Z','1 Hour Walk','','','Physio','a003z00000rlhSbAAI','','',NULL);
INSERT INTO "animalshelter__Treatment__c" VALUES('a013z00001NqNKhAAN','2020-04-15T11:00:00.000Z','Metaform','','Given','Medicine','a003z00000roJxDAAU','','',NULL);
INSERT INTO "animalshelter__Treatment__c" VALUES('a013z00001OHFOUAA5','2020-04-24T16:10:29.000Z','hgkjg','','Scheduled','Medicine','a003z00000roJxDAAU','','',NULL);
INSERT INTO "animalshelter__Treatment__c" VALUES('a013z00001OKAezAAH','2020-05-28T15:08:35.000Z','ggdt','','Scheduled','Medicine','a003z00000rlhSbAAI','','',NULL);
INSERT INTO "animalshelter__Treatment__c" VALUES('a013z00001MZfRXAA1','2020-03-26T09:28:37.000Z','Daily Physio needed','','','Physio','a003z00000rlhSbAAI','a043z00000vsOsdAAE','',NULL);
INSERT INTO "animalshelter__Treatment__c" VALUES('a013z00001MZflyAAD','2020-03-26T11:55:05.000Z','De-Wormer Monthly','','','Medicine','a003z00000rlhSbAAI','a043z00000vsOsdAAE','',NULL);
INSERT INTO "animalshelter__Treatment__c" VALUES('a013z00001MZflzAAD','2020-05-26T11:55:05.000Z','De-Wormer Monthly','','','Medicine','a003z00000rlhSbAAI','a043z00000vsOsdAAE','',NULL);
INSERT INTO "animalshelter__Treatment__c" VALUES('a013z00001MZfm0AAD','2020-04-26T11:55:05.000Z','De-Wormer Monthly','','','Medicine','a003z00000rlhSbAAI','a043z00000vsOsdAAE','',NULL);
INSERT INTO "animalshelter__Treatment__c" VALUES('a013z00001MZfm3AAD','2020-03-26T11:56:05.000Z','test','','','Medicine','a003z00000rlhSbAAI','','',NULL);
INSERT INTO "animalshelter__Treatment__c" VALUES('a013z00001MZfm4AAD','2020-06-26T11:56:05.000Z','test','','Scheduled','Medicine','a003z00000rlhSbAAI','','',NULL);
INSERT INTO "animalshelter__Treatment__c" VALUES('a013z00001MZfm5AAD','2020-05-26T11:56:05.000Z','test','','','Medicine','a003z00000rlhSbAAI','','',NULL);
INSERT INTO "animalshelter__Treatment__c" VALUES('a013z00001MZfm6AAD','2020-04-26T11:56:05.000Z','test','','','Medicine','a003z00000rlhSbAAI','','',NULL);
INSERT INTO "animalshelter__Treatment__c" VALUES('a013z00001MZfh4AAD','2020-04-16T11:16:08.000Z','de-worming','','','Vaccination','a003z00000rlhSbAAI','','',NULL);
INSERT INTO "animalshelter__Treatment__c" VALUES('a013z00001MZfh5AAD','2020-04-09T11:16:08.000Z','de-worming','','','Vaccination','a003z00000rlhSbAAI','','',NULL);
INSERT INTO "animalshelter__Treatment__c" VALUES('a013z00001MZfh6AAD','2020-04-02T11:16:08.000Z','de-worming','','','Vaccination','a003z00000rlhSbAAI','','',NULL);
COMMIT;
