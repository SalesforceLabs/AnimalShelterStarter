/**
 * @description       : Controller to Retrieve Animal History data from Current_Weight__c for last 30 days
 * @author            : Chris Rolfe
 * @group             :
 * @last modified on  : 15-03-2024
 * @last modified by  : Chris Rolfe
**/
public with sharing class AnimalHistoryWeightChartController {

    @AuraEnabled(cacheable=true)
    public static List<HistoryData> getWeigthHistory(String recordId) {
        List<HistoryData> historyDataList = new List<HistoryData>();
        
        // Get data for the last 30 days, and use format() method on CreatedDate
        for (animalshelters__Animal__History history : [SELECT OldValue, NewValue, CreatedDate
                                                        FROM animalshelters__Animal__History
                                                        WHERE Field = 'animalshelters__Current_Weight__c' 
                                                        AND CreatedDate > LAST_N_DAYS:30
                                                        AND ParentId = :recordId
                                                        WITH SECURITY_ENFORCED
                                                        ORDER BY CreatedDate ASC]) {
            if(history.NewValue != null) {
                historyDataList.add(new HistoryData(history.CreatedDate.format('yyyy-MM-dd'), (Decimal)history.NewValue));
            }
        }
        return historyDataList;
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
        