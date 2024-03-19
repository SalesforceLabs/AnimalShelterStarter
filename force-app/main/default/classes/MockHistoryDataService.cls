public class MockHistoryDataService implements IHistoryDataService {
    private List<AnimalHistoryWeightChartController.HistoryData> mockData;
    
    public MockHistoryDataService(List<AnimalHistoryWeightChartController.HistoryData> mockData) {
        this.mockData = mockData;
    }
    
    public List<AnimalHistoryWeightChartController.HistoryData> getWeightHistory(String recordId) {
        return mockData;
    }

}