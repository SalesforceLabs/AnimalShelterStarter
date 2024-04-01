/**
 * @description       : Controller to Retrieve Animal History data from Current_Weight__c for X no of days
 * @author            : Chris Rolfe
 * @group             :
 * @last modified on  : 19-03-2024
 * @last modified by  : Chris Rolfe
**/
public with sharing class AnimalHistoryWeightController {
    
    @TestVisible private static AnimalHistoryService historyService = new AnimalHistoryServiceImpl();
    
    @AuraEnabled(cacheable=true)
    public static List<HistoryData> getWeightHistory(String recordId, Integer noOfDays) {
        return historyService.getWeightHistory(recordId, noOfDays);
    }
    
    public interface AnimalHistoryService {
        List<HistoryData> getWeightHistory(String recordId, Integer noOfDays);
    }
    
    private class AnimalHistoryServiceImpl implements AnimalHistoryService {
        public List<HistoryData> getWeightHistory(String recordId, Integer noOfDays) {
            List<HistoryData> historyDataList = new List<HistoryData>();
            DateTime limitDate = DateTime.now().addDays(-noOfDays);
        
            for (animalshelters__Animal__History history : [
                SELECT OldValue, NewValue, CreatedDate
                FROM animalshelters__Animal__History
                WHERE Field = 'animalshelters__Current_Weight__c'
                AND ParentId = :recordId
                AND CreatedDate >= :limitDate
                WITH SECURITY_ENFORCED
                ORDER BY CreatedDate ASC
            ]) {
                if (history.NewValue != null) {
                    String formattedDate = history.CreatedDate.format('yyyy-MM-dd');
                    Decimal newValue = (Decimal)history.NewValue;
                    historyDataList.add(new HistoryData(formattedDate, newValue));
                }
            }
            return historyDataList;
        }

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