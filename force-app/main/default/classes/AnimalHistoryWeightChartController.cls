/**
 * @description       : Controller to Retrieve Animal History data from Current_Weight__c for last 30 days
 * @author            : Chris Rolfe
 * @group             :
 * @last modified on  : 15-03-2024
 * @last modified by  : Chris Rolfe
**/
public with sharing class AnimalHistoryWeightChartController {
    
    private static IHistoryDataService service = new RealHistoryDataService();

    @AuraEnabled(cacheable=true)
    public static List<HistoryData> getWeightHistory(String recordId) {
        return service.getWeightHistory(recordId);
    }
    
    @TestVisible
    private static void setMockService(IHistoryDataService mockService) {
        service = mockService;
    }

    public class HistoryData {
        @AuraEnabled public String cwDate {get; set;}
        @AuraEnabled public Decimal cwWeight {get; set;}

        public HistoryData(String cwDate, Decimal cwWeight) {
            this.cwDate = cwDate;
            this.cwWeight = cwWeight;
        }
    }
}