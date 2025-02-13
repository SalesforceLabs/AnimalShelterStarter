public with sharing class GetAnimalsByDate {

    @InvocableMethod(label='Get Animals by Date' description='Returns a list of animals by date' Category='Animal')
    public static List<animalshelters__Animal__c> getAnimalsByDateRange(List<Request> requests) {

        // Create a list to hold the results
        List<animalshelters__Animal__c> results = new List<animalshelters__Animal__c>();

        // Loop through each request to handle multiple inputs if needed
        for (Request request : requests) {
            if (request.InputDate == null) {
                continue; // Skip if InputDate is null
            }

            // Calculate start and end DateTime for the given date
            DateTime startDate = DateTime.newInstance(request.InputDate.year(), request.InputDate.month(), request.InputDate.day(), 0, 0, 1);
            DateTime endDate = DateTime.newInstance(request.InputDate.year(), request.InputDate.month(), request.InputDate.day(), 23, 59, 59);

            // Query Animal records with specified range
            List<animalshelters__Animal__c> animals = [
                SELECT Id, animalshelters__Animal_Name__c, animalshelters__Date_of_Arrival__c
                FROM animalshelters__Animal__c
                WHERE (animalshelters__Date_of_Arrival__c >= :startDate AND animalshelters__Date_of_Arrival__c <= :endDate)
            ];
            //Add queried Records
            results.addAll(animals);

        }
        // Return the results
        return results;
    }

    // Define the structure for the Invocable request
    public class Request {
        @InvocableVariable(label='Input Date' description='Input Date' required=true)
        public Date inputDate;
    
    }
}