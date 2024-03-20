/**
 * @description       : Controller to Retrieve Animal History data from Current_Weight__c for last 30 days
 * @author            : Chris Rolfe
 * @group             :
 * @last modified on  : 19-03-2024
 * @last modified by  : Chris Rolfe
**/
public class AnimalHistoryWeightController {
    
    //Interface for History Data Service
    public interface IHistoryDataService {
        List<HistoryData> getWeightHistory(String recordId);
    }
    
    // Real Service Implementation
    public class RealHistoryDataService implements IHistoryDataService {
        public List<HistoryData> getWeightHistory(String recordId) {
        	List<HistoryData> historyDataList = new List<HistoryData>();
        
        	for (animalshelters__Animal__History history : [
            	SELECT OldValue, NewValue, CreatedDate
            	FROM animalshelters__Animal__History
            	WHERE Field = 'animalshelters__Current_Weight__c'
            	AND ParentId = :recordId
            	AND CreatedDate = LAST_N_DAYS:30
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
    
    //Mock service implementation for Testing
    @TestVisible
    private class MockHistoryDataService implements IHistoryDataService {
        private List<HistoryData> mockData;
        
        public MockHistoryDataService(List<HistoryData> mockData) {
        this.mockData = mockData;
    	}
    
    	public List<HistoryData> getWeightHistory(String recordId) {
        return mockData;
    	}

	}
    
    //Controller Logic
    @AuraEnabled(cacheable=true)
    public static List<HistoryData> getWeightHistory(String recordId) {
        IHistoryDataService service = new RealHistoryDataService();
        return service.getWeightHistory(recordId);
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