


@IsTest
private class AnimalShelterOverviewControllerTest {
    @TestSetup
    static void setupTestData() {
        // Create RecordTypes
        Id siteRT = Schema.SObjectType.animalshelters__Locations__c.getRecordTypeInfosByName().get('Site').getRecordTypeId();
        Id blockRT = Schema.SObjectType.animalshelters__Locations__c.getRecordTypeInfosByName().get('Block').getRecordTypeId();
        Id subBlockRT = Schema.SObjectType.animalshelters__Locations__c.getRecordTypeInfosByName().get('SubBlock').getRecordTypeId();
        Id unitRT = Schema.SObjectType.animalshelters__Locations__c.getRecordTypeInfosByName().get('Unit').getRecordTypeId();

        // Create Site
        animalshelters__Locations__c site = new animalshelters__Locations__c(animalshelters__Name__c = 'Ruth\'s Shelter', RecordTypeId = siteRT);
        insert site;

        // Create Block under Site
        animalshelters__Locations__c block = new animalshelters__Locations__c(animalshelters__Name__c = 'Small Animals', RecordTypeId = blockRT, animalshelters__Parent_Block__c = site.Id);
        insert block;

        // Create SubBlock under Block
        animalshelters__Locations__c subBlock = new animalshelters__Locations__c(animalshelters__Name__c = 'Inside', RecordTypeId = subBlockRT, animalshelters__Parent_Block__c = block.Id);
        insert subBlock;

        // Create Units (directly under Block and under SubBlock)
        animalshelters__Locations__c runUnit = new animalshelters__Locations__c(animalshelters__Name__c = 'Run', RecordTypeId = unitRT, animalshelters__Parent_Block__c = block.Id);
        animalshelters__Locations__c hutch1Unit = new animalshelters__Locations__c(animalshelters__Name__c = 'Hutch1', RecordTypeId = unitRT, animalshelters__Parent_Block__c = subBlock.Id);
        animalshelters__Locations__c hutch2Unit = new animalshelters__Locations__c(animalshelters__Name__c = 'Hutch2', RecordTypeId = unitRT, animalshelters__Parent_Block__c = subBlock.Id);
        animalshelters__Locations__c hutch3Unit = new animalshelters__Locations__c(animalshelters__Name__c = 'Hutch3', RecordTypeId = unitRT, animalshelters__Parent_Block__c = subBlock.Id);
        insert new List<animalshelters__Locations__c>{runUnit, hutch1Unit, hutch2Unit, hutch3Unit};

        // Create Animals
        animalshelters__Animal__c furby = new animalshelters__Animal__c(animalshelters__Animal_Name__c = 'Furby', animalshelters__Animal_Status__c = 'New', animalshelters__Date_of_Arrival__c = Date.today());
        animalshelters__Animal__c tommy = new animalshelters__Animal__c(animalshelters__Animal_Name__c = 'Tommy', animalshelters__Animal_Status__c = 'New', animalshelters__Date_of_Arrival__c = Date.today());
        animalshelters__Animal__c toby = new animalshelters__Animal__c(animalshelters__Animal_Name__c = 'Toby', animalshelters__Animal_Status__c = 'New', animalshelters__Date_of_Arrival__c = Date.today());
        animalshelters__Animal__c molly = new animalshelters__Animal__c(animalshelters__Animal_Name__c = 'Molly', animalshelters__Animal_Status__c = 'New', animalshelters__Date_of_Arrival__c = Date.today());
        insert new List<animalshelters__Animal__c>{furby, tommy, toby, molly};

        // Create Movement records to link Animals to Units
        insert new List<animalshelters__Movement__c>{
            new animalshelters__Movement__c(animalshelters__Animal__c = furby.Id, animalshelters__Location__c = runUnit.Id),
            new animalshelters__Movement__c(animalshelters__Animal__c = tommy.Id, animalshelters__Location__c = runUnit.Id),
            new animalshelters__Movement__c(animalshelters__Animal__c = toby.Id, animalshelters__Location__c = hutch1Unit.Id),
            new animalshelters__Movement__c(animalshelters__Animal__c = molly.Id, animalshelters__Location__c = hutch3Unit.Id)
        };
    }

    @IsTest
    static void testGetSites() {
        Test.startTest();
        List<animalshelters__Locations__c> sites = AnimalShelterOverviewController.getSites();
        Test.stopTest();

        System.assertEquals(1, sites.size(), 'There should be exactly one Site returned.');
        System.assertEquals('Ruth\'s Shelter', sites[0].animalshelters__Name__c, 'Site name should be Ruth\'s Shelter.');
    }

