/**
 * @description       : Controller to Retrieve Animal History data from Current_Weight__c for X no of days
 * @author            : Chris Rolfe
 * @group             :
 * @last modified on  : 19-03-2024
 * @last modified by  : Chris Rolfe
**/
public class AnimalHistoryWeightController {
    
    //Interface for History Data Service
    public interface IHistoryDataService {
        List<HistoryData> getWeightHistory(String recordId, Integer noOfDays);
    }
    
    // Real Service Implementation
    public class RealHistoryDataService implements IHistoryDataService {
        public List<HistoryData> getWeightHistory(String recordId, Integer noOfDays) {
        	List<HistoryData> historyDataList = new List<HistoryData>();
            DateTime limitDate = DateTime.now().addDays(-noOfDays);
        
        	for (animalshelters__Animal__History history : [
            	SELECT OldValue, NewValue, CreatedDate
            	FROM animalshelters__Animal__History
            	WHERE Field = 'animalshelters__Current_Weight__c'
            	AND ParentId = :recordId
            	AND CreatedDate >= :limitDate
            	ORDER BY CreatedDate ASC
        	]) {
            	if (history.NewValue != null) {
                	String formattedDate = history.CreatedDate.format('yyyy-MM-dd');
                	Decimal newValue = (Decimal)history.NewValue;
                	historyDataList.add(new HistoryData(recordId, formattedDate, newValue));
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
    
    	public List<HistoryData> getWeightHistory(String recordId, Integer noOfDays) {
        return mockData;
    	}

	}

    //Method for testing to inject mock service
    //@TestVisible
    //private static void setMockService(IHistoryDataService mockService) {
    //    IHistoryDataService service = mockService;
    //}
    
    //Controller Logic
    @AuraEnabled(cacheable=true)
    public static List<HistoryData> getWeightHistory(String recordId, Integer noOfDays) {
        IHistoryDataService service = new RealHistoryDataService();
        return service.getWeightHistory(recordId, noOfDays);
    }

    public class HistoryData {
        @AuraEnabled public Id cwParentId {get; set;}
        @AuraEnabled public String cwDate {get; set;}
        @AuraEnabled public Decimal cwWeight {get; set;}

        public HistoryData(Id cwParentId, String cwDate, Decimal cwWeight) {
            this.cwParentId = cwParentId;
            this.cwDate = cwDate;
            this.cwWeight = cwWeight;
        }
    }
}