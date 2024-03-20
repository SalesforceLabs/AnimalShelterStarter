@isTest
private class AnimalHistoryWeightControllerTest {

    // Helper method to create a test animal and return its Id
    private static Id createTestAnimal() {
        animalshelters__Animal__c testAnimal = new animalshelters__Animal__c(animalshelters__Animal_Name__c = 'Tandy', animalshelters__Date_of_Arrival__c = Date.today());
        Insert testAnimal;
        return testAnimal.Id;
    }
    
    // Helper method to setup mock data
    private static void setupMockData() {
        
        List<AnimalHistoryWeightController.HistoryData> mockData = new List<AnimalHistoryWeightController.HistoryData> {
            new AnimalHistoryWeightController.HistoryData('2024-03-10', 20),
            new AnimalHistoryWeightController.HistoryData('2024-03-15', 22)
        };
        AnimalHistoryWeightController.MockHistoryDataService mockService = new AnimalHistoryWeightController.MockHistoryDataService(mockData);
    }

    @isTest
    static void testGetWeightHistoryWithMock() {
        
        setupMockData();
        Id testAnimalId = createTestAnimal();
        Integer numberOfDays = 30;

        Test.startTest();
        List<AnimalHistoryWeightController.HistoryData> result = AnimalHistoryWeightController.getWeightHistory(testAnimalId, numberOfDays);
        Test.stopTest();
        
        //Assert based on Mock Data
        //Test to see if animal exists
        List<animalshelters__Animal__c> animal = [SELECT Id, animalshelters__Animal_Name__c FROM animalshelters__Animal__c];
        System.assertEquals(true,animal.size()>0,'Read Animal Record Failed');
        
        System.assertNotEquals(null, result, 'The result should not be null.');
        System.assertEquals(2, result.size(), 'There should be two history records returned.');
        System.assertEquals('2024-03-10', result[0].cwDate, 'The first record should have the correct date.');
        System.assertEquals(20, result[0].cwWeight, 'The fiest record should have the correct weight.');
	}
}