    @IsTest
    static void testGetBlocks() {
        Test.startTest();
        List<animalshelters__Locations__c> blocks = AnimalShelterOverviewController.getBlocks([SELECT Id FROM animalshelters__Locations__c WHERE animalshelters__Name__c = 'Ruth\'s Shelter' LIMIT 1].Id);
        Test.stopTest();

        System.assertEquals(1, blocks.size(), 'There should be exactly one Block.');
        System.assertEquals('Small Animals', blocks[0].animalshelters__Name__c, 'Block name should be Small Animals.');
    }

    @IsTest
    static void testGetUnitsAndSubBlockUnits() {
        Id blockId = [SELECT Id FROM animalshelters__Locations__c WHERE animalshelters__Name__c = 'Small Animals' LIMIT 1].Id;

        Test.startTest();
        List<animalshelters__Locations__c> units = AnimalShelterOverviewController.getUnitsAndSubBlockUnits(blockId);
        Test.stopTest();

        System.assertEquals(4, units.size(), 'There should be exactly four Units retrieved.');
        List<String> unitNames = new List<String>();
        for (animalshelters__Locations__c unit : units) {
            unitNames.add(unit.animalshelters__Name__c);
        }
        System.assert(unitNames.contains('Run'), 'Run should be retrieved.');
        System.assert(unitNames.contains('Hutch1'), 'Hutch1 should be retrieved.');
        System.assert(unitNames.contains('Hutch2'), 'Hutch2 should be retrieved.');
        System.assert(unitNames.contains('Hutch3'), 'Hutch3 should be retrieved.');
    }

    @IsTest
    static void testGetAnimalsByUnit() {
        List<String> unitIds = new List<String>();
        for (animalshelters__Locations__c unit : [SELECT Id FROM animalshelters__Locations__c WHERE RecordType.DeveloperName = 'Unit']) {
            unitIds.add(unit.Id);
        }

        Test.startTest();
        Map<String, List<animalshelters__Animal__c>> unitAnimalMap = AnimalShelterOverviewController.getAnimalsByUnit(unitIds);
        Test.stopTest();

        System.assertEquals(4, unitAnimalMap.size(), 'There should be 4 units in the map.');

        String runUnitId = [SELECT Id FROM animalshelters__Locations__c WHERE animalshelters__Name__c = 'Run' LIMIT 1].Id.toString();
        String hutch1UnitId = [SELECT Id FROM animalshelters__Locations__c WHERE animalshelters__Name__c = 'Hutch1' LIMIT 1].Id.toString();
        String hutch2UnitId = [SELECT Id FROM animalshelters__Locations__c WHERE animalshelters__Name__c = 'Hutch2' LIMIT 1].Id.toString();
        String hutch3UnitId = [SELECT Id FROM animalshelters__Locations__c WHERE animalshelters__Name__c = 'Hutch3' LIMIT 1].Id.toString();

        // Correct way to check the size of the list in the map
        Integer runAnimalCount = unitAnimalMap.containsKey(runUnitId) && unitAnimalMap.get(runUnitId) != null ? unitAnimalMap.get(runUnitId).size() : 0;
        Integer hutch1AnimalCount = unitAnimalMap.containsKey(hutch1UnitId) && unitAnimalMap.get(hutch1UnitId) != null ? unitAnimalMap.get(hutch1UnitId).size() : 0;
        Integer hutch2AnimalCount = unitAnimalMap.containsKey(hutch2UnitId) && unitAnimalMap.get(hutch2UnitId) != null ? unitAnimalMap.get(hutch2UnitId).size() : 0;
        Integer hutch3AnimalCount = unitAnimalMap.containsKey(hutch3UnitId) && unitAnimalMap.get(hutch3UnitId) != null ? unitAnimalMap.get(hutch3UnitId).size() : 0;

        System.assertEquals(2, runAnimalCount, 'Run should have 2 animals.');
        System.assertEquals(1, hutch1AnimalCount, 'Hutch1 should have 1 animal.');
        System.assertEquals(1, hutch3AnimalCount, 'Hutch3 should have 1 animal.');
        System.assertEquals(0, hutch2AnimalCount, 'Hutch2 should have no animals.');
    }
}


