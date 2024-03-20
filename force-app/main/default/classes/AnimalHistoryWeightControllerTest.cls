@isTest
private class AnimalHistoryWeightControllerTest {

     // Helper method to create a test animal and return its Id
     Private static Id createTestAnimal() {
        animalshelters__Animal__c testAnimal = new animalshelters__Animal__c(animalshelters__Animal_Name__c = 'Tandy', animalshelters__Date_of_Arrival__c = Date.today());
        Insert testAnimal;
        return testAnimal.Id;
    }
    
    private class MockAnimalHistoryService implements AnimalHistoryWeightController.AnimalHistoryService {
        private List<AnimalHistoryWeightController.HistoryData> mockResponse;
        
        public MockAnimalHistoryService(List<AnimalHistoryWeightController.HistoryData> mockResponse) {
            this.mockResponse = mockResponse;
        }

        public List<AnimalHistoryWeightController.HistoryData> getWeightHistory(String recordId, Integer noOfDays) {
            return this.mockResponse;
        }
    }
    

    @isTest
    static void testGetWeightHistoryWithMock() {

        Id testAnimalId = createTestAnimal();
        Integer numberOfDays = 30;
    
        List<AnimalHistoryWeightController.HistoryData> mockResponse = new List<AnimalHistoryWeightController.HistoryData> {
            new AnimalHistoryWeightController.HistoryData('2024-03-10', 20),
            new AnimalHistoryWeightController.HistoryData('2024-03-15', 22)
        };
        
        AnimalHistoryWeightController.historyService = new MockAnimalHistoryService(mockResponse);

        Test.startTest();
        List<AnimalHistoryWeightController.HistoryData> result = AnimalHistoryWeightController.getWeightHistory(testAnimalId, numberOfDays);
        Test.stopTest();
        
        //Assert based on Mock Data

        List<animalshelters__Animal__c> animal = [SELECT Id, animalshelters__Animal_Name__c FROM animalshelters__Animal__c];
        System.assertEquals(true,animal.size()>0,'Read Animal Record Failed');

        System.assertNotEquals(null, result, 'The result should not be null.');
        System.assertEquals(2, result.size(), 'There should be two history records returned.');
        System.assertEquals('2024-03-10', result[0].cwDate, 'The first record should have the correct date.');
        System.assertEquals(20, result[0].cwWeight, 'The first record should have the correct weight.');
        System.assertEquals('2024-03-15', result[1].cwDate, 'The second record should have the correct date.');
        System.assertEquals(22, result[1].cwWeight, 'The second record should have the correct weight.');

    }

    @isTest
    static void testGetWeightHistoryWithNoMockData() {

        Id testAnimalId = createTestAnimal();
        Integer numberOfDays = 30;

        List<AnimalHistoryWeightController.HistoryData> mockResponseEmpty = new List<AnimalHistoryWeightController.HistoryData>();
        AnimalHistoryWeightController.historyService = new MockAnimalHistoryService(mockResponseEmpty);

        Test.startTest();
        List<AnimalHistoryWeightController.HistoryData> resultEmpty = AnimalHistoryWeightController.getWeightHistory(testAnimalId, numberOfDays);
        Test.stopTest();
        
        System.assertEquals(0, resultEmpty.Size(), 'Expected no history data returned');

    }
}