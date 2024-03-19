public class RealHistoryDataService implements IHistoryDataService {
    
    public List<AnimalHistoryWeightChartController.HistoryData> getWeightHistory(String recordId) {
        List<AnimalHistoryWeightChartController.HistoryData> historyDataList = new List<AnimalHistoryWeightChartController.HistoryData>();
        
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
                historyDataList.add(new AnimalHistoryWeightChartController.HistoryData(formattedDate, newValue));
            }
        }
        return historyDataList;
    }

